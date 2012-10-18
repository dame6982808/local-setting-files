#------------------------
#  $HOME/.zshrc file 
#! /usr/bin/zsh
#------------------------

#---パスの設定------------------------------------------------------------
# not defined.

#---機能拡張------------------------------------------------------------

setopt prompt_subst # escapeシーケンスを通す
setopt auto_cd # ディレクトリ名のみでcdできる
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
setopt correct # コマンドの間違い修正
setopt list_packed
autoload predict-on # コマンド予測変換
predict-on
setopt multios # redirectを複数指定
export LS_COLORS='di=01;34'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
autoload -U colors # プロンプトのカラー
colors $fg[31]     # あまり意味ない?
setopt rm_star_wait # rm * の前に確認

limit coredumpsize 0 # coreファイルを作らない
ulimit -c 0

##---補完機能の設定-------------------------------------------------------

setopt no_beep # beepは鳴らさない。
setopt no_list_beep # 候補が複数のときでもbeepは鳴らさない。
setopt auto_list # 補完候補が複数のとき、C-dなしでリストを表示。
#unsetopt bash_auto_list # 補完候補が複数のとき、
                       # TAB を二回押したときだけリストを表示
unsetopt list_ambiguous # 補完される prefix か suffix があったときは
                      # なにも表示されないように変更された。
                      # これは BASH_AUTO_LIST と組合せることにより、
                      # 双方が適用される。
                      # これは、リストを表示するには TAB を3回押す必要がある。
unsetopt menu_complete # ひとつの候補が選ばれて表示される。
                      # TABを打てば次を表示する。
                      # そうして次々表示して、もとに戻る。
setopt auto_menu # 候補が複数のときにもう一度TABを打つとメニュー動作をする。
                 # 最後に明示的に要求された場合を含め、全ての補完動作に影響。
setopt always_last_prompt # 補完候補を表示したあと、カーソルは編集中の行に
                          # 復帰する。(リストが十分短い場合)
setopt complete_in_word # カーソルの位置に補なうことで
                        # 単語を完成させようとする。
#setopt always_to_end
setopt list_types # ファイル形式の表示
#setopt recexact
#setopt auto_remove_slash
#setopt auto_param_keys
##zstyleは/bin/zshのヴァージョンが古く使用できませんが例として
zstyle ':completion:*:default' menu select=1 # 一覧表示された補完候補から選択
setopt extended_glob
## 補完機能の拡張 over virsion3.1.6 これも使用できませんが例として
#autoload -U compinit
#compinit

## ---プロンプトの設定-----------------------------------------------------------

case $kterm in # $TERM
    emacs|unknown|dumb) # emacsでプロンプトが正しく表示されるようにする
        PROMPT='Zsh' # emacsはRPROMPTの表示に難がある。
    ;;
    sun|eterm) # 色が表示できないTERM用
        PROMPT='Zsh '
        RPROMPT='Zsh'
    ;;
    screen|vt100) # screen用
# 仮想端末かそうでないかがわからなくなることが私はたまにあるので
# 1ヵ所表示をかえて一目で判断できるようにしています。
# ランダムでプロンプトの色を変化させています。遊びです。
# ^[ という部分は、 ^ と [ ではなく、ESCコードで、 
# Emacsの場合は C-q ESC で、vi の場合は C-v ESC とタイプして入力する。
        PROMPT='Zsh'
        
    ;;
    kterm|xterm)
        PROMPT='Zsh[%n]:'
        
    ;;
    *) #デフォルト 
    #PROMPT=$'%{\e[4;32;44m%}%BK.N. [%n] >>%b%{\e[0m%}' # [%m]{%n}でホストとユーザ名 ,カラーは以下に
    #PSCOLOR='01;44;32;04'
    #RPROMPT=$'%{\e[${PSCOLOR}m%}[% shell:%N machine:%M]%{\e[00m%}'
    setopt prompt_subst
    PROMPT=$'%{\e[$[32+$RANDOM % 4]m%}%B>>%b%{\e[0m%}'
    RPROMPT=$'%{\e[$[42+$RANDOM % 4];33m%}%B< K.N. %n,%M >%b%{\e[00m%}'

    ;;                                   
esac
[[ $EMACS = t ]] && unsetopt zle # emacsでプロンプトが正しく表示されるようにする

#    * 00: なにもしない
#    * 01: 太字化
#    * 04: 下線
#    * 05: 点滅
#    * 07: 前背色反転
#    * 08: 表示しない
#    * 22: ノーマル化
#    * 24: 下線なし
#    * 25: 点滅なし
#    * 27: 前背色反転なし
#    * 30: 黒(前景色)
#    * 31: 赤(前景色)
#    * 32: 緑(前景色)
#    * 33: 茶(前景色)
#    * 34: 青(前景色)
#    * 35: マゼンタ(前景色)
#    * 36: シアン(前景色)
#    * 37: 白(前景色)
#    * 39: デフォルト(前景色)
#    * 40: 黒(背景色)
#    * 41: 赤(背景色)
#    * 42: 緑(背景色)
#    * 43: 茶(背景色)
#    * 44: 青(背景色)
#    * 45: マゼンタ(背景色)
#    * 46: シアン(背景色)
#    * 47: 白(背景色)
#    * 49: デフォルト(背景色)



#---追加------------------------------------------------------------------------
alias -s pdf=acroread  # pdfファイルを実行するとacroreadで勝手に開く
alias -s txt=emacs     # txtファイルを実行するとemacsで勝手に開く
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

bindkey -e # emacsの様にターミナルで編集

export NNTPSERVER=nh1
export LESSCHARSET=japanese-euc

if [[ -f /usr/local/bin/less ]]; then	# jless
    export	LESSCHARSET=japanese-euc
fi
