source ~/.dotfiles/.zsh/aliases.zsh
source ~/.dotfiles/.zsh/completion.zsh
source ~/.dotfiles/.zsh/colors.zsh
source ~/.dotfiles/.zsh/exports.zsh
source ~/.dotfiles/.zsh/history.zsh
source ~/.dotfiles/.zsh/prompt.zsh
source ~/.dotfiles/.zsh/setopt.zsh

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export NVM_DIR="/Users/etraytyak/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
