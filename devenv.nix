{ pkgs, lib, config, inputs, ... }:

{
  # https://devenv.sh/basics/

  # https://devenv.sh/packages/
  packages = [ 
    pkgs.git 
    pkgs.firebase-tools
    pkgs.nodejs_20
    pkgs.yarn-berry
    pkgs.oh-my-zsh
  ];

  # https://devenv.sh/languages/
  # languages.rust.enable = true;

  languages.javascript.enable = true;
  languages.javascript.package = pkgs.nodejs_20;
  languages.javascript.corepack.enable = true;
  languages.javascript.yarn.enable = true;
  languages.javascript.yarn.install.enable = true;
  languages.javascript.yarn.package = pkgs.yarn-berry;

  # https://devenv.sh/processes/
  # processes.cargo-watch.exec = "cargo-watch";

  # https://devenv.sh/services/
  # services.postgres.enable = true;

  # https://devenv.sh/scripts/

  enterShell = ''
    echo hello
  '';

  # https://devenv.sh/tests/
  enterTest = ''
    git --version | grep --color=auto 2.44.0
    firebase --version | grep --color=auto 13.6.1
  '';

  # https://devenv.sh/pre-commit-hooks/
  # pre-commit.hooks.shellcheck.enable = true;

  # See full reference at https://devenv.sh/reference/options/
}
