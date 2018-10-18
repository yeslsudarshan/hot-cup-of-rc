if [ "$PS1" != "" ]; then
    [ -f ~/.workbashprofile ] && source ~/.workbashprofile
	export CSCOPE_DIR=$MYHOME/.cscope_dbs
	source ~/.bashrc 
	[ -z "$HOSTNAME" ] && HOSTNAME=`uname -n`
fi
