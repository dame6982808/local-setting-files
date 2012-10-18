#------------------------
#  $HOME/.zshrc file 
#! /usr/bin/zsh
#------------------------

#---�ѥ�������------------------------------------------------------------
# not defined.

#---��ǽ��ĥ------------------------------------------------------------

setopt prompt_subst # escape�������󥹤��̤�
setopt auto_cd # �ǥ��쥯�ȥ�̾�Τߤ�cd�Ǥ���
umask 022
autoload -U compinit
compinit
export LANG=ja
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data 
setopt auto_pushd
setopt correct # ���ޥ�ɤδְ㤤����
setopt list_packed
autoload predict-on # ���ޥ��ͽ¬�Ѵ�
predict-on
setopt multios # redirect��ʣ������
export LS_COLORS='di=01;34'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
autoload -U colors # �ץ��ץȤΥ��顼
colors $fg[31]     # ���ޤ��̣�ʤ�?
setopt rm_star_wait # rm * �����˳�ǧ

limit coredumpsize 0 # core�ե��������ʤ�
ulimit -c 0

##---�䴰��ǽ������-------------------------------------------------------

setopt no_beep # beep���Ĥ餵�ʤ���
setopt no_list_beep # ���䤬ʣ���ΤȤ��Ǥ�beep���Ĥ餵�ʤ���
setopt auto_list # �䴰���䤬ʣ���ΤȤ���C-d�ʤ��ǥꥹ�Ȥ�ɽ����
#unsetopt bash_auto_list # �䴰���䤬ʣ���ΤȤ���
                       # TAB ����󲡤����Ȥ������ꥹ�Ȥ�ɽ��
unsetopt list_ambiguous # �䴰����� prefix �� suffix �����ä��Ȥ���
                      # �ʤˤ�ɽ������ʤ��褦���ѹ����줿��
                      # ����� BASH_AUTO_LIST ���ȹ礻�뤳�Ȥˤ�ꡢ
                      # ������Ŭ�Ѥ���롣
                      # ����ϡ��ꥹ�Ȥ�ɽ������ˤ� TAB ��3�󲡤�ɬ�פ����롣
unsetopt menu_complete # �ҤȤĤθ��䤬���Ф��ɽ������롣
                      # TAB���ǤƤм���ɽ�����롣
                      # �������Ƽ���ɽ�����ơ���Ȥ���롣
setopt auto_menu # ���䤬ʣ���ΤȤ��ˤ⤦����TAB���ǤĤȥ�˥塼ư��򤹤롣
                 # �Ǹ������Ū���׵ᤵ�줿����ޤᡢ���Ƥ��䴰ư��˱ƶ���
setopt always_last_prompt # �䴰�����ɽ���������ȡ�����������Խ���ιԤ�
                          # �������롣(�ꥹ�Ȥ���ʬû�����)
setopt complete_in_word # ��������ΰ��֤���ʤ����Ȥ�
                        # ñ����������褦�Ȥ��롣
#setopt always_to_end
setopt list_types # �ե����������ɽ��
#setopt recexact
#setopt auto_remove_slash
#setopt auto_param_keys
##zstyle��/bin/zsh�Υ���������󤬸Ť����ѤǤ��ޤ�����Ȥ���
zstyle ':completion:*:default' menu select=1 # ����ɽ�����줿�䴰���䤫������
setopt extended_glob
## �䴰��ǽ�γ�ĥ over virsion3.1.6 �������ѤǤ��ޤ�����Ȥ���
#autoload -U compinit
#compinit

## ---�ץ��ץȤ�����-----------------------------------------------------------

case $kterm in # $TERM
    emacs|unknown|dumb) # emacs�ǥץ��ץȤ�������ɽ�������褦�ˤ���
        PROMPT='Zsh' # emacs��RPROMPT��ɽ�����񤬤��롣
    ;;
    sun|eterm) # ����ɽ���Ǥ��ʤ�TERM��
        PROMPT='Zsh '
        RPROMPT='Zsh'
    ;;
    screen|vt100) # screen��
# ����ü���������Ǥʤ������狼��ʤ��ʤ뤳�Ȥ���Ϥ��ޤˤ���Τ�
# 1����ɽ���򤫤��ư��ܤ�Ƚ�ǤǤ���褦�ˤ��Ƥ��ޤ���
# ������ǥץ��ץȤο����Ѳ������Ƥ��ޤ���ͷ�ӤǤ���
# ^[ �Ȥ�����ʬ�ϡ� ^ �� [ �ǤϤʤ���ESC�����ɤǡ� 
# Emacs�ξ��� C-q ESC �ǡ�vi �ξ��� C-v ESC �ȥ����פ������Ϥ��롣
        PROMPT='Zsh'
        
    ;;
    kterm|xterm)
        PROMPT='Zsh[%n]:'
        
    ;;
    *) #�ǥե���� 
    #PROMPT=$'%{\e[4;32;44m%}%BK.N. [%n] >>%b%{\e[0m%}' # [%m]{%n}�ǥۥ��Ȥȥ桼��̾ ,���顼�ϰʲ���
    #PSCOLOR='01;44;32;04'
    #RPROMPT=$'%{\e[${PSCOLOR}m%}[% shell:%N machine:%M]%{\e[00m%}'
    setopt prompt_subst
    PROMPT=$'%{\e[$[32+$RANDOM % 4]m%}%B>>%b%{\e[0m%}'
    RPROMPT=$'%{\e[$[42+$RANDOM % 4];33m%}%B< K.N. %n,%M >%b%{\e[00m%}'

    ;;                                   
