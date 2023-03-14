#!/bin/bash
mkdir -p ipynb
cd myst
for f in $(find . -name '*.md')
do
    echo "processing f=\"${f}\":"
    declare -a cmds=(
        'jupytext --from md:myst --to ipynb -o "../myst/${f/%.md/.ipynb}" "${f}"'
    )
    for c in "${cmds[@]}"
    do
        echo "|-${c}"
        read -r -p "|| execute?[Y/n] " input
        case $input in
            [yY][eE][sS]|[yY]|'')
            echo "|| Executing..."
            eval ${c}
            ;;
            [nN][oO]|[nN])
            echo "|| Skipped..."
            ;;
            *)
            echo "|| Invalid input..."
            exit 1
           ;;
        esac
    done
done
