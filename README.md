dotvim
======

my .vim &amp; .vimrc

install
======

* ```git clone https://github.com/atttx123/dotvim.git ~/.vim```

* ```git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/vundle```

* ```ln -s ~/.vim/vimrc ~/.vimrc```

* Launch vim and run ```:PluginInstall```

  > To install from command line: ```vim +PluginInstall +qall```

dependency
======

* cd ~/.vim/bundle/tern_for_vim && npm install tern

* pip install flake8 autopep8

* apt-get install exuberant-ctags
