export GOPATH=$HOME/go

path=($HOME/bin(N) $HOME/.cargo/bin(N) $HOME/.rbenv/bin(N) $HOME/.cabal/bin(N) $HOME/.local/bin(N) $GOPATH/bin(N) /usr/local/bin(N) /usr/texbin(N) $path)
typeset -U path
export PATH

export PAGER=less

[ -r ~/.nvm/nvm.sh ] && source ~/.nvm/nvm.sh

export TIME_STYLE='+%F %R'

export GTK_IM_MODULE=uim
export QT_IM_MODULE=uim

if [ -z "$SSH_AUTH_SOCK" ]; then
  export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
fi
