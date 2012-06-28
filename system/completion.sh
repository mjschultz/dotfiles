#
#   bash_completion - programmable completion functions for bash 3.2+
#
#   Copyright © 2006-2008, Ian Macdonald <ian@caliban.org>
#             © 2009-2011, Bash Completion Maintainers
#                     <bash-completion-devel@lists.alioth.debian.org>
#
#   This program is free software; you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation; either version 2, or (at your option)
#   any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program; if not, write to the Free Software Foundation,
#   Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
#
#   The latest version of this software can be obtained here:
#
#   http://bash-completion.alioth.debian.org/
#
#   RELEASE: 1.3

# Alter the following to reflect the location of this file.
#
[ -n "$BASH_COMPLETION" ] || BASH_COMPLETION=/etc/bash_completion
[ -n "$BASH_COMPLETION_DIR" ] || BASH_COMPLETION_DIR=/etc/bash_completion.d
[ -n "$BASH_COMPLETION_COMPAT_DIR" ] || BASH_COMPLETION_COMPAT_DIR=/etc/bash_completion.d
readonly BASH_COMPLETION BASH_COMPLETION_DIR BASH_COMPLETION_COMPAT_DIR

# Set a couple of useful vars
#
UNAME=$( uname -s )
# strip OS type and version under Cygwin (e.g. CYGWIN_NT-5.1 => Cygwin)
UNAME=${UNAME/CYGWIN_*/Cygwin}

