#.bashrc
# Add bin to path

[ -f ~/.aliases ] && source ~/.aliases

[ -f ~/.workrc ] && source ~/.workrc

if [ "$PS1" != "" ]; then
    # Prompt Colors
    green=$(tput setaf 2) 
    red=$(tput setaf 1)
    blue=$(tput setaf 4)
    cyan=$(tput setaf 6)
    yellow=$(tput setaf 3)
    NC=$(tput sgr0)
fi

fancy_prompt() 
{

	# Custom prompt
	export PROMPT_DIRTRIM=3
	PS1="\[$cyan\][\h \A]:\[$green\][\w]"

	PS1+="\[$red\] \$(git branch 2> /dev/null | grep -e \"^*\" | 
		sed \"s/HEAD detached at //\" | sed \"s/* //\" |
		cut -d \"(\" -f 2 | cut -d \")\" -f1)"

	PS1+="\n\[$green\]▶▶\[$NC\] " # Always the closing line!

}

# tmux attach
function tma()
{
    if [[ $# -ge 1 ]];then
        choice="$1"
    else
        tls
        echo -n "? "
        read choice
    fi

    if [[ -n $choice ]];then 
        output="$(tls | awk -v awkvard="$choice" '{ if ($1 == awkvard) print $2 }')"
        if [[ ! -z "$output" ]]; then
            echo attaching to session "$output"... 
            sleep 0.2
            tmux a -t $output
        else
            echo session "$choice" does not exist!
        fi
    fi
}

function fgr_related()
{
    if [[ $# -ge 1  &&  "$1" -eq "c" ]];
    then
        jobs
        echo -n "Choice ?"
        read choice 
        if [[ -n $choice ]]; then
            echo "Invalid option"
        else
            fg $choice
        fi
    else
        fg
    fi
}

## pushd related
function pd()
{
    if [[ $# -ge 1 ]];
    then 
         choice="$1"
    else
        dirs -v
        echo -n "? "
        read choice
    fi
    if [[ -n $choice ]]; then
        printf "%g" "$1" &> /dev/null
        if [[ $? == 0 ]]; then
            choice="+$choice"
        fi
        pushd $choice
    fi
}

function csdb()
{
	[ $# -ne 1 ] && echo "USAGE csdb <abs_path_to_dir>" && return 1

	WSDIR=$(basename "$1")
	TS="$(date +"%d_%m_%y")"
	FILE_LIST="$WSDIR""_$TS.lst"
	DB_NAME="$WSDIR""_$TS.out"

	echo "Generating cscope db "$DB_NAME" at "$CSCOPE_DIR""

	find $1 -name \*.[cChH] -o -name \*.cc &> $CSCOPE_DIR/$FILE_LIST
    cscope -b -q -k -i $CSCOPE_DIR/$FILE_LIST -f $CSCOPE_DIR/$DB_NAME
}

xdpyinfo &> /dev/null
if [[ $? != 1 ]]; then 
	VRC_ARG=~/.vimrc-blank
else
	VRC_ARG=~/.vimrc
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
bind -x '"\C-p": vim $(fzf);'

if [ "${TERM-}" != "dumb" ]; then
	fancy_prompt
fi
