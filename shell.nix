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

    cargoHash = "sha256-3hgfAyMydSHnHqPLUQDR/5OWS4GUGeYsJNCX1TDN/wA=";
  };
in
  pkgs.mkShellNoCC {
    packages = with pkgs; [
      wget
      tombl
      packwiz
      just
      envsubst
      ripgrep
      zip
    ];
  }
