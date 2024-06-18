_tgrep() {
    local i cur prev opts cmd
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    cmd=""
    opts=""

    for i in ${COMP_WORDS[@]}
    do
        case "${cmd},${i}" in
            ",$1")
                cmd="tgrep"
                ;;
            *)
                ;;
        esac
    done

    case "${cmd}" in
        tgrep)
            opts="-e -t -c -. -n -m -f -s -l -h -V --regexp --target --count --hidden --line-number --menu --files --links --trim --pcre2 --no-ignore --no-color --max-depth --threads --prefix-len --max-length --searcher --box-chars --tree --glob --help --version [positional regexp] [positional target]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 1 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --regexp)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -e)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --target)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -t)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --max-depth)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --threads)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --prefix-len)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --max-length)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --searcher)
                    COMPREPLY=($(compgen -W "rg tgrep" -- "${cur}"))
                    return 0
                    ;;
                -s)
                    COMPREPLY=($(compgen -W "rg tgrep" -- "${cur}"))
                    return 0
                    ;;
                --box-chars)
                    COMPREPLY=($(compgen -W "single double heavy rounded none" -- "${cur}"))
                    return 0
                    ;;
                --glob)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
    esac
}

if [[ "${BASH_VERSINFO[0]}" -eq 4 && "${BASH_VERSINFO[1]}" -ge 4 || "${BASH_VERSINFO[0]}" -gt 4 ]]; then
    complete -F _tgrep -o nosort -o bashdefault -o default tgrep
else
    complete -F _tgrep -o bashdefault -o default tgrep
fi
