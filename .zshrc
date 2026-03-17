# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export LS_COLORS="di=0;35"
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'--color=fg:#11111b,fg+:#7287fd,bg:#F4F4F4,bg+:#dadaf2 --color=hl:#11111b,hl+:#7287fd,info:#acb0be,marker:#11111b --color=prompt:#11111b,spinner:#11111b,pointer:#7287fd,header:#acb0be --color=gutter:#F4F4F4,border:#E6E6E6,label:#11111b,query:#7287fd --border="rounded" --border-label="" --preview-window="border-rounded" --padding="0" --margin="0" --prompt="" --marker="" --pointer="" --separator="" --scrollbar="" --info="right"'

alias ls="lsd -a"
