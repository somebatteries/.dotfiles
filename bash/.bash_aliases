if [[ "$(readlink /proc/$$/exe)" =~ "bash" ]]; then
    shopt -s expand_aliases;
fi


win_path ()
    {
    echo w:$1 | tr '\/' '\\'
    }

unwind ()
    {
    if [ -e $1 ]; then
        SYMBOLS_FILE=$1
        shift
    else
        SYMBOLS_FILE=./out/cv25m_miner/fakeroot/garmin/garmin_app
    fi

    if [ ! -f $SYMBOLS_FILE ]; then
        if [ -d out ]; then
            SYMBOLS_FILE=$(find out -iname garmin_app | head -1)
        else
            SYMBOLS_FILE=$(find . -iname garmin_app | head -1)
        fi
    fi

    ADDR2LINE=/opt/toolchain/linaro-aarch64-2020.09-gcc10.2-linux5.4/bin/aarch64-linux-gnu-addr2line

    # If the toolchain isn't installed locally, run this within docker
    if [ ! -f $ADDR2LINE ]; then
        DRUN=./drun
    fi

    addresses=$@
    addresses=$(echo $addresses | tr "[]" "\0") #Remove brackets, to make life ez
    $DRUN $ADDR2LINE -e $SYMBOLS_FILE $addresses -f -p | column -t
    }

#-----------------------------------------------------------
# Git
#-----------------------------------------------------------
alias gl='git log'
alias gb='git branch'
alias gd='git diff'
alias gg="git grep -Pn 2>0"
alias ggr="gg --recurse-submodules"


# some more ls aliases
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'
alias lf='ls -td ./*/ |head -1' #list most recently modified folder

# Join a multiple line string into a single line
join () 
{ 
echo "$1" | xargs
}

extract () 
{ 
if [ -f $1 ]; then
    case $1 in 
        *.tar.bz2)
            tar xjfp $1
        ;;
        *.tar.gz)
            tar xzfp $1
        ;;
        *.bz2)
            bunzip2 $1
        ;;
        *.rar)
            unrar x $1
        ;;
        *.gz)
            gunzip $1
        ;;
        *.tar)
            tar xfp $1
        ;;
        *.tbz2)
            tar xjfp $1
        ;;
        *.tgz)
            tar xzf $1
        ;;
        *.zip)
            unzip $1
        ;;
        *.Z)
            uncompress $1
        ;;
        *.7z)
            7z x $1
        ;;
        *.xz)
            tar xvJfp $1
        ;;
        *)
            echo "'$1' cannot be extracted via ex()"
        ;;
    esac;
else
    echo "'$1' is not a valid file";
fi
}

alias f='find -iname'

#check setting within configs
config () 
{
grep -n $1 $(f .config) $(f ambarella_cv25_defconfig) $(f cv25m_ipcam_config) 
}

# Find cobra pkg defining current file
pkg ()
{
echo -$1
ggr -l \\b$1\\b -- \*.pkg.xml
}
