umask 002

export LS_COLORS="di=0;35"
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'--color=fg:#11111b,fg+:#7287fd,bg:#F4F4F4,bg+:#dadaf2 --color=hl:#11111b,hl+:#7287fd,info:#acb0be,marker:#11111b --color=prompt:#11111b,spinner:#11111b,pointer:#7287fd,header:#acb0be --color=gutter:#F4F4F4,border:#E6E6E6,label:#11111b,query:#7287fd --border="rounded" --border-label="" --preview-window="border-rounded" --padding="0" --margin="0" --prompt="" --marker="" --pointer="" --separator="" --scrollbar="" --info="right"'

alias ls="lsd -a"

alias goodtape="gpane web --here"

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/powerlevel10k/powerlevel10k.zsh-theme

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Chat-style layout: pad to the last row only when needed (startup, after `clear`).
# Ghostty scroll-to-bottom (see ~/.config/ghostty/config) pins the viewport on streaming output.
_bottom_prompt_pad() {
  if (( LINES > 1 )); then
    repeat $(( LINES - 1 )) print
  fi
}

# 1 = run pad on next precmd (first prompt, or after clear() below).
_bottom_prompt_need_pad=1

precmd_bottom_prompt() {
  if (( _bottom_prompt_need_pad )); then
    _bottom_prompt_need_pad=0
    _bottom_prompt_pad
  fi
}

clear() {
  command clear "$@"
  _bottom_prompt_need_pad=1
}

clear-screen() {
  zle .clear-screen
  _bottom_prompt_pad
  zle .reset-prompt
  zle -R
}
zle -N clear-screen

add-zsh-hook precmd precmd_bottom_prompt

source <(fzf --zsh)

eval "$(/opt/homebrew/bin/mise activate zsh)"
eval "$(zoxide init --cmd cd zsh)"
