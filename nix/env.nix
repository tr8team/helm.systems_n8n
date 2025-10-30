{ pkgs, packages }:
with packages;
{
  system = [
    coreutils
    gnugrep
    jq
    yq-go
    time

  ];

  main = [
    gomplate
    pls
    helm
    kubectl
    kube3d
  ];

  dev = [

  ];

  lint = [
    sg
    gitlint
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
