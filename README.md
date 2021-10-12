dotvim
======

my .vim &amp; .vimrc

download
======

* `git clone https://github.com/atttx123/dotvim.git ~/.vim`

install for vim
------
* `ln -s ~/.vim/vimrc ~/.vimrc`
* `curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`

install for neo-vim
------
* `mkdir -p ~/.config/nvim/ && ln -sf ~/.vim/vimrc ~/.config/nvim/init.vim`
* `curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`

install for idea-vim
------
* ```ln -s ~/.vim/ideavimrc ~/.ideavimrc```

dependency
======

* `pip install jedi flake8 autopep8`

* (for neo vim) `pip install neovim`

* (*highly recommended*) install: https://github.com/universal-ctags/ctags

* (for go language) `go get -u github.com/jstemmer/gotags`
