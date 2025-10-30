{ nixpkgs ? import <nixpkgs> { } }:
let
  pkgs = rec {
    atomi_classic = (
      with import (fetchTarball "https://github.com/kirinnee/test-nix-repo/archive/refs/tags/v8.1.0.tar.gz");
      {
        inherit sg;
      }
    );
    atomi = (
      with import (fetchTarball "https://github.com/kirinnee/test-nix-repo/archive/refs/tags/v17.0.0.tar.gz");
      {
        inherit pls idea-u precommit-patch-nix;
      }
    );
    "22.11 28th Jan 2023" = (
      with import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/cc4bb87f5457ba06af9ae57ee4328a49ce674b1b.tar.gz") { };
      {
        inherit
          pre-commit;
      }
    );
    "Unstable 27th Jan 2023" = (
      with import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/e62676e855cc300d6a2a76f72c28eaa532aff277.tar.gz") { };
      {
        inherit
          coreutils
          gnugrep

          jq
          yq-go
          kubernetes-helm
          kubectl
          gitlint
          nixpkgs-fmt
          shfmt
          kube3d
          helm-docs
          nodejs
          gomplate
          shellcheck;

        npm = nodePackages.npm;
        prettier = nodePackages.prettier;
      }
    );
  };
in
with pkgs;
atomi_classic //
atomi //
pkgs."22.11 28th Jan 2023" //
pkgs."Unstable 27th Jan 2023"
