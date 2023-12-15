# Configuration file for zsh

# Autoload
autoload -Uz compinit && compinit
compinit

# zstyles
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt EXTENDED_HISTORY

# Plugins
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Aliases
source ~/.zsh/aliases.zsh
source ~/.zsh/functions.zsh

# Starship shell prompt
eval "$(starship init zsh)"
