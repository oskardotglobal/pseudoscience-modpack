default: build

iteration := "II"

# Force env for server mods to be both
fix-envs:
  rg -l 'side = "server"' \
    | xargs -i sed -i 's/^side = "server"/side = "both"/' "{}"

# Build the prism pack
prism:
    #!/usr/bin/env bash
    set -euxo pipefail

    cd include/Prism
    cp ../unsup.ini .minecraft

    zip -r Prism.zip * .minecraft

    mv Prism.zip ../../build/Pseudoscience.Iteration.{{iteration}}.Prism.zip
    rm .minecraft/unsup.ini

# Build the cf pack
curseforge:
    #!/usr/bin/env bash
    set -euxo pipefail

    cp pack.toml include/Curseforge

    cd include/Curseforge
    touch index.toml

    wget https://git.sleeping.town/unascribed/unsup/releases/download/v0.2.3/unsup-0.2.3.jar -O unsup.jar
    cp ../unsup.ini .

    packwiz refresh
    packwiz cf export -y -o ../../build/Pseudoscience.Iteration.{{iteration}}.Curseforge.zip

# Build a profile for the vanilla launcher
launcher:
    #!/usr/bin/env zsh
    set -euxo pipefail

    eval "$(tombl -e VERSIONS=versions pack.toml)"

    export ITERATION='{{iteration}}'
    export MC_VERSION=${VERSIONS[minecraft]}
    export FABRIC_VERSION=${VERSIONS[fabric]}

    cat include/Launcher/profile.json.template \
      | envsubst \
      | tee build/profile.json

# Clean old builds
clean:
  rm -rf build
  mkdir -p build

# Build all packs
build: clean fix-envs prism curseforge launcher
