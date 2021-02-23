export SHELL=`which zsh`
[ -z "$ZSH_VERSION" ] && exec "$SHELL" -l

export PATH="$HOME/.cargo/bin:$PATH"
