#!/bin/bash

REPO_URL="https://raw.githubusercontent.com/orandin/vim/master"
DEPS_URL="$REPO_URL/deps"

install_vim() {
    plugins=$(curl -s "$DEPS_URL/vim_plugins")

    # Backup
    cp -f ~/.vimrc ~/.vimrc.old.$(date +%s)

    # Plugin manager bootstrap
    mkdir -p ~/.vim/bundle

    # Clone necessary stuff
    for plugin in ${plugins[@]} ; do
        echo "INSTALLING plugin $plugin"
        git clone "https://${plugin}.git" --depth 1 ~/.vim/bundle/${plugin##*/}
    done

    # Closetag script and snippets
    curl -sL -o ~/.vim/scripts/closetag.vim "http://vim.sourceforge.net/scripts/download_script.php?src_id=4318"
    wget -P ~/.vim/bundle/vim-go/gosnippets/UltiSnips "$RESR_URL/go.snippets"

    # Powerline
    pip install --user powerline-status

    # Fonts
    mkdir -p ~/.{fonts,config/fontconfig/conf.d}
    wget -P ~/.fonts "http://jorrel.googlepages.com/Monaco_Linux.ttf"
    wget -P ~/.fonts "https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf"
    wget -P ~/.config/fontconfig/conf.d "https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf"
    fc-cache -vf ~/.fonts

    # Vimrc
    cp ~/.vimrc ./vimrc

    # Path
    echo "export PATH=\$PATH:$(readlink -f ~/.local/bin)" >> ~/.profile
    exit 0
}

install_vim
