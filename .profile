# Get the actual source location of this script
# https://stackoverflow.com/questions/59895/getting-the-source-directory-of-a-bash-script-from-within
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
	DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
	SOURCE="$(readlink "$SOURCE")"
	[[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

# Define this first, so it can be used in other init scripts
function safeecho() {
	# Only echo in interactive shell
	if [[ $- =~ "i" ]]; then
		echo $@
	fi
}

safeecho "DIR = $DIR"

# Detect if this is an SSH session
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  export ENV_SSH=1
else
  case $(ps -o comm= -p $PPID) in
    sshd|*/sshd) export ENV_SSH=1;;
  esac
fi

if [ -f $DIR/.os_env ]; then
	. $DIR/.os_env
fi

if [ -f $DIR/.env_vars ]; then
	. $DIR/.env_vars
fi

if [ -f $DIR/.functions ]; then
	. $DIR/.functions
fi

# Alias definitions.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f $DIR/.aliases ]; then
	. $DIR/.aliases
fi

#export ENV_TYPE="mac"

# My custom file for making environment-dependent settings
#export ENV_TYPE=`uname -s | awk '{print tolower($0)}'`
#if [ "$ENV_TYPE" = "darwin" ]; then
#	export ENV_TYPE='mac'
#fi
case $(uname -s | awk '{print tolower($0)}') in
	darwin*)		export ENV_TYPE='mac' ;;
	linux*)			export ENV_TYPE='linux' ;;
	mingw*|msys*)	export ENV_TYPE='linux' ;;
	*)				export ENV_TYPE='unknown' ;;
esac

printscriptlocation

if [ -n "$BASH_VERSION" ]; then
	if [ -f "$DIR/.bashrc" ]; then
		. "$DIR/.bashrc"
	fi
fi

test -r /sw/bin/init.sh && . /sw/bin/init.sh

clearline

#export DATA_UPDATE_DIFF_CMD=$HOME/bin/araxissvndiff
#export DATA_UPDATE_DIFF_CMD=$HOME/vimdiffsvn.sh

#PATH=$(echo $PATH | awk -F: '{for (i=1;i<=NF;i++) { if ( !x[$i]++ ) printf("%s:",$i); }}')


#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Setting PATH for Python 2.7
# The original version is saved in .profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
# Adding python 3, but at the end of the path so it's not chosen automatically
PATH="${PATH}:/usr/local/Cellar/python/3.7.7"
export PATH
