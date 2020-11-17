#!/bin/bash
# {{{ setTheStage

setTheStage() {
  echo "" && echo "Setting the stage!"
  cd
  rm -rf ~/git
}

# -------------------------------------------------------------------------- }}}
# {{{ cloneMyRepos

repos=( \
  amber \
  autodoc \
  debian-bootstrap \
  docbld \
  dotfiles \
  emend \
  emend-computer \ 
  newdoc \
  resume \
  ssh \
  tmux \
  TraapReset \
  vim \
  wiki \
)

cloneMyRepos() {
  echo "" && echo "Cloning my repositories."
  arr=("$@")
  for r in "${arr[@]}"
  do
    src=https://github.com/Traap/$r.git
    dst=~/git/$r
    git clone --depth 1 $src $dst
  done
}

# -------------------------------------------------------------------------- }}}
# {{{ cloneBashGitPrompt

cloneBashGitPrompt() {
  echo "" && echo "Cloning bash-git-prompt."
  rm -rf ~/.bash-git-prompt
  src=https://github.com/magicmonty/bash-git-prompt
  dst=~/.bash-git-prompt
  git clone --depth 1 $src $dst
}

# -------------------------------------------------------------------------- }}}
# {{{ cloneBase16Colors

cloneBase16Colors () {
  echo "" && echo "Cloning Base16 colors."
  src=https://github.com/chriskempson/base16-shell
  dst=~/git/color/base16-shell
  git clone --depth 1 $src $dst
}

# -------------------------------------------------------------------------- }}}
# {{{ cloneTmuxPlugins 

cloneTmuxPlugins () {
  echo "" && echo "Cloning TMUX plugins."
  src=https://github.com/tmux-plugins/tpm.git
  dst=~/git/tmux/plugins/tpm
  git clone --depth 1 $src $dst
}

# -------------------------------------------------------------------------- }}}
# {{{ createSymLinks

createSymLinks() {
  echo "" && echo "Creating symbolic links."
  ln -fsv ~/git/dotfiles/bash_logout     ~/.bash_logout
  ln -fsv ~/git/dotfiles/bashrc-personal ~/.bashrc-personal
  ln -fsv ~/git/dotfiles/dircolors       ~/.dircolors
  ln -fsv ~/git/dotfiles/inputrc         ~/.inputrc
  ln -fsv ~/git/dotfiles/latexmkrc       ~/.latexmkrc
  ln -fsv ~/git/ssh/config.vim           ~/.config.vim
  ln -fsv ~/git/ssh/gitconfig            ~/.gitconfig
  ln -fsv ~/git/ssh/gitignore_global    ~/.gitignore_global
  ln -fsv ~/git/ssh                     ~/.ssh
  ln -fsv ~/git/tmux                    ~/.tmux
  ln -fsv ~/git/tmux/tmux.conf          ~/.tmux.conf
  ln -fsv ~/git/vim/nvim.vim            ~/.config/nvim/init.vim
  ln -fsv ~/git/vim                     ~/.vim
  ln -fsv ~/git/vim/vimrc_background    ~/.vimrc_background
  ln -fsv ~/git/vim/vimrc               ~/.vimrc
}

# -------------------------------------------------------------------------- }}}
# {{{ setSshPermissions

setSshPermissions() {
  echo "" && echo "Setting ssh permissions."
  chmod 600 ~/git/ssh/*
  chmod 644 ~/git/ssh/*.pub
}

# -------------------------------------------------------------------------- }}}
# {{{ loadTmuxPlugins 

loadTmuxPlugins() {
  echo "" && echo "Loading TMUX plugins."
  ~/.tmux/plugins/tpm/bin/install_plugins
}

# -------------------------------------------------------------------------- }}}
# {{{ loadVimPlugins 

loadVimPlugins() {
  echo "" && echo "Loading vim / neovim plugins."
  nvim 
}

# -------------------------------------------------------------------------- }}}
# {{{ main

main() {
  setTheStage
  cloneBashGitPrompt
  cloneBase16Colors
  cloneMyRepos ${repos[@]}
  cloneTmuxPlugins
  setSshPermissions
  createSymLinks
  loadTmuxPlugins
  loadVimPlugins
  source ~/.bashrc
}

# -------------------------------------------------------------------------- }}}
# {{{ The stage is set ... start the show!!!

main "$@"

# -------------------------------------------------------------------------- }}}
