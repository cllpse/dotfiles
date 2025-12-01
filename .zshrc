export JAVA_HOME=/opt/homebrew/opt/openjdk@17
export PATH=$PATH:$HOME/.maestro/bin
export PATH=$PATH:/Users/cllpse/.cargo/bin
export LS_COLORS="di=0;35"
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'--color=fg:#11111b,fg+:#7287fd,bg:#F4F4F4,bg+:#dadaf2 --color=hl:#11111b,hl+:#7287fd,info:#acb0be,marker:#11111b --color=prompt:#11111b,spinner:#11111b,pointer:#7287fd,header:#acb0be --color=gutter:#F4F4F4,border:#E6E6E6,label:#11111b,query:#7287fd --border="rounded" --border-label="" --preview-window="border-rounded" --padding="0" --margin="0" --prompt="" --marker="" --pointer="" --separator="" --scrollbar="" --info="right"'

[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"



plug "zsh-users/zsh-syntax-highlighting"
plug "wintermi/zsh-lsd"
plug "zap-zsh/fzf"

autoload -Uz compinit

compinit

eval "$(/Users/cllpse/.local/bin/mise activate zsh)"

eval "$(starship init zsh)"

clear-screen-widget() {
  clear
  zle reset-prompt
}

bindkey '^L' clear-screen-widget

zle -N clear-screen-widget

eval "$(zoxide init --cmd cd zsh)"

precmd() {
  printf '%s' "$(tput cup $LINES 0)"
}

PROMPT='%{$(tput cup $LINES 0)%}'"$PROMPT"

alias ls="lsd -a"
