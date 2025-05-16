        ## JavaScript & TypeScript
        js|jsx|ts|tsx)
            local syntax="javascript"
            if [[ "${FILE_EXTENSION_LOWER}" == "ts" || "${FILE_EXTENSION_LOWER}" == "tsx" ]]; then
                syntax="typescript"
            fi

            env HIGHLIGHT_OPTIONS="${HIGHLIGHT_OPTIONS}" highlight --syntax=${syntax} --out-format="${highlight_format:-xterm256}" --force -- "${FILE_PATH}" && exit 5
             env COLORTERM=8bit bat --color=always --style="plain" -- "${FILE_PATH}" && exit 5
            if [[ "${FILE_EXTENSION_LOWER}" == "ts" || "${FILE_EXTENSION_LOWER}" == "tsx" ]]; then
                pygmentize -f "${pygmentize_format:-terminal}" -O "style=${PYGMENTIZE_STYLE:-autumn}" -l typescript -- "${FILE_PATH}" && exit 5
            else
                pygmentize -f "${pygmentize_format:-terminal}" -O "style=${PYGMENTIZE_STYLE:-autumn}" -l javascript -- "${FILE_PATH}" && exit 5
            fi
             ;;
