{pkgs ? import <nixpkgs> {}}: let
  tombl = pkgs.rustPlatform.buildRustPackage rec {
    pname = "tombl";
    version = "0.2.3";

    src = pkgs.fetchFromGitHub {
      owner = "snyball";
      repo = pname;
      rev = "v${version}";
      hash = "sha256-XHvAgJ8/+ZkBxwZpMgaDchr0hBa1FXAd/j1+HH9N6qw=";
    };

    cargoHash = "sha256-w6LiKSH0koxtWxieyob9e+u5kRdbJOda2mtD4FQBxq0=";
  };
in
  pkgs.mkShell {
    packages = with pkgs; [
      wget
      tombl
      packwiz
      just
      envsubst
    ];
  }