case ${UNAME} in
    Linux|GNU|GNU/*) USERLAND=GNU ;;
    *) USERLAND=${UNAME} ;;
esac

# Turn on extended globbing and programmable completion
shopt -s extglob progcomp

# A lot of the following one-liners were taken directly from the
# completion examples provided with the bash 2.04 source distribution

# Make directory commands see only directories
complete -d pushd

# The following section lists completions that are redefined later
# Do NOT break these over multiple lines.
#
# START exclude -- do NOT remove this line
# bzcmp, bzdiff, bz*grep, bzless, bzmore intentionally not here, see Debian: #455510
complete -f -X '!*.?(t)bz?(2)' bunzip2 bzcat pbunzip2 pbzcat
complete -f -X '!*.@(zip|[ejw]ar|exe|pk3|wsz|zargo|xpi|sxw|o[tx]t|od[fgpst]|epub|apk)' unzip zipinfo
complete -f -X '*.Z' compress znew
# zcmp, zdiff, z*grep, zless, zmore intentionally not here, see Debian: #455510
complete -f -X '!*.@(Z|[gGd]z|t[ag]z)' gunzip zcat unpigz
complete -f -X '!*.Z' uncompress
# lzcmp, lzdiff intentionally not here, see Debian: #455510
complete -f -X '!*.@(tlz|lzma)' lzcat lzegrep lzfgrep lzgrep lzless lzmore unlzma
complete -f -X '!*.@(?(t)xz|tlz|lzma)' unxz xzcat
complete -f -X '!*.lrz' lrunzip
complete -f -X '!*.@(gif|jp?(e)g|miff|tif?(f)|pn[gm]|p[bgp]m|bmp|xpm|ico|xwd|tga|pcx)' ee
complete -f -X '!*.@(gif|jp?(e)g|tif?(f)|png|p[bgp]m|bmp|x[bp]m|rle|rgb|pcx|fits|pm)' xv qiv
complete -f -X '!*.@(@(?(e)ps|?(E)PS|pdf|PDF)?(.gz|.GZ|.bz2|.BZ2|.Z))' gv ggv kghostview
complete -f -X '!*.@(dvi|DVI)?(.@(gz|Z|bz2))' xdvi kdvi
complete -f -X '!*.dvi' dvips dviselect dvitype dvipdf advi dvipdfm dvipdfmx
complete -f -X '!*.[pf]df' acroread gpdf xpdf
complete -f -X '!*.@(?(e)ps|pdf)' kpdf
complete -f -X '!*.@(@(?(e)ps|?(E)PS|[pf]df|[PF]DF|dvi|DVI)?(.gz|.GZ|.bz2|.BZ2)|cb[rz]|djv?(u)|gif|jp?(e)g|miff|tif?(f)|pn[gm]|p[bgp]m|bmp|xpm|ico|xwd|tga|pcx|fdf)' evince
complete -f -X '!*.@(okular|@(?(e|x)ps|?(E|X)PS|pdf|PDF|dvi|DVI|cb[rz]|CB[RZ]|djv?(u)|DJV?(U)|dvi|DVI|gif|jp?(e)g|miff|tif?(f)|pn[gm]|p[bgp]m|bmp|xpm|ico|xwd|tga|pcx|GIF|JP?(E)G|MIFF|TIF?(F)|PN[GM]|P[BGP]M|BMP|XPM|ICO|XWD|TGA|PCX|epub|EPUB|odt|ODT|fb?(2)|FB?(2)|mobi|MOBI|g3|G3|chm|CHM|fdf|FDF)?(.?(gz|GZ|bz2|BZ2)))' okular
complete -f -X '!*.@(?(e)ps|pdf)' ps2pdf ps2pdf12 ps2pdf13 ps2pdf14 ps2pdfwr
complete -f -X '!*.texi*' makeinfo texi2html
complete -f -X '!*.@(?(la)tex|texi|dtx|ins|ltx)' tex latex slitex jadetex pdfjadetex pdftex pdflatex texi2dvi
complete -f -X '!*.mp3' mpg123 mpg321 madplay
complete -f -X '!*@(.@(mp?(e)g|MP?(E)G|wma|avi|AVI|asf|vob|VOB|bin|dat|divx|DIVX|vcd|ps|pes|fli|flv|FLV|fxm|FXM|viv|rm|ram|yuv|mov|MOV|qt|QT|wmv|mp[234]|MP[234]|m4[pv]|M4[PV]|mkv|MKV|og[agmvx]|OG[AGMVX]|t[ps]|T[PS]|m2t?(s)|M2T?(S)|wav|WAV|flac|FLAC|asx|ASX|mng|MNG|srt|m[eo]d|M[EO]D|s[3t]m|S[3T]M|it|IT|xm|XM)|+([0-9]).@(vdr|VDR))?(.part)' xine aaxine fbxine
complete -f -X '!*@(.@(mp?(e)g|MP?(E)G|wma|avi|AVI|asf|vob|VOB|bin|dat|divx|DIVX|vcd|ps|pes|fli|flv|FLV|fxm|FXM|viv|rm|ram|yuv|mov|MOV|qt|QT|wmv|mp[234]|MP[234]|m4[pv]|M4[PV]|mkv|MKV|og[agmvx]|OG[AGMVX]|t[ps]|T[PS]|m2t?(s)|M2T?(S)|wav|WAV|flac|FLAC|asx|ASX|mng|MNG|srt|m[eo]d|M[EO]D|s[3t]m|S[3T]M|it|IT|xm|XM|iso|ISO)|+([0-9]).@(vdr|VDR))?(.part)' kaffeine dragon
complete -f -X '!*.@(avi|asf|wmv)' aviplay
complete -f -X '!*.@(rm?(j)|ra?(m)|smi?(l))' realplay
complete -f -X '!*.@(mpg|mpeg|avi|mov|qt)' xanim
complete -f -X '!*.@(og[ag]|m3u|flac|spx)' ogg123
complete -f -X '!*.@(mp3|og[ag]|pls|m3u)' gqmpeg freeamp
complete -f -X '!*.fig' xfig
complete -f -X '!*.@(mid?(i)|cmf)' playmidi
complete -f -X '!*.@(mid?(i)|rmi|rcp|[gr]36|g18|mod|xm|it|x3m|s[3t]m|kar)' timidity
complete -f -X '!*.@(m[eo]d|s[3t]m|xm|it)' modplugplay modplug123
complete -f -X '*.@(o|so|so.!(conf)|a|[rs]pm|gif|jp?(e)g|mp3|mp?(e)g|avi|asf|ogg|class)' vi vim gvim rvim view rview rgvim rgview gview emacs xemacs sxemacs kate kwrite
complete -f -X '!*.@([eE][xX][eE]?(.[sS][oO])|[cC][oO][mM]|[sS][cC][rR])' wine
complete -f -X '!*.@(zip|z|gz|tgz)' bzme
# konqueror not here on purpose, it's more than a web/html browser
complete -f -X '!*.@(?([xX]|[sS])[hH][tT][mM]?([lL]))' netscape mozilla lynx opera galeon dillo elinks amaya firefox mozilla-firefox iceweasel google-chrome chromium-browser epiphany
complete -f -X '!*.@(sxw|stw|sxg|sgl|doc?([mx])|dot?([mx])|rtf|txt|htm|html|odt|ott|odm)' oowriter
complete -f -X '!*.@(sxi|sti|pps?(x)|ppt?([mx])|pot?([mx])|odp|otp)' ooimpress
complete -f -X '!*.@(sxc|stc|xls?([bmx])|xlw|xlt?([mx])|[ct]sv|ods|ots)' oocalc
complete -f -X '!*.@(sxd|std|sda|sdd|odg|otg)' oodraw
complete -f -X '!*.@(sxm|smf|mml|odf)' oomath
complete -f -X '!*.odb' oobase
complete -f -X '!*.[rs]pm' rpm2cpio
complete -f -X '!*.aux' bibtex
complete -f -X '!*.po' poedit gtranslator kbabel lokalize
complete -f -X '!*.@([Pp][Rr][Gg]|[Cc][Ll][Pp])' harbour gharbour hbpp
complete -f -X '!*.[Hh][Rr][Bb]' hbrun
complete -f -X '!*.ly' lilypond ly2dvi
complete -f -X '!*.@(dif?(f)|?(d)patch)?(.@([gx]z|bz2|lzma))' cdiff
complete -f -X '!*.lyx' lyx
complete -f -X '!@(*.@(ks|jks|jceks|p12|pfx|bks|ubr|gkr|cer|crt|cert|p7b|pkipath|pem|p10|csr|crl)|cacerts)' portecle
complete -f -X '!*.@(mp[234c]|og[ag]|@(fl|a)ac|m4[abp]|spx|tta|w?(a)v|wma|aif?(f)|asf|ape)' kid3 kid3-qt
# FINISH exclude -- do not remove this line

# start of section containing compspecs that can be handled within bash

# user commands see only users
complete -u su write chfn groups slay w sux runuser

# bg completes with stopped jobs
complete -A stopped -P '"%' -S '"' bg

# other job commands
complete -j -P '"%' -S '"' fg jobs disown

# readonly and unset complete with shell variables
complete -v readonly unset

# set completes with set options
complete -A setopt set

# shopt completes with shopt options
complete -A shopt shopt

# helptopics
complete -A helptopic help

# unalias completes with aliases
complete -a unalias

# bind completes with readline bindings (make this more intelligent)
complete -A binding bind

# type and which complete on commands
complete -c command type which

# builtin completes on builtins
complete -b builtin

# start of section containing completion functions called by other functions

# This function checks whether we have a given program on the system.
# No need for bulky functions in memory if we don't.
#
have()
{
    unset -v have
    # Completions for system administrator commands are installed as well in
    # case completion is attempted via `sudo command ...'.
    PATH=$PATH:/sbin:/usr/sbin:/usr/local/sbin type $1 &>/dev/null &&
    have="yes"
}

# This function checks whether a given readline variable
# is `on'.
#
_rl_enabled()
{
    [[ "$( bind -v )" = *$1+([[:space:]])on* ]]
}

# This function shell-quotes the argument
quote()
{
    echo \'${1//\'/\'\\\'\'}\' #'# Help vim syntax highlighting
}

# @see _quote_readline_by_ref()
quote_readline()
{
    local quoted
    _quote_readline_by_ref "$1" ret
    printf %s "$ret"
} # quote_readline()


# This function shell-dequotes the argument
dequote()
{
    eval echo "$1" 2> /dev/null
}


# Assign variable one scope above the caller
# Usage: local "$1" && _upvar $1 "value(s)"
# Param: $1  Variable name to assign value to
# Param: $*  Value(s) to assign.  If multiple values, an array is
#            assigned, otherwise a single value is assigned.
# NOTE: For assigning multiple variables, use '_upvars'.  Do NOT
#       use multiple '_upvar' calls, since one '_upvar' call might
#       reassign a variable to be used by another '_upvar' call.
# See: http://fvue.nl/wiki/Bash:_Passing_variables_by_reference
_upvar() {
    if unset -v "$1"; then           # Unset & validate varname
        if (( $# == 2 )); then
            eval $1=\"\$2\"          # Return single value
        else
            eval $1=\(\"\${@:2}\"\)  # Return array
        fi
    fi
}


# Assign variables one scope above the caller
# Usage: local varname [varname ...] && 
#        _upvars [-v varname value] | [-aN varname [value ...]] ...
# Available OPTIONS:
#     -aN  Assign next N values to varname as array
#     -v   Assign single value to varname
# Return: 1 if error occurs
# See: http://fvue.nl/wiki/Bash:_Passing_variables_by_reference
_upvars() {
    if ! (( $# )); then
        echo "${FUNCNAME[0]}: usage: ${FUNCNAME[0]} [-v varname"\
            "value] | [-aN varname [value ...]] ..." 1>&2
        return 2
    fi
    while (( $# )); do
        case $1 in
            -a*)
                # Error checking
                [[ ${1#-a} ]] || { echo "bash: ${FUNCNAME[0]}: \`$1': missing"\
                    "number specifier" 1>&2; return 1; }
                printf %d "${1#-a}" &> /dev/null || { echo "bash:"\
                    "${FUNCNAME[0]}: \`$1': invalid number specifier" 1>&2
                    return 1; }
                # Assign array of -aN elements
                [[ "$2" ]] && unset -v "$2" && eval $2=\(\"\${@:3:${1#-a}}\"\) && 
                shift $((${1#-a} + 2)) || { echo "bash: ${FUNCNAME[0]}:"\
                    "\`$1${2+ }$2': missing argument(s)" 1>&2; return 1; }
                ;;
            -v)
                # Assign single value
                [[ "$2" ]] && unset -v "$2" && eval $2=\"\$3\" &&
                shift 3 || { echo "bash: ${FUNCNAME[0]}: $1: missing"\
                "argument(s)" 1>&2; return 1; }
                ;;
            *)
                echo "bash: ${FUNCNAME[0]}: $1: invalid option" 1>&2
                return 1 ;;
        esac
    done
}


# Reassemble command line words, excluding specified characters from the
# list of word completion separators (COMP_WORDBREAKS).
# @param $1 chars  Characters out of $COMP_WORDBREAKS which should
#     NOT be considered word breaks. This is useful for things like scp where
#     we want to return host:path and not only path, so we would pass the
#     colon (:) as $1 here.
# @param $2 words  Name of variable to return words to
# @param $3 cword  Name of variable to return cword to
#
__reassemble_comp_words_by_ref() {
    local exclude i j ref
    # Exclude word separator characters?
    if [[ $1 ]]; then
        # Yes, exclude word separator characters;
        # Exclude only those characters, which were really included
        exclude="${1//[^$COMP_WORDBREAKS]}"
    fi
        
    # Default to cword unchanged
    eval $3=$COMP_CWORD
    # Are characters excluded which were former included?
    if [[ $exclude ]]; then
        # Yes, list of word completion separators has shrunk;
        # Re-assemble words to complete
        for (( i=0, j=0; i < ${#COMP_WORDS[@]}; i++, j++)); do
            # Is current word not word 0 (the command itself) and is word not
            # empty and is word made up of just word separator characters to be
            # excluded?
            while [[ $i -gt 0 && ${COMP_WORDS[$i]} && 
                ${COMP_WORDS[$i]//[^$exclude]} == ${COMP_WORDS[$i]} 
            ]]; do
                [ $j -ge 2 ] && ((j--))
                # Append word separator to current word
                ref="$2[$j]"
                eval $2[$j]=\${!ref}\${COMP_WORDS[i]}
                # Indicate new cword
                [ $i = $COMP_CWORD ] && eval $3=$j
                # Indicate next word if available, else end *both* while and for loop
                (( $i < ${#COMP_WORDS[@]} - 1)) && ((i++)) || break 2
            done
            # Append word to current word
            ref="$2[$j]"
            eval $2[$j]=\${!ref}\${COMP_WORDS[i]}
            # Indicate new cword
            [[ $i == $COMP_CWORD ]] && eval $3=$j
        done
    else
        # No, list of word completions separators hasn't changed;
        eval $2=\( \"\${COMP_WORDS[@]}\" \)
    fi
} # __reassemble_comp_words_by_ref()


# @param $1 exclude  Characters out of $COMP_WORDBREAKS which should NOT be
#     considered word breaks. This is useful for things like scp where
#     we want to return host:path and not only path, so we would pass the
#     colon (:) as $1 in this case.  Bash-3 doesn't do word splitting, so this
#     ensures we get the same word on both bash-3 and bash-4.
# @param $2 words  Name of variable to return words to
# @param $3 cword  Name of variable to return cword to
# @param $4 cur  Name of variable to return current word to complete to
# @see ___get_cword_at_cursor_by_ref()
__get_cword_at_cursor_by_ref() {
    local cword words=()
    __reassemble_comp_words_by_ref "$1" words cword

    local i cur2
    local cur="$COMP_LINE"
    local index="$COMP_POINT"
    for (( i = 0; i <= cword; ++i )); do
        while [[
            # Current word fits in $cur?
            "${#cur}" -ge ${#words[i]} &&
            # $cur doesn't match cword?
            "${cur:0:${#words[i]}}" != "${words[i]}"
        ]]; do
            # Strip first character
            cur="${cur:1}"
            # Decrease cursor position
            ((index--))
        done

        # Does found word matches cword?
        if [[ "$i" -lt "$cword" ]]; then
            # No, cword lies further;
            local old_size="${#cur}"
            cur="${cur#${words[i]}}"
            local new_size="${#cur}"
            index=$(( index - old_size + new_size ))
        fi
    done

    if [[ "${words[cword]:0:${#cur}}" != "$cur" ]]; then
        # We messed up. At least return the whole word so things keep working
        cur2=${words[cword]}
    else
        cur2=${cur:0:$index}
    fi

    local "$2" "$3" "$4" && 
        _upvars -a${#words[@]} $2 "${words[@]}" -v $3 "$cword" -v $4 "$cur2"
}


# Get the word to complete and optional previous words.
# This is nicer than ${COMP_WORDS[$COMP_CWORD]}, since it handles cases
# where the user is completing in the middle of a word.
# (For example, if the line is "ls foobar",
# and the cursor is here -------->   ^
# Also one is able to cross over possible wordbreak characters.
# Usage: _get_comp_words_by_ref [OPTIONS] [VARNAMES]
# Available VARNAMES:
#     cur         Return cur via $cur
#     prev        Return prev via $prev
#     words       Return words via $words
#     cword       Return cword via $cword
#
# Available OPTIONS:
#     -n EXCLUDE  Characters out of $COMP_WORDBREAKS which should NOT be 
#                 considered word breaks. This is useful for things like scp
#                 where we want to return host:path and not only path, so we
#                 would pass the colon (:) as -n option in this case.  Bash-3
#                 doesn't do word splitting, so this ensures we get the same
#                 word on both bash-3 and bash-4.
#     -c VARNAME  Return cur via $VARNAME
#     -p VARNAME  Return prev via $VARNAME
#     -w VARNAME  Return words via $VARNAME
#     -i VARNAME  Return cword via $VARNAME
#
# Example usage:
#
#    $ _get_comp_words_by_ref -n : cur prev
#
_get_comp_words_by_ref()
{
    local exclude flag i OPTIND=1
    local cur cword words=()
    local upargs=() upvars=() vcur vcword vprev vwords

    while getopts "c:i:n:p:w:" flag "$@"; do
        case $flag in
            c) vcur=$OPTARG ;;
            i) vcword=$OPTARG ;;
            n) exclude=$OPTARG ;;
            p) vprev=$OPTARG ;;
            w) vwords=$OPTARG ;;
        esac
    done
    while [[ $# -ge $OPTIND ]]; do 
        case ${!OPTIND} in
            cur)   vcur=cur ;;
            prev)  vprev=prev ;;
            cword) vcword=cword ;;
            words) vwords=words ;;
            *) echo "bash: $FUNCNAME(): \`${!OPTIND}': unknown argument" \
                1>&2; return 1
        esac
        let "OPTIND += 1"
    done

    __get_cword_at_cursor_by_ref "$exclude" words cword cur

    [[ $vcur   ]] && { upvars+=("$vcur"  ); upargs+=(-v $vcur   "$cur"  ); }
    [[ $vcword ]] && { upvars+=("$vcword"); upargs+=(-v $vcword "$cword"); }
    [[ $vprev  ]] && { upvars+=("$vprev" ); upargs+=(-v $vprev 
        "${words[cword - 1]}"); }
    [[ $vwords ]] && { upvars+=("$vwords"); upargs+=(-a${#words[@]} $vwords
        "${words[@]}"); }

    (( ${#upvars[@]} )) && local "${upvars[@]}" && _upvars "${upargs[@]}"
}


# Get the word to complete.
# This is nicer than ${COMP_WORDS[$COMP_CWORD]}, since it handles cases
# where the user is completing in the middle of a word.
# (For example, if the line is "ls foobar",
# and the cursor is here -------->   ^
# @param $1 string  Characters out of $COMP_WORDBREAKS which should NOT be
#     considered word breaks. This is useful for things like scp where
#     we want to return host:path and not only path, so we would pass the
#     colon (:) as $1 in this case.  Bash-3 doesn't do word splitting, so this
#     ensures we get the same word on both bash-3 and bash-4.
# @param $2 integer  Index number of word to return, negatively offset to the
#     current word (default is 0, previous is 1), respecting the exclusions
#     given at $1.  For example, `_get_cword "=:" 1' returns the word left of
#     the current word, respecting the exclusions "=:".
# @deprecated  Use `_get_comp_words_by_ref cur' instead
# @see _get_comp_words_by_ref()
_get_cword()
{
    local LC_CTYPE=C
    local cword words
    __reassemble_comp_words_by_ref "$1" words cword

    # return previous word offset by $2
    if [[ ${2//[^0-9]/} ]]; then
        printf "%s" "${words[cword-$2]}"
    elif [[ "${#words[cword]}" -eq 0 || "$COMP_POINT" == "${#COMP_LINE}" ]]; then
        printf "%s" "${words[cword]}"
    else
        local i
        local cur="$COMP_LINE"
        local index="$COMP_POINT"
        for (( i = 0; i <= cword; ++i )); do
            while [[
                # Current word fits in $cur?
                "${#cur}" -ge ${#words[i]} &&
                # $cur doesn't match cword?
                "${cur:0:${#words[i]}}" != "${words[i]}"
            ]]; do
                # Strip first character
                cur="${cur:1}"
                # Decrease cursor position
                ((index--))
            done

            # Does found word matches cword?
            if [[ "$i" -lt "$cword" ]]; then
                # No, cword lies further;
                local old_size="${#cur}"
                cur="${cur#${words[i]}}"
                local new_size="${#cur}"
                index=$(( index - old_size + new_size ))
            fi
        done

        if [[ "${words[cword]:0:${#cur}}" != "$cur" ]]; then
            # We messed up! At least return the whole word so things
            # keep working
            printf "%s" "${words[cword]}"
        else
            printf "%s" "${cur:0:$index}"
        fi
    fi
} # _get_cword()


# Get word previous to the current word.
# This is a good alternative to `prev=${COMP_WORDS[COMP_CWORD-1]}' because bash4
# will properly return the previous word with respect to any given exclusions to
# COMP_WORDBREAKS.
# @deprecated  Use `_get_comp_words_by_ref cur prev' instead
# @see _get_comp_words_by_ref()
#
_get_pword() 
{
    if [ $COMP_CWORD -ge 1 ]; then
        _get_cword "${@:-}" 1;
    fi
}


# If the word-to-complete contains a colon (:), left-trim COMPREPLY items with
# word-to-complete.
# On bash-3, and bash-4 with a colon in COMP_WORDBREAKS, words containing
# colons are always completed as entire words if the word to complete contains
# a colon.  This function fixes this, by removing the colon-containing-prefix
# from COMPREPLY items.
# The preferred solution is to remove the colon (:) from COMP_WORDBREAKS in
# your .bashrc:
#
#    # Remove colon (:) from list of word completion separators
#    COMP_WORDBREAKS=${COMP_WORDBREAKS//:}
#
# See also: Bash FAQ - E13) Why does filename completion misbehave if a colon
# appears in the filename? - http://tiswww.case.edu/php/chet/bash/FAQ
# @param $1 current word to complete (cur)
# @modifies global array $COMPREPLY
#
__ltrim_colon_completions() {
    # If word-to-complete contains a colon,
    # and bash-version < 4,
    # or bash-version >= 4 and COMP_WORDBREAKS contains a colon
    if [[
        "$1" == *:* && (
            ${BASH_VERSINFO[0]} -lt 4 || 
            (${BASH_VERSINFO[0]} -ge 4 && "$COMP_WORDBREAKS" == *:*) 
        )
    ]]; then
        # Remove colon-word prefix from COMPREPLY items
        local colon_word=${1%${1##*:}}
        local i=${#COMPREPLY[*]}
        while [ $((--i)) -ge 0 ]; do
            COMPREPLY[$i]=${COMPREPLY[$i]#"$colon_word"}
        done
    fi
} # __ltrim_colon_completions()


# This function quotes the argument in a way so that readline dequoting
# results in the original argument.  This is necessary for at least
# `compgen' which requires its arguments quoted/escaped:
#
#     $ ls "a'b/"
#     c
#     $ compgen -f "a'b/"       # Wrong, doesn't return output
#     $ compgen -f "a\'b/"      # Good (bash-4)
#     a\'b/c
#     $ compgen -f "a\\\\\'b/"  # Good (bash-3)
#     a\'b/c
#
# On bash-3, special characters need to be escaped extra.  This is
# unless the first character is a single quote (').  If the single
# quote appears further down the string, bash default completion also
# fails, e.g.:
#
#     $ ls 'a&b/'
#     f
#     $ foo 'a&b/<TAB>  # Becomes: foo 'a&b/f'
#     $ foo a'&b/<TAB>  # Nothing happens
#
# See also:
# - http://lists.gnu.org/archive/html/bug-bash/2009-03/msg00155.html
# - http://www.mail-archive.com/bash-completion-devel@lists.alioth.\
#   debian.org/msg01944.html
# @param $1  Argument to quote
# @param $2  Name of variable to return result to
_quote_readline_by_ref()
{
    if [[ ${1:0:1} == "'" ]]; then
        if [[ ${BASH_VERSINFO[0]} -ge 4 ]]; then
            # Leave out first character
            printf -v $2 %s "${1:1}"
        else
            # Quote word, leaving out first character
            printf -v $2 %q "${1:1}"
            # Double-quote word (bash-3)
            printf -v $2 %q ${!2}
        fi
    elif [[ ${BASH_VERSINFO[0]} -le 3 && ${1:0:1} == '"' ]]; then
        printf -v $2 %q "${1:1}"
    else
        printf -v $2 %q "$1"
    fi

    # If result becomes quoted like this: $'string', re-evaluate in order to
    # drop the additional quoting.  See also: http://www.mail-archive.com/
    # bash-completion-devel@lists.alioth.debian.org/msg01942.html
    [[ ${!2:0:1} == '$' ]] && eval $2=${!2}
} # _quote_readline_by_ref()


# This function turns on "-o filenames" behavior dynamically. It is present
# for bash < 4 reasons. See http://bugs.debian.org/272660#64 for info about
# the bash < 4 compgen hack.
_compopt_o_filenames()
{
    # We test for compopt availability first because directly invoking it on
    # bash < 4 at this point may cause terminal echo to be turned off for some
    # reason, see https://bugzilla.redhat.com/653669 for more info.
    type compopt &>/dev/null && compopt -o filenames 2>/dev/null || \
        compgen -f /non-existing-dir/ >/dev/null
}


# This function performs file and directory completion. It's better than
# simply using 'compgen -f', because it honours spaces in filenames.
# @param $1  If `-d', complete only on directories.  Otherwise filter/pick only
#            completions with `.$1' and the uppercase version of it as file
#            extension.
#
_filedir()
{
    local i IFS=$'\n' xspec

    _tilde "$cur" || return 0

    local -a toks
    local quoted tmp

    _quote_readline_by_ref "$cur" quoted
    toks=( ${toks[@]-} $(
        compgen -d -- "$quoted" | {
            while read -r tmp; do
                # TODO: I have removed a "[ -n $tmp ] &&" before 'printf ..',
                #       and everything works again. If this bug suddenly
                #       appears again (i.e. "cd /b<TAB>" becomes "cd /"),
                #       remember to check for other similar conditionals (here
                #       and _filedir_xspec()). --David
                printf '%s\n' $tmp
            done
        }
    ))

    if [[ "$1" != -d ]]; then
        # Munge xspec to contain uppercase version too
        [[ ${BASH_VERSINFO[0]} -ge 4 ]] && \
            xspec=${1:+"!*.@($1|${1^^})"} || \
            xspec=${1:+"!*.@($1|$(printf %s $1 | tr '[:lower:]' '[:upper:]'))"}
        toks=( ${toks[@]-} $( compgen -f -X "$xspec" -- $quoted) )
    fi
    [ ${#toks[@]} -ne 0 ] && _compopt_o_filenames

    # If the filter failed to produce anything, try w/o it (LP: #533985)
    if [[ -n "$1" ]] && [[ "$1" != -d ]] && [[ ${#toks[@]} -lt 1 ]] ; then
       toks=( ${toks[@]-} $( compgen -f -X -- $quoted) )
    fi

    COMPREPLY=( "${COMPREPLY[@]}" "${toks[@]}" )
} # _filedir()


# This function splits $cur=--foo=bar into $prev=--foo, $cur=bar, making it
# easier to support both "--foo bar" and "--foo=bar" style completions.
# Returns 0 if current option was split, 1 otherwise.
#
_split_longopt()
{
    if [[ "$cur" == --?*=* ]]; then
        # Cut also backslash before '=' in case it ended up there
        # for some reason.
        prev="${cur%%?(\\)=*}"
        cur="${cur#*=}"
        return 0
    fi

    return 1
}

# This function tries to parse the help output of the given command.
# @param $1  command
# @param $2  command options (default: --help)
#
_parse_help() {
    $1 ${2:---help} 2>&1 | sed -e '/^[[:space:]]*-/!d' -e 's|[,/]| |g' | \
        awk '{ print $1; if ($2 ~ /^-/) { print $2 } }' | sed -e 's|[<=].*||'
}

# This function completes on signal names
#
_signals()
{
    local i

    # standard signal completion is rather braindead, so we need
    # to hack around to get what we want here, which is to
    # complete on a dash, followed by the signal name minus
    # the SIG prefix
    COMPREPLY=( $( compgen -A signal SIG${cur#-} ))
    for (( i=0; i < ${#COMPREPLY[@]}; i++ )); do
        COMPREPLY[i]=-${COMPREPLY[i]#SIG}
    done
}

# This function completes on known mac addresses
#
_mac_addresses()
{
    local re='\([A-Fa-f0-9]\{2\}:\)\{5\}[A-Fa-f0-9]\{2\}'
    local PATH="$PATH:/sbin:/usr/sbin"

    # Local interfaces (Linux only?)
    COMPREPLY=( "${COMPREPLY[@]}" $( ifconfig -a 2>/dev/null | sed -ne \
        "s/.*[[:space:]]HWaddr[[:space:]]\{1,\}\($re\)[[:space:]]*$/\1/p" ) )

    # ARP cache
    COMPREPLY=( "${COMPREPLY[@]}" $( arp -an 2>/dev/null | sed -ne \
        "s/.*[[:space:]]\($re\)[[:space:]].*/\1/p" -ne \
        "s/.*[[:space:]]\($re\)[[:space:]]*$/\1/p" ) )

    # /etc/ethers
    COMPREPLY=( "${COMPREPLY[@]}" $( sed -ne \
        "s/^[[:space:]]*\($re\)[[:space:]].*/\1/p" /etc/ethers 2>/dev/null ) )

    COMPREPLY=( $( compgen -W '${COMPREPLY[@]}' -- "$cur" ) )
    __ltrim_colon_completions "$cur"
}

