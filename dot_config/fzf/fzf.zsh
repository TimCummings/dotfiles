# Setup fzf
# ---------
# if [[ ! "$PATH" == */home/tjc/.local/share/fzf/bin* ]]; then
#   export PATH="${PATH:+${PATH}:}/home/tjc/.local/share/fzf/bin"
# fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "${XDG_CONFIG_HOME}"/fzf/completion.zsh 2> /dev/null

# Key bindings
# ------------
[ -f "${XDG_CONFIG_HOME}"/fzf/key-bindings.zsh ] && source "${XDG_CONFIG_HOME}"/fzf/key-bindings.zsh
