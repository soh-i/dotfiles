PATH=/home/soh.i/bin/bin:$PATH
alias ls='ls --color'

# History
function share_history {
    history -a
    history -c
    history -r
}
PROMPT_COMMAND='share_history'
shopt -u histappend
export HISTSIZE=100000

# bash_completion
source /home/soh.i/bin/etc/profile.d/bash_completion.sh

# perlbrew
source ~/perl5/perlbrew/etc/bashrc