# This function completes on configured network interfaces
#
_configured_interfaces()
{
    if [ -f /etc/debian_version ]; then
        # Debian system
        COMPREPLY=( $( compgen -W "$( sed -ne 's|^iface \([^ ]\{1,\}\).*$|\1|p'\
            /etc/network/interfaces )" -- "$cur" ) )
    elif [ -f /etc/SuSE-release ]; then
        # SuSE system
        COMPREPLY=( $( compgen -W "$( printf '%s\n' \
            /etc/sysconfig/network/ifcfg-* | \
            sed -ne 's|.*ifcfg-\(.*\)|\1|p' )" -- "$cur" ) )
    elif [ -f /etc/pld-release ]; then
        # PLD Linux
        COMPREPLY=( $( compgen -W "$( command ls -B \
            /etc/sysconfig/interfaces | \
            sed -ne 's|.*ifcfg-\(.*\)|\1|p' )" -- "$cur" ) )
    else
        # Assume Red Hat
        COMPREPLY=( $( compgen -W "$( printf '%s\n' \
            /etc/sysconfig/network-scripts/ifcfg-* | \
            sed -ne 's|.*ifcfg-\(.*\)|\1|p' )" -- "$cur" ) )
    fi
}

# This function completes on available kernels
#
_kernel_versions()
{
    COMPREPLY=( $( compgen -W '$( command ls /lib/modules )' -- "$cur" ) )
}

