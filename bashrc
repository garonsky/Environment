# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/HPCCSystems/sbin:/opt/HPCCSystems/bin

fffc()
{
if [ -z "$1" ]
then
    echo "No search key."
else
    find ./ -iname '*cmake*' -exec grep "$1" -nH {} \;
fi
}

fffci()
{
if [ -z "$1" ]
then
    echo "No search key."
else
    find ./ -iname '*cmake*' -exec grep "$1" -inH {} \;
fi
}


fff()
{
if [ -z "$1" ]
then
    echo "No search key."
else

    find ./ -iname '*.cpp'  -exec grep "$1" -nH {} \; -or -iname '*.h' -exec grep "$1" -nH {} \; -or -iname '*.ipp'  -exec grep "$1" -nH {} \; -or -iname '*.hpp'  -exec grep "$1" -nH {} \; -or -iname '*.c'  -exec grep "$1" -nH {} \; -or -iname '*.xml'  -exec grep "$1" -nH {} \; -or -iname '*.xsl*' -exec grep "$1" -nH {} \;  -or -iname '*.xsd' -exec grep "$1" -nH {}  \;  -or -iname '*.js*' -exec grep "$1" -nH {} \; -or -iname '*.esp' -exec grep "$1" -nH {} \; -or -iname '*.ecm' -exec grep "$1" -nH {} \; -or -iname '*.tpp' -exec grep "$1" -nH {} \; -or -iname '*.in' -exec grep "$1" -nH {} \; -or -iname '*.htm*' -exec grep "$1" -nH {} \;

fi
}


ffi()
{
if [ -z "$1" ]
then
    echo "No search key."
else

    find ./ -iname '*.cpp'  -exec grep "$1" -inH {} \;   -or -iname '*.h' -exec grep "$1" -inH {} \; -or -iname '*.ipp'  -exec grep "$1" -inH {} \; -or -iname '*.hpp'  -exec grep "$1" -inH {} \; -or -iname '*.c'  -exec grep "$1" -inH {} \; -or -iname '*.xml'  -exec grep "$1" -inH {} \; -or -iname '*.xsl*' -exec grep "$1" -inH {} \;  -or -iname '*.xsd' -exec grep "$1" -inH {}  \; -or -iname '*.js*' -exec grep "$1" -inH {} \; -or -iname '*.esp' -exec grep "$1" -inH {} \; -or -iname '*.ecm' -exec grep "$1" -inH {} \; -or -iname '*.tpp' -exec grep "$1" -inH {} \; -or -iname '*.in' -exec grep "$1" -inH {} \; -or -iname '*.htm*' -exec grep "$1" -inH {} \;

fi
}

fffc()
{
if [ -z "$1" ]
then
    echo "No search key."
else

    find ./ -iname '*cmake*'  -exec grep "$1" -nH {} \;
fi
}

fffci()
{
if [ -z "$1" ]
then
    echo "No search key."
else

    find ./ -iname '*cmake*'  -exec grep "$1" -inH {} \;
fi
}

csfind()
{
if [ '-f' == "$1" ]
then
  echo "Deleting cscope*"
  rm -f cscope* 
  echo "Done!"
fi

echo "Finding files..."; find ./ -iname '*.cpp' -or -iname '*.h' -or -iname '*.hpp' -or -iname '*.ipp' -or -iname '*.c' -or -iname '*.xml' -or -iname '*.xsl*' -or -iname '*.xsd' -or -iname '*.js*' -or -iname '*.esp' -or -iname '*.ecm' -or -iname '*.tpp' -or -iname '*.htm*' -or -iname '*.in'  > ./cscope.files;echo "Generating cscope db..";cscope -b -q -k;echo "Done!"
} 

gfindi()
{
if [ -z "$1" ]
then
    echo "No search key."
else
    suffix="*"
    concat="'$1$suffix'"
#     echo "'$1*'"
    echo $concat
    find ./ -iname $concat
fi
}

llocate()
{
if [ -z "$1" ]
then
  echo "No search key."
else
  locate $1 | xargs ls -latr
fi
}

lilocate()
{
if [ -z "$1" ]
then
  echo "No search key."
else
  locate -i $1 | xargs ls -latr
fi
}

ctfind()
{
  echo "Finding ctags..."; ctags -R --langmap=c++:.tpp.ipp.c++.cc.cpp.cxx.h.hpp.hp.hh.h++.hxx.C.H.ecm.esp * &> /dev/null; echo "Done!"; 
}


#  Set QT Environment #
QT_ROOT='/opt/Qt5.3.0/'
QT_BASE=$QT_ROOT'5.3/'

QT_TOOL_BASE=$QT_ROOT'/Tools/'
export QTDIR=$QT_BASE'/gcc_64/'
alias "qtcreator"=$QT_TOOL_BASE'/bin/qtcreator'
alias "qmake5"='$QT_DIR/bin/qmake'

alias hpcccmake='cmake  -DCMAKE_BUILD_TYPE=Debug -DUSE_APR=Off ../HPCC-Platform'  
alias gangliacmake='cmake -DCMAKE_BUILD_TYPE=Debug ../ganglia-monitoring'  
export EDITOR=vim

alias "gitlog"='git lg'

alias "copyjs"='sudo cp -sf /home/gleb/HPCC/HPCC-Platform/esp/files/scripts/configmgr/navtree.js /opt/HPCCSystems/componentfiles/files/scripts/configmgr/navtree.js; sudo cp -sf /home/gleb/HPCC/HPCC-Platform/esp/files/scripts/configmgr/configmgr.js /opt/HPCCSystems/componentfiles/files/scripts/configmgr/configmgr.js; sudo cp -sf /home/gleb/HPCC/HPCC-Platform/esp/files/scripts/configmgr/common.js /opt/HPCCSystems/componentfiles/files/scripts/configmgr/common.js; sudo cp -sf /home/gleb/HPCC/HPCC-Platform/esp/files/configmgr.html /opt/HPCCSystems/componentfiles/files/configmgr.html'
alias "copylibs"='sudo cp -sf /home/gleb/HPCC/build/Debug/libs/* /opt/HPCCSystems/lib'


export PS1="\[\e[0;37m\][\[\e[1;31m\]\@\[\e[0;37m\]] \[\033[01;32m\]\u@\h \[\e[0;37m\][\[\e[1;34m\]\w\[\e[0;37m\]]\[\e[0;32m\]\$\[\e[0m\] "


# remove this when https://bugreports.qt-project.org/browse/QTBUG-32225 is resolved
export LIBGL_ALWAYS_SOFTWARE=1
export PATH=$PATH:'$QT_DIR/bin/'
export QML_IMPORT_PATH='$QT_BASE/qml'
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/HPCCSystems/lib:~/HPCC/build/Debug/libs 
alias "cpnagios"="rm ~/Development/HPCC/HPCC-Platform/nagios-monitoring -r;cp -s ~/Development/HPCC/nagios-monitoring ~/Development/HPCC/HPCC-Platform -r"

