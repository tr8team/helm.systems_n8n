{ nixpkgs ? import <nixpkgs> { } }:
let pkgs = import ./packages.nix { inherit nixpkgs; }; in
with pkgs;
{
  system = [
    coreutils
    gnugrep
    jq
    yq-go

  ];

  main = [
    gomplate
    pls
    kubernetes-helm
    kubectl
    kube3d
  ];

  dev = [

    idea-u
  ];

  lint = [
    sg
    gitlint
    precommit-patch-nix
    pre-commit
    nixpkgs-fmt
    prettier
    shfmt
    shellcheck
    helm-docs
  ];

  release = [
    helm-docs
    nodejs
    npm
    sg
  ];

}
