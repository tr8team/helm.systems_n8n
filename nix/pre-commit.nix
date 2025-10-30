{ formatter, pre-commit-lib, packages }:
pre-commit-lib.run {
  src = ./.;

  # hooks
  hooks = {
    # formatter
    treefmt = {
      enable = true;
      excludes = [ ".*vendor.*" ".*chart/.*" "Changelog.md" "CommitConventions.md" ".*schema.json" ];
    };
    # linters From https://github.com/cachix/pre-commit-hooks.nix
    shellcheck = {
      enable = true;
    };

    a-helm-lint-chart = {
      enable = true;
      name = "Helm Lint Chart";
      description = "Lints helm n8n charts";
      entry = "${packages.time}/bin/time ${packages.helm}/bin/helm lint chart";
      files = "chart/.*";
      language = "system";
      pass_filenames = false;
    };

    a-gitlint = {
      enable = true;
      name = "Gitlint";
      description = "Lints git commit message";
      entry = "${packages.gitlint}/bin/gitlint --staged --msg-filename .git/COMMIT_EDITMSG";
      language = "system";
      pass_filenames = false;
      stages = [ "commit-msg" ];
    };

    a-enforce-gitlint = {
      enable = true;
      name = "Enforce gitlint";
      description = "Enforce atomi_releaser conforms to gitlint";
      entry = "${packages.time}/bin/time ${packages.sg}/bin/sg gitlint";
      files = "(atomi_release\\.yaml|\\.gitlint)";
      language = "system";
      pass_filenames = false;
    };

    a-shellcheck = {
      enable = true;
      name = "Shell Check";
      entry = "${packages.time}/bin/time ${packages.shellcheck}/bin/shellcheck";
      files = ".*\\.sh$";
      language = "system";
      pass_filenames = true;
    };

    a-enforce-exec = {
      enable = true;
      name = "Enforce Shell Script executable";
      entry = "${packages.time}/bin/time ${packages.coreutils}/bin/chmod +x";
      files = ".*sh$";
      language = "system";
      pass_filenames = true;
    };

    a-helm-docs = {
      enable = true;
      name = "Helm Docs";
      entry = "${packages.time}/bin/time ${packages.helm-docs}/bin/helm-docs";
      files = ".*";
      language = "system";
      pass_filenames = false;
    };
  };

  settings = {
    treefmt = {
      package = formatter;
    };
  };
}
