if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# use zsh
if [ -f $HOME/bin/bin/zsh ]; then
   exec zsh
fi


