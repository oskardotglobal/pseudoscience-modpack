#!/bin/bash

if ! command -v rg &> /dev/null
then
    echo "ripgrep could not be found"
    echo "see https://github.com/BurntSushi/ripgrep#installation"
    exit
fi

if ! command -v sde &> /dev/null
then
    echo "sde could not be found"
    echo "see https://github.com/dvershinin/sde"
    exit
fi

cd origins-plus-plus

rg -l "origins:modify_player_spawn" | sed "s/.*\/powers\/\(.*\)\/.*/\1/g" | sed s/-/_/ | xargs -I {} sde unchoosable true data/origins-plus-plus/origins/{}.json