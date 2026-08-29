# dotfiles

Personal dotfiles/config repo. Pull this down on a new machine, run `install.sh`, and get an
environment set up the way I like it.

Formerly two separate repos: `machome` (Mac + SSH-target Linux, dating back to when I worked
primarily on a Macbook) and `winhome` (created later, once I switched to a Windows-primary
setup). They're merged into this one repo now, with `install.sh` branching on platform instead
of maintaining two parallel setups.

## Setup

```
./install.sh
```

On native Windows (Git Bash/MSYS/Cygwin), this needs to be run from an **elevated** terminal
(right-click Git Bash, "Run as administrator"). Windows can't create unprivileged file
symlinks -- only unprivileged junctions, which are directory-only -- so the script checks for
admin rights up front and refuses to run without them, rather than silently falling back to
plain copies (which is what happened for years before this was fixed, and is why this repo and
the live files in `~/` drifted out of sync without anyone noticing).

Personal identity (git name/email, etc.) is never committed directly -- see `*.example` files,
which get copied (not linked) to their real name so you can fill in personal details locally
without them touching the repo.

`.vim`/`.vimrc` are a single cross-platform config now (previously forked between machome and
winhome) -- winhome's `.vim` tree won out as the base (it had the actively-maintained Unreal
Engine syntax support and colorscheme updates machome's had fallen behind on), with `.vimrc`
taken from the most current live version. CtrlP was dropped in the process (unused).
