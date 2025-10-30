{ pkgs, atomi, atomi_classic, pkgs-sept-17-23 }:
let
  all = rec {
    atomipkgs_classic = (
      with atomi_classic;
      {
        inherit sg;
      }
    );
    atomipkgs = (
      with atomi;
      {
        inherit pls;
      }
    );
    sept-17-23 = (
      with pkgs-sept-17-23;
      {
        inherit
          time
          pre-commit
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
        helm = kubernetes-helm;
      }
    );
  };
in
with all;
atomipkgs //
atomipkgs_classic //
sept-17-23
