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

    eval "$(tombl -e VERSIONS=versions pack.toml)"

    export ITERATION='{{iteration}}'
    export MC_VERSION=${VERSIONS[minecraft]}
    export FABRIC_VERSION=${VERSIONS[fabric]}

    cd include/Prism

    for file in *.template; do
      envsubst -i "$file" -o "${file%.template}"
    done

    cp ../unsup.ini .minecraft

    zip -r Prism.zip * .minecraft -x '*.template'

    mv Prism.zip "../../build/Pseudoscience.Iteration.$ITERATION.Prism.zip"
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
    #!/usr/bin/env bash
    set -euxo pipefail

    eval "$(tombl -e VERSIONS=versions pack.toml)"

    export ITERATION='{{iteration}}'
    export MC_VERSION=${VERSIONS[minecraft]}
    export FABRIC_VERSION=${VERSIONS[fabric]}

    envsubst -i include/Launcher/profile.json.template \
      -o build/profile.json

# Clean old builds
clean:
  rm -rf build
  mkdir -p build

# Build all packs
build: clean fix-envs prism curseforge launcher