esac
[[ $EMACS = t ]] && unsetopt zle # emacs�ǥץ��ץȤ�������ɽ�������褦�ˤ���

#    * 00: �ʤˤ⤷�ʤ�
#    * 01: ������
#    * 04: ����
#    * 05: ����
#    * 07: ���ؿ�ȿž
#    * 08: ɽ�����ʤ�
#    * 22: �Ρ��ޥ벽
#    * 24: �����ʤ�
#    * 25: ���Ǥʤ�
#    * 27: ���ؿ�ȿž�ʤ�
#    * 30: ��(���ʿ�)
#    * 31: ��(���ʿ�)
#    * 32: ��(���ʿ�)
#    * 33: ��(���ʿ�)
#    * 34: ��(���ʿ�)
#    * 35: �ޥ���(���ʿ�)
#    * 36: ������(���ʿ�)
#    * 37: ��(���ʿ�)
#    * 39: �ǥե����(���ʿ�)
#    * 40: ��(�طʿ�)
#    * 41: ��(�طʿ�)
#    * 42: ��(�طʿ�)
#    * 43: ��(�طʿ�)
#    * 44: ��(�طʿ�)
#    * 45: �ޥ���(�طʿ�)
#    * 46: ������(�طʿ�)
#    * 47: ��(�طʿ�)
#    * 49: �ǥե����(�طʿ�)



#---�ɲ�------------------------------------------------------------------------
alias -s pdf=acroread  # pdf�ե������¹Ԥ����acroread�Ǿ���˳���
alias -s txt=emacs     # txt�ե������¹Ԥ����emacs�Ǿ���˳���
alias a='alias'
alias jsoffice='env LANG=ja soffice'
alias    gterm='gnome-terminal'
alias zcompile="source ~/.zshrc"
alias ls='ls -F --color=auto'
alias rm='rm -i'
alias mdisk='du -cm'
alias cp='cp -i'
alias mv='mv -i'
alias mail1='env LANG=ja sylpheed'
alias mail2='env LANG=ja thunderbird'
alias kterm='kterm -geometry 80x24-0-110 -fn 12x24 -bg white'
alias vncserver='vncserver -geometry 1400x1400'   
alias aterm='~/.terminal/aterm -tr -fn 12x24 -km euc -e zsh'
alias tcterm='kterm -e tcsh'   
alias zterm='kterm -e zsh'
alias bterm='kterm -e bash'
alias azip='tar czf' # [new_gzipname.tar.gz]+[directory_name] 
alias zed='gedit'
alias ls_azip='tar tzf' # [__.tar.gz]
alias ls_azipl='tar tvzf' # [__.tar.gz]
alias aunzip='tar xzf' # [__.tar.gz]( +[want_file_name] )
alias gterm='env LANG=ja gnome-terminal --zoom=2.5 -e zsh'
alias math='mathematica'
alias math6='mathematica6'
alias math7='mathematica7'
#    a e='emacs'
    a Who='finger -m' # Who [user_ID]
    a jdc='javac'
    a jdk='java'
    a vncout='vncserver -kill' # [vncout]+[:1 (etc.)]
    a rxvt='~/.terminal/rxvt'
    a xmail='env LANG=ja sylpheed'
    a myr='~/Robbing'
    a tkl='~/.Item/Tklauncher2 -geometry -0+260'
    a fseek='~/.Item/fseek'
    a reload="source ~/.cshrc"
    a gpp2='/usr/local/gcc2/bin/g++'
    a gpp='/usr/local/gcc/bin/g++' 
    a gpp3='/usr/local/gcc3/bin/g++'
    a _display='xdpyinfo'
    a setd='setenv DISPLAY'

export LS_COLORS='*.c=01;33;04;40:*.java=01;36;04;40:di=01;32;04;40:fi=01;04;37;40:*.cpp=01;04;40;31:*.cc=01;04;40;31'

bindkey -e # emacs���ͤ˥����ߥʥ���Խ�

export NNTPSERVER=nh1
export LESSCHARSET=japanese-euc

if [[ -f /usr/local/bin/less ]]; then	# jless
    export	LESSCHARSET=japanese-euc
fi
