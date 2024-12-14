default: build

# Set the envs of some mods correctly, overwriting them
fix-envs:
    #!/usr/bin/env bash
    set -euxo pipefail

    # sed -i 's/^side = "client"/side = "both"/' mods/jei.pw.toml
    
    packwiz refresh

# Build the prism pack
prism:
    #!/usr/bin/env bash
    set -euxo pipefail
   
    mkdir -p build

    cd include/Prism
    cp ../unsup.ini .minecraft
    
    zip -r Prism.zip * .minecraft
    
    mv Prism.zip ../../build/Pseudoscience.SMP.Modpack.Iteration.II.Prism.zip
    rm .minecraft/unsup.ini

# Build the cf pack
curseforge:
    #!/usr/bin/env bash
    set -euxo pipefail

    mkdir -p build

    cp pack.toml include/Curseforge
    
    cd include/Curseforge
    touch index.toml

    wget https://git.sleeping.town/unascribed/unsup/releases/download/v0.2.3/unsup-0.2.3.jar -O unsup.jar
    cp ../unsup.ini .

    packwiz refresh
    packwiz cf export -y -o ../../build/Pseudoscience.SMP.Modpack.Iteration.II.Curseforge.zip

# Build a profile for the vanilla launcher
launcher:
    #!/usr/bin/env zsh
    set -euxo pipefail

    eval "$(tombl -e VERSIONS=versions pack.toml)"

    export ITERATION=$(git rev-parse --abbrev-ref HEAD | cut -c 2-)
    export MC_VERSION=${VERSIONS[minecraft]}
    export FABRIC_VERSION=${VERSIONS[fabric]}

    cat include/Launcher/profile.json.template | envsubst | tee include/Launcher/profile.json


# Build all packs
build: fix-envs prism curseforge launcher
