export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
git
dotnet
dnf
bun
gh
zsh-autosuggestions
rust
zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh


# Added by Toolbox App
export PATH="$PATH:/home/dpper/.local/share/JetBrains/Toolbox/scripts"

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#6c6c6c"
