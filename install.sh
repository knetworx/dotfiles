#!/bin/bash
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
# DOTFILES is the directory in which this script exists
DOTFILES="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

case "$(uname -s)" in
	MINGW*|MSYS*|CYGWIN*) IS_WINDOWS=1 ;;
	*) IS_WINDOWS=0 ;;
esac

# Native Windows can't make unprivileged file symlinks (only unprivileged junctions, which are
# dir-only). Since install.sh is a rarely-rerun, one-time-per-machine setup step, we require
# elevation up front rather than silently falling back to copies, which is what caused this
# repo to drift from ~/ for years without anyone noticing.
if [[ $IS_WINDOWS == 1 ]]; then
	if ! net session >/dev/null 2>&1; then
		echo "install.sh needs to create real file symlinks, which requires admin rights on Windows."
		echo "Right-click your terminal (Git Bash) and choose 'Run as administrator', then re-run install.sh."
		exit 1
	fi
fi

lnfiles=(.bashrc .aliases .clang-format .functions .env_vars .gvimrc .inputrc .profile .vim .vimrc vimdiff.sh vimdiffsvn.sh colors.bash)

shopt -s nullglob
cpfiles=(.*.example)

function cleanfile {
	if [ -e $1 ]; then
		if [ -h $1 ]; then
			echo "Removing symbolic link: $1"
			rm "$1"
		else
			echo "Moving $1 to ${1}.bak"
			mv "$1" "${1}.bak"
		fi
	fi
}

function winpath {
	if command -v cygpath >/dev/null 2>&1; then
		cygpath -w "$1"
	else
		local p="$1"
		p="$(printf '%s' "$p" | sed -E 's#^/([a-zA-Z])/#\1:/#')"
		printf '%s' "${p//\//\\}"
	fi
}

# $1 = name to create in $PWD, $2 = source path to link it to
function makelink {
	local file="$1"
	local target="$2"
	if [[ $IS_WINDOWS == 1 ]]; then
		# MSYS_NO_PATHCONV keeps Git Bash from mangling the /J switch before cmd sees it
		local wtarget="$(winpath "$target")"
		local wlink="$(winpath "$PWD/$file")"
		if [ -d "$target" ]; then
			MSYS_NO_PATHCONV=1 cmd /c mklink /J "$wlink" "$wtarget" >/dev/null
		else
			MSYS_NO_PATHCONV=1 cmd /c mklink "$wlink" "$wtarget" >/dev/null
		fi
	else
		ln -sf "$target" "$file"
	fi
}

pushd ~
echo "Creating links from dotfiles directory"
for file in ${lnfiles[@]}; do
	cleanfile $file
	echo "link: ${DOTFILES##*/}/$file => $file"
	makelink "$file" "$DOTFILES/$file"
done
echo "Copying files from dotfiles directory"
for file in ${cpfiles[@]}; do
	newfile="${file%.*}"
	cleanfile $newfile
	echo "cp: ${DOTFILES##*/}/$file => $newfile"
	cp "$DOTFILES/$file" "$newfile"
done
popd
