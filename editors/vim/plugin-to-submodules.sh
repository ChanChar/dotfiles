#!/usr/bin/env bash

# chmod +x plugin-to-submodules.sh
# ./plugin-to-submodules.sh

for plugin in $(find ~/.vim/plugged/ -maxdepth 1 -mindepth 1 -type d)
do
    pushd "$plugin"
    export url=$(git config --get remote.origin.url)
    popd
    git submodule add "$url" ./plugged/$(basename $plugin)
done