# This function completes on all available network interfaces
# -a: restrict to active interfaces only
# -w: restrict to wireless interfaces only
#
_available_interfaces()
{
    local cmd

    if [ "${1:-}" = -w ]; then
        cmd="iwconfig"
    elif [ "${1:-}" = -a ]; then
        cmd="ifconfig"
    else
        cmd="ifconfig -a"
    fi

    COMPREPLY=( $( eval PATH="$PATH:/sbin" $cmd 2>/dev/null | \
        awk '/^[^ \t]/ { print $1 }' ) )
    COMPREPLY=( $( compgen -W '${COMPREPLY[@]/%[[:punct:]]/}' -- "$cur" ) )
}


# Perform tilde (~) completion
# @return  True (0) if completion needs further processing, 
#          False (> 0) if tilde is followed by a valid username, completions
#          are put in COMPREPLY and no further processing is necessary.
_tilde() {
    local result=0
    # Does $1 start with tilde (~) and doesn't contain slash (/)?
    if [[ ${1:0:1} == "~" && $1 == ${1//\/} ]]; then
        _compopt_o_filenames
        # Try generate username completions
        COMPREPLY=( $( compgen -P '~' -u "${1#\~}" ) )
        result=${#COMPREPLY[@]}
    fi
    return $result
}


# Expand variable starting with tilde (~)
# We want to expand ~foo/... to /home/foo/... to avoid problems when
# word-to-complete starting with a tilde is fed to commands and ending up
# quoted instead of expanded.
# Only the first portion of the variable from the tilde up to the first slash
# (~../) is expanded.  The remainder of the variable, containing for example
# a dollar sign variable ($) or asterisk (*) is not expanded.
# Example usage:
#
#    $ v="~"; __expand_tilde_by_ref v; echo "$v"
#
# Example output:
#
#       v                  output
#    --------         ----------------
#    ~                /home/user
#    ~foo/bar         /home/foo/bar
#    ~foo/$HOME       /home/foo/$HOME
#    ~foo/a  b        /home/foo/a  b
#    ~foo/*           /home/foo/*
#  
# @param $1  Name of variable (not the value of the variable) to expand
__expand_tilde_by_ref() {
    # Does $1 start with tilde (~)?
    if [ "${!1:0:1}" = "~" ]; then
        # Does $1 contain slash (/)?
        if [ "${!1}" != "${!1//\/}" ]; then
            # Yes, $1 contains slash;
            # 1: Remove * including and after first slash (/), i.e. "~a/b"
            #    becomes "~a".  Double quotes allow eval.
            # 2: Remove * before the first slash (/), i.e. "~a/b"
            #    becomes "b".  Single quotes prevent eval.
            #       +-----1----+ +---2----+
            eval $1="${!1/%\/*}"/'${!1#*/}'
        else 
            # No, $1 doesn't contain slash
            eval $1="${!1}"
        fi
    fi
} # __expand_tilde_by_ref()


# This function expands tildes in pathnames
#
_expand()
{
    # FIXME: Why was this here?
    #[ "$cur" != "${cur%\\}" ] && cur="$cur\\"

    # Expand ~username type directory specifications.  We want to expand
    # ~foo/... to /home/foo/... to avoid problems when $cur starting with
    # a tilde is fed to commands and ending up quoted instead of expanded.

    if [[ "$cur" == \~*/* ]]; then
        eval cur=$cur
    elif [[ "$cur" == \~* ]]; then
        cur=${cur#\~}
        COMPREPLY=( $( compgen -P '~' -u "$cur" ) )
        [ ${#COMPREPLY[@]} -eq 1 ] && eval COMPREPLY[0]=${COMPREPLY[0]}
        return ${#COMPREPLY[@]}
    fi
}

# This function completes on process IDs.
# AIX and Solaris ps prefers X/Open syntax.
[[ $UNAME == SunOS || $UNAME == AIX ]] &&
_pids()
{
    COMPREPLY=( $( compgen -W '$( command ps -efo pid | sed 1d )' -- "$cur" ))
} ||
_pids()
{
    COMPREPLY=( $( compgen -W '$( command ps axo pid= )' -- "$cur" ) )
}

# This function completes on process group IDs.
# AIX and SunOS prefer X/Open, all else should be BSD.
[[ $UNAME == SunOS || $UNAME == AIX ]] &&
_pgids()
{
    COMPREPLY=( $( compgen -W '$( command ps -efo pgid | sed 1d )' -- "$cur" ))
} ||
_pgids()
{
    COMPREPLY=( $( compgen -W '$( command ps axo pgid= )' -- "$cur" ))
}

# This function completes on process names.
# AIX and SunOS prefer X/Open, all else should be BSD.
[[ $UNAME == SunOS || $UNAME == AIX ]] &&
_pnames()
{
    COMPREPLY=( $( compgen -X '<defunct>' -W '$( command ps -efo comm | \
        sed -e 1d -e "s:.*/::" -e "s/^-//" | sort -u )' -- "$cur" ) )
} ||
_pnames()
{
    # FIXME: completes "[kblockd/0]" to "0". Previously it was completed
    # to "kblockd" which isn't correct either. "kblockd/0" would be
    # arguably most correct, but killall from psmisc 22 treats arguments
    # containing "/" specially unless -r is given so that wouldn't quite
    # work either. Perhaps it'd be best to not complete these to anything
    # for now.
    # Not using "ps axo comm" because under some Linux kernels, it
    # truncates command names (see e.g. http://bugs.debian.org/497540#19)
    COMPREPLY=( $( compgen -X '<defunct>' -W '$( command ps axo command= | \
        sed -e "s/ .*//" -e "s:.*/::" -e "s/:$//" -e "s/^[[(-]//" \
            -e "s/[])]$//" | sort -u )' -- "$cur" ) )
}

# This function completes on user IDs
#
_uids()
{
    if type getent &>/dev/null; then
        COMPREPLY=( $( compgen -W '$( getent passwd | cut -d: -f3 )' -- "$cur" ) )
    elif type perl &>/dev/null; then
        COMPREPLY=( $( compgen -W '$( perl -e '"'"'while (($uid) = (getpwent)[2]) { print $uid . "\n" }'"'"' )' -- "$cur" ) )
    else
        # make do with /etc/passwd
        COMPREPLY=( $( compgen -W '$( cut -d: -f3 /etc/passwd )' -- "$cur" ) )
    fi
}

# This function completes on group IDs
#
_gids()
{
    if type getent &>/dev/null; then
        COMPREPLY=( $( compgen -W '$( getent group | cut -d: -f3 )' \
            -- "$cur" ) )
    elif type perl &>/dev/null; then
        COMPREPLY=( $( compgen -W '$( perl -e '"'"'while (($gid) = (getgrent)[2]) { print $gid . "\n" }'"'"' )' -- "$cur" ) )
    else
        # make do with /etc/group
        COMPREPLY=( $( compgen -W '$( cut -d: -f3 /etc/group )' -- "$cur" ) )
    fi
}

# This function completes on services
#
_services()
{
    local sysvdir famdir
    [ -d /etc/rc.d/init.d ] && sysvdir=/etc/rc.d/init.d || sysvdir=/etc/init.d
    famdir=/etc/xinetd.d
    COMPREPLY=( $( printf '%s\n' \
        $sysvdir/!(*.rpm@(orig|new|save)|*~|functions) ) )

    if [ -d $famdir ]; then
        COMPREPLY=( "${COMPREPLY[@]}" $( printf '%s\n' \
            $famdir/!(*.rpm@(orig|new|save)|*~) ) )
    fi

    COMPREPLY=( $( compgen -W '${COMPREPLY[@]#@($sysvdir|$famdir)/}' -- "$cur" ) )
}

# This function completes on modules
#
_modules()
{
    local modpath
    modpath=/lib/modules/$1
    COMPREPLY=( $( compgen -W "$( command ls -R $modpath | \
        sed -ne 's/^\(.*\)\.k\{0,1\}o\(\.gz\)\{0,1\}$/\1/p' )" -- "$cur" ) )
}

# This function completes on installed modules
#
_installed_modules()
{
    COMPREPLY=( $( compgen -W "$( PATH="$PATH:/sbin" lsmod | \
        awk '{if (NR != 1) print $1}' )" -- "$1" ) )
}

# This function completes on user or user:group format; as for chown and cpio.
#
# The : must be added manually; it will only complete usernames initially.
# The legacy user.group format is not supported.
#
# @param $1  If -u, only return users/groups the user has access to in
#            context of current completion.
_usergroup()
{
    if [[ $cur = *\\\\* || $cur = *:*:* ]]; then
        # Give up early on if something seems horribly wrong.
        return
    elif [[ $cur = *\\:* ]]; then
        # Completing group after 'user\:gr<TAB>'.
        # Reply with a list of groups prefixed with 'user:', readline will
        # escape to the colon.
        local prefix
        prefix=${cur%%*([^:])}
        prefix=${prefix//\\}
        local mycur="${cur#*[:]}"
        if [[ $1 == -u ]]; then
            _allowed_groups "$mycur"
        else
            local IFS=$'\n'
            COMPREPLY=( $( compgen -g -- "$mycur" ) )
        fi
        COMPREPLY=( $( compgen -P "$prefix" -W "${COMPREPLY[@]}" ) )
    elif [[ $cur = *:* ]]; then
        # Completing group after 'user:gr<TAB>'.
        # Reply with a list of unprefixed groups since readline with split on :
        # and only replace the 'gr' part
        local mycur="${cur#*:}"
        if [[ $1 == -u ]]; then
            _allowed_groups "$mycur"
        else
            local IFS=$'\n'
            COMPREPLY=( $( compgen -g -- "$mycur" ) )
        fi
    else
        # Completing a partial 'usernam<TAB>'.
        #
        # Don't suffix with a : because readline will escape it and add a
        # slash. It's better to complete into 'chown username ' than 'chown
        # username\:'.
        if [[ $1 == -u ]]; then
            _allowed_users "$cur"
        else
            local IFS=$'\n'
            COMPREPLY=( $( compgen -u -- "$cur" ) )
        fi
    fi
}

_allowed_users()
{
    if _complete_as_root; then
        local IFS=$'\n'
        COMPREPLY=( $( compgen -u -- "${1:-$cur}" ) )
    else
        local IFS=$'\n '
        COMPREPLY=( $( compgen -W \
            "$( id -un 2>/dev/null || whoami 2>/dev/null )" -- "${1:-$cur}" ) )
    fi
}

_allowed_groups()
{
    if _complete_as_root; then
        local IFS=$'\n'
        COMPREPLY=( $( compgen -g -- "$1" ) )
    else
        local IFS=$'\n '
        COMPREPLY=( $( compgen -W \
            "$( id -Gn 2>/dev/null || groups 2>/dev/null )" -- "$1" ) )
    fi
}

# This function completes on valid shells
#
_shells()
{
    COMPREPLY=( "${COMPREPLY[@]}" $( compgen -W \
        '$( command grep "^[[:space:]]*/" /etc/shells 2>/dev/null )' \
        -- "$cur" ) )
}

# This function completes on valid filesystem types
#
_fstypes()
{
    local fss

    if [ -e /proc/filesystems ] ; then
        # Linux
        fss="$( cut -d$'\t' -f2 /proc/filesystems )
             $( awk '! /\*/ { print $NF }' /etc/filesystems 2>/dev/null )"
    else
        # Generic
        fss="$( awk '/^[ \t]*[^#]/ { print $3 }' /etc/fstab 2>/dev/null )
             $( awk '/^[ \t]*[^#]/ { print $3 }' /etc/mnttab 2>/dev/null )
             $( awk '/^[ \t]*[^#]/ { print $4 }' /etc/vfstab 2>/dev/null )
             $( awk '{ print $1 }' /etc/dfs/fstypes 2>/dev/null )
             $( [ -d /etc/fs ] && command ls /etc/fs )"
    fi

    [ -n "$fss" ] && \
        COMPREPLY=( "${COMPREPLY[@]}" $( compgen -W "$fss" -- "$cur" ) )
}

# Get real command.
# - arg: $1  Command
# - stdout:  Filename of command in PATH with possible symbolic links resolved.
#            Empty string if command not found.
# - return:  True (0) if command found, False (> 0) if not.
_realcommand()
{
    type -P "$1" > /dev/null && {
        if type -p realpath > /dev/null; then
            realpath "$(type -P "$1")"
        elif type -p readlink > /dev/null; then
            readlink -f "$(type -P "$1")"
        else
            type -P "$1"
        fi
    }
}

# This function returns the first arugment, excluding options
# @param $1 chars  Characters out of $COMP_WORDBREAKS which should
#     NOT be considered word breaks. See __reassemble_comp_words_by_ref.
_get_first_arg()
{
    local i

    arg=
    for (( i=1; i < COMP_CWORD; i++ )); do
        if [[ "${COMP_WORDS[i]}" != -* ]]; then
            arg=${COMP_WORDS[i]}
            break
        fi
    done
}


# This function counts the number of args, excluding options
# @param $1 chars  Characters out of $COMP_WORDBREAKS which should
#     NOT be considered word breaks. See __reassemble_comp_words_by_ref.
_count_args()
{
    local i cword words
    __reassemble_comp_words_by_ref "$1" words cword

    args=1
    for i in "${words[@]:1:cword-1}"; do
        [[ "$i" != -* ]] && args=$(($args+1))
    done
}

# This function completes on PCI IDs
#
_pci_ids()
{
    COMPREPLY=( ${COMPREPLY[@]:-} $( compgen -W \
        "$( PATH="$PATH:/sbin" lspci -n | awk '{print $3}')" -- "$cur" ) )
}

# This function completes on USB IDs
#
_usb_ids()
{
    COMPREPLY=( ${COMPREPLY[@]:-} $( compgen -W \
        "$( PATH="$PATH:/sbin" lsusb | awk '{print $6}' )" -- "$cur" ) )
}

# CD device names
_cd_devices()
{
    COMPREPLY=( "${COMPREPLY[@]}"
        $( compgen -f -d -X "!*/?([amrs])cd*" -- "${cur:-/dev/}" ) )
}

# DVD device names
_dvd_devices()
{
    COMPREPLY=( "${COMPREPLY[@]}"
        $( compgen -f -d -X "!*/?(r)dvd*" -- "${cur:-/dev/}" ) )
}

# start of section containing completion functions for external programs

# a little help for FreeBSD ports users
[ $UNAME = FreeBSD ] && complete -W 'index search fetch fetch-list extract \
    patch configure build install reinstall deinstall clean clean-depends \
    kernel buildworld' make

# This function provides simple user@host completion
#
_user_at_host() {
    local cur

    COMPREPLY=()
    _get_comp_words_by_ref -n : cur

    if [[ $cur == *@* ]]; then
        _known_hosts_real "$cur"
    else
        COMPREPLY=( $( compgen -u -- "$cur" ) )
    fi

    return 0
}
shopt -u hostcomplete && complete -F _user_at_host -o nospace talk ytalk finger

# NOTE: Using this function as a helper function is deprecated.  Use
#       `_known_hosts_real' instead.
_known_hosts()
{
    local options
    COMPREPLY=()

    # NOTE: Using `_known_hosts' as a helper function and passing options
    #       to `_known_hosts' is deprecated: Use `_known_hosts_real' instead.
    [[ "$1" == -a || "$2" == -a ]] && options=-a
    [[ "$1" == -c || "$2" == -c ]] && options="$options -c"
    _known_hosts_real $options "$(_get_cword :)"
} # _known_hosts()

# Helper function for completing _known_hosts.
# This function performs host completion based on ssh's config and known_hosts
# files, as well as hostnames reported by avahi-browse if
# COMP_KNOWN_HOSTS_WITH_AVAHI is set to a non-empty value.  Also hosts from
# HOSTFILE (compgen -A hostname) are added, unless
# COMP_KNOWN_HOSTS_WITH_HOSTFILE is set to an empty value.
# Usage: _known_hosts_real [OPTIONS] CWORD
# Options:  -a             Use aliases
#           -c             Use `:' suffix
#           -F configfile  Use `configfile' for configuration settings
#           -p PREFIX      Use PREFIX
# Return: Completions, starting with CWORD, are added to COMPREPLY[]
_known_hosts_real()
{
    local configfile flag prefix
    local cur curd awkcur user suffix aliases i host
    local -a kh khd config

    local OPTIND=1
    while getopts "acF:p:" flag "$@"; do
        case $flag in
            a) aliases='yes' ;;
            c) suffix=':' ;;
            F) configfile=$OPTARG ;;
            p) prefix=$OPTARG ;;
        esac
    done
    [ $# -lt $OPTIND ] && echo "error: $FUNCNAME: missing mandatory argument CWORD"
    cur=${!OPTIND}; let "OPTIND += 1"
    [ $# -ge $OPTIND ] && echo "error: $FUNCNAME("$@"): unprocessed arguments:"\
    $(while [ $# -ge $OPTIND ]; do printf '%s\n' ${!OPTIND}; shift; done)

    [[ $cur == *@* ]] && user=${cur%@*}@ && cur=${cur#*@}
    kh=()

    # ssh config files
    if [ -n "$configfile" ]; then
        [ -r "$configfile" ] &&
        config=( "${config[@]}" "$configfile" )
    else
        for i in /etc/ssh/ssh_config "${HOME}/.ssh/config" \
            "${HOME}/.ssh2/config"; do
            [ -r $i ] && config=( "${config[@]}" "$i" )
        done
    fi

    # Known hosts files from configs
    if [ ${#config[@]} -gt 0 ]; then
        local OIFS=$IFS IFS=$'\n'
        local -a tmpkh
        # expand paths (if present) to global and user known hosts files
        # TODO(?): try to make known hosts files with more than one consecutive
        #          spaces in their name work (watch out for ~ expansion
        #          breakage! Alioth#311595)
        tmpkh=( $( awk 'sub("^[ \t]*([Gg][Ll][Oo][Bb][Aa][Ll]|[Uu][Ss][Ee][Rr])[Kk][Nn][Oo][Ww][Nn][Hh][Oo][Ss][Tt][Ss][Ff][Ii][Ll][Ee][ \t]+", "") { print $0 }' "${config[@]}" | sort -u ) )
        for i in "${tmpkh[@]}"; do
            # Remove possible quotes
            i=${i//\"}
            # Eval/expand possible `~' or `~user'
            __expand_tilde_by_ref i
            [ -r "$i" ] && kh=( "${kh[@]}" "$i" )
        done
        IFS=$OIFS
    fi

    if [ -z "$configfile" ]; then
        # Global and user known_hosts files
        for i in /etc/ssh/ssh_known_hosts /etc/ssh/ssh_known_hosts2 \
            /etc/known_hosts /etc/known_hosts2 ~/.ssh/known_hosts \
            ~/.ssh/known_hosts2; do
            [ -r $i ] && kh=( "${kh[@]}" $i )
        done
        for i in /etc/ssh2/knownhosts ~/.ssh2/hostkeys; do
            [ -d $i ] && khd=( "${khd[@]}" $i/*pub )
        done
    fi

    # If we have known_hosts files to use
    if [[ ${#kh[@]} -gt 0 || ${#khd[@]} -gt 0 ]]; then
        # Escape slashes and dots in paths for awk
        awkcur=${cur//\//\\\/}
        awkcur=${awkcur//\./\\\.}
        curd=$awkcur

        if [[ "$awkcur" == [0-9]*[.:]* ]]; then
            # Digits followed by a dot or a colon - just search for that
            awkcur="^$awkcur[.:]*"
        elif [[ "$awkcur" == [0-9]* ]]; then
            # Digits followed by no dot or colon - search for digits followed
            # by a dot or a colon
            awkcur="^$awkcur.*[.:]"
        elif [ -z "$awkcur" ]; then
            # A blank - search for a dot, a colon, or an alpha character
            awkcur="[a-z.:]"
        else
            awkcur="^$awkcur"
        fi

        if [ ${#kh[@]} -gt 0 ]; then
            # FS needs to look for a comma separated list
            COMPREPLY=( "${COMPREPLY[@]}" $( awk 'BEGIN {FS=","}
            /^\s*[^|\#]/ {for (i=1; i<=2; ++i) { \
            sub(" .*$", "", $i); \
            sub("^\\[", "", $i); sub("\\](:[0-9]+)?$", "", $i); \
            if ($i ~ /'"$awkcur"'/) {print $i} \
            }}' "${kh[@]}" 2>/dev/null ) )
        fi
        if [ ${#khd[@]} -gt 0 ]; then
            # Needs to look for files called
            # .../.ssh2/key_22_<hostname>.pub
            # dont fork any processes, because in a cluster environment,
            # there can be hundreds of hostkeys
            for i in "${khd[@]}" ; do
                if [[ "$i" == *key_22_$curd*.pub && -r "$i" ]]; then
                    host=${i/#*key_22_/}
                    host=${host/%.pub/}
                    COMPREPLY=( "${COMPREPLY[@]}" $host )
                fi
            done
        fi

        # apply suffix and prefix
        for (( i=0; i < ${#COMPREPLY[@]}; i++ )); do
            COMPREPLY[i]=$prefix$user${COMPREPLY[i]}$suffix
        done
    fi

    # append any available aliases from config files
    if [[ ${#config[@]} -gt 0 && -n "$aliases" ]]; then
        local hosts=$( sed -ne 's/^[ \t]*[Hh][Oo][Ss][Tt]\([Nn][Aa][Mm][Ee]\)\{0,1\}['"$'\t '"']\{1,\}\([^#*?]*\)\(#.*\)\{0,1\}$/\2/p' "${config[@]}" )
        COMPREPLY=( "${COMPREPLY[@]}" $( compgen  -P "$prefix$user" \
            -S "$suffix" -W "$hosts" -- "$cur" ) )
    fi

    # Add hosts reported by avahi-browse, if desired and it's available.

    # This feature is disabled because it does not scale to
    #  larger networks. See:
    # https://bugs.launchpad.net/ubuntu/+source/bash-completion/+bug/510591

    #if [[ ${COMP_KNOWN_HOSTS_WITH_AVAHI:-} ]] && \
    #    type avahi-browse &>/dev/null; then
        # The original call to avahi-browse also had "-k", to avoid lookups
        # into avahi's services DB. We don't need the name of the service, and
        # if it contains ";", it may mistify the result. But on Gentoo (at
        # least), -k wasn't available (even if mentioned in the manpage) some
        # time ago, so...
    #    COMPREPLY=( "${COMPREPLY[@]}" $( \
    #        compgen -P "$prefix$user" -S "$suffix" -W \
    #        "$( avahi-browse -cpr _workstation._tcp 2>/dev/null | \
    #             awk -F';' '/^=/ { print $7 }' | sort -u )" -- "$cur" ) )
    #fi

    # Add results of normal hostname completion, unless
    # `COMP_KNOWN_HOSTS_WITH_HOSTFILE' is set to an empty value.
    if [ -n "${COMP_KNOWN_HOSTS_WITH_HOSTFILE-1}" ]; then
        COMPREPLY=( "${COMPREPLY[@]}"
            $( compgen -A hostname -P "$prefix$user" -S "$suffix" -- "$cur" ) )
    fi

    __ltrim_colon_completions "$prefix$user$cur"

    return 0
} # _known_hosts_real()
complete -F _known_hosts traceroute traceroute6 tracepath tracepath6 ping \
    ping6 fping fping6 telnet host nslookup rsh rlogin ftp dig mtr \
    ssh-installkeys showmount

# This meta-cd function observes the CDPATH variable, so that cd additionally
# completes on directories under those specified in CDPATH.
#
_cd()
{
    local cur IFS=$'\n' i j k
    _get_comp_words_by_ref cur

    # try to allow variable completion
    if [[ "$cur" == ?(\\)\$* ]]; then
        COMPREPLY=( $( compgen -v -P '$' -- "${cur#?(\\)$}" ) )
        return 0
    fi

    _compopt_o_filenames

    # Use standard dir completion if no CDPATH or parameter starts with /,
    # ./ or ../
    if [[ -z "${CDPATH:-}" || "$cur" == ?(.)?(.)/* ]]; then
        _filedir -d
        return 0
    fi

    local -r mark_dirs=$(_rl_enabled mark-directories && echo y)
    local -r mark_symdirs=$(_rl_enabled mark-symlinked-directories && echo y)

    # we have a CDPATH, so loop on its contents
    for i in ${CDPATH//:/$'\n'}; do
        # create an array of matched subdirs
        k="${#COMPREPLY[@]}"
        for j in $( compgen -d $i/$cur ); do
            if [[ ( $mark_symdirs && -h $j || $mark_dirs && ! -h $j ) && ! -d ${j#$i/} ]]; then
                j="${j}/"
            fi
            COMPREPLY[k++]=${j#$i/}
        done
    done

    _filedir -d

    if [[ ${#COMPREPLY[@]} -eq 1 ]]; then
        i=${COMPREPLY[0]}
        if [[ "$i" == "$cur" && $i != "*/" ]]; then
            COMPREPLY[0]="${i}/"
        fi
    fi

    return 0
}
if shopt -q cdable_vars; then
    complete -v -F _cd -o nospace cd
else
    complete -F _cd -o nospace cd
fi

# a wrapper method for the next one, when the offset is unknown
_command()
{
    local offset i

    # find actual offset, as position of the first non-option
    offset=1
    for (( i=1; i <= COMP_CWORD; i++ )); do
        if [[ "${COMP_WORDS[i]}" != -* ]]; then
            offset=$i
            break
        fi
    done
    _command_offset $offset
}

# A meta-command completion function for commands like sudo(8), which need to
# first complete on a command, then complete according to that command's own
# completion definition - currently not quite foolproof (e.g. mount and umount
# don't work properly), but still quite useful.
#
_command_offset()
{
    local cur func cline cspec noglob cmd i char_offset word_offset \
        _COMMAND_FUNC _COMMAND_FUNC_ARGS

    word_offset=$1

    # rewrite current completion context before invoking
    # actual command completion

    # find new first word position, then
    # rewrite COMP_LINE and adjust COMP_POINT
    local first_word=${COMP_WORDS[$word_offset]}
    for (( i=0; i <= ${#COMP_LINE}; i++ )); do
        if [[ "${COMP_LINE:$i:${#first_word}}" == "$first_word" ]]; then
            char_offset=$i
            break
        fi
    done
    COMP_LINE=${COMP_LINE:$char_offset}
    COMP_POINT=$(( COMP_POINT - $char_offset ))

    # shift COMP_WORDS elements and adjust COMP_CWORD
    for (( i=0; i <= COMP_CWORD - $word_offset; i++ )); do
        COMP_WORDS[i]=${COMP_WORDS[i+$word_offset]}
    done
    for (( i; i <= COMP_CWORD; i++ )); do
        unset COMP_WORDS[i];
    done
    COMP_CWORD=$(( $COMP_CWORD - $word_offset ))

    COMPREPLY=()
    _get_comp_words_by_ref cur

    if [[ $COMP_CWORD -eq 0 ]]; then
        _compopt_o_filenames
        COMPREPLY=( $( compgen -c -- "$cur" ) )
    else
        cmd=${COMP_WORDS[0]}
        if complete -p ${cmd##*/} &>/dev/null; then
            cspec=$( complete -p ${cmd##*/} )
            if [ "${cspec#* -F }" != "$cspec" ]; then
                # complete -F <function>

                # get function name
                func=${cspec#*-F }
                func=${func%% *}

                if [[ ${#COMP_WORDS[@]} -ge 2 ]]; then
                    $func $cmd "${COMP_WORDS[${#COMP_WORDS[@]}-1]}" "${COMP_WORDS[${#COMP_WORDS[@]}-2]}"
                else
                    $func $cmd "${COMP_WORDS[${#COMP_WORDS[@]}-1]}"
                fi

                # remove any \: generated by a command that doesn't
                # default to filenames or dirnames (e.g. sudo chown)
                # FIXME: I'm pretty sure this does not work!
                if [ "${cspec#*-o }" != "$cspec" ]; then
                    cspec=${cspec#*-o }
                    cspec=${cspec%% *}
                    if [[ "$cspec" != @(dir|file)names ]]; then
                        COMPREPLY=("${COMPREPLY[@]//\\\\:/:}")
                    else
                        _compopt_o_filenames
                    fi
                fi
            elif [ -n "$cspec" ]; then
                cspec=${cspec#complete};
                cspec=${cspec%%${cmd##*/}};
                COMPREPLY=( $( eval compgen "$cspec" -- "$cur" ) );
            fi
        elif [ ${#COMPREPLY[@]} -eq 0 ]; then
            _filedir
        fi
    fi
}
complete -F _command aoss command do else eval exec ltrace nice nohup padsp \
    then time tsocks vsound xargs

_root_command()
{
    local PATH=$PATH:/sbin:/usr/sbin:/usr/local/sbin
    local root_command=$1
    _command $1 $2 $3
}
complete -F _root_command fakeroot gksu gksudo kdesudo really sudo

# Return true if the completion should be treated as running as root
_complete_as_root()
{
    [[ $EUID -eq 0 || ${root_command:-} ]]
}

_longopt()
{
    local cur prev split=false
    _get_comp_words_by_ref -n = cur prev

    _split_longopt && split=true

    case "$prev" in
        --*[Dd][Ii][Rr]*)
            _filedir -d
            return 0
            ;;
        --*[Ff][Ii][Ll][Ee]*|--*[Pp][Aa][Tt][Hh]*)
            _filedir
            return 0
            ;;
    esac

    $split && return 0

    if [[ "$cur" == -* ]]; then
        COMPREPLY=( $( compgen -W "$( $1 --help 2>&1 | \
            sed -ne 's/.*\(--[-A-Za-z0-9]\{1,\}\).*/\1/p' | sort -u )" \
            -- "$cur" ) )
    elif [[ "$1" == @(mk|rm)dir ]]; then
        _filedir -d
    else
        _filedir
    fi
}

