#!/bin/sh
set -e

cd ~/.vim_runtime

echo '" DO NOT EDIT THIS FILE
" Add your own customizations in ~/.vim_runtime/my_configs.vim

set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim
try
  source ~/.vim_runtime/my_configs.vim
catch
endtry' > ~/.vimrc

echo "Install global and gtags"
if test -f /etc/redhat-release; then
    which global > /dev/null
    if [ $? -ne 0 ]; then
        sudo yum install ncurses-devel
        tar xzvf global-6.6.2.tar.gz
        cd global
        ./config
        make
        sudo make install
    fi
fi

if test -f /etc/lsb-release; then
    which global > /dev/null
    if [ $? -ne 0 ]; then
        sudo apt-get install -y global
    fi
fi
cp -rf ~/.vim_runtime/my_plugins/gtags.vim  ~/.vim/plugin/
echo "Installed the Ultimate Vim configuration successfully! Enjoy :-)"
