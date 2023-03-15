#!/bin/bash
mkdir -p myst
cd ipynb
for f in $(find . -name '*.ipynb' -not -path '*/.*')
do
    echo "processing f=\"${f}\":"
    declare -a cmds=(
        'jupytext --from ipynb --to md:myst -o "../myst/${f/%.ipynb/.md}" "${f}"'
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