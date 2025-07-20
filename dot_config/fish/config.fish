if status is-interactive
  mise activate fish | source
  fzf --fish | source
  starship init fish | source

  abbr -a psf 'ps aux | fzf'

  # git
  abbr -a g 'git'
  # following aliases also in gitconfig (able to use e.g. in vim, but requires a space after `g`)
  abbr -a ga 'git add'
  abbr -a gb 'git branch'
  abbr -a gbc 'git branch | cat'
  abbr -a gbf 'git checkout $(git branch | fzf)'
  abbr -a gc 'git commit -v'
  abbr -a gco 'git checkout'
  abbr -a gcp 'git cherry-pick'
  abbr -a gd 'git diff'
  abbr -a gdc 'git diff --cached'
  abbr -a gf 'git fetch'
  abbr -a gl 'git log'
  abbr -a gp 'git pull'
  abbr -a gr 'git rebase'
  abbr -a gri 'git rebase --interactive'
  abbr -a gsh 'git show'
  abbr -a gst 'git status'

  abbr -a lg lazygit

  abbr -a nnn 'nnn-nerd-static -eoR'
end
