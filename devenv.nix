{ pkgs, ... }:

{
  # https://devenv.sh/basics/

  # https://devenv.sh/packages/
  packages = [
    pkgs.git
    pkgs.firebase-tools
    pkgs.nodejs_20
    pkgs.yarn
    pkgs.nil
    pkgs.nixpkgs-fmt
  ];

  # https://devenv.sh/languages/
  # languages.rust.enable = true;

  languages.javascript.enable = true;
  languages.javascript.package = pkgs.nodejs_20;
  languages.javascript.corepack.enable = true;
  languages.javascript.yarn.enable = true;
  languages.javascript.yarn.package = pkgs.yarn-berry;

  # https://devenv.sh/processes/
  # processes.cargo-watch.exec = "cargo-watch";

  # https://devenv.sh/services/
  # services.postgres.enable = true;

  # https://devenv.sh/scripts/

  # https://devenv.sh/tests/

  # https://devenv.sh/pre-commit-hooks/
  pre-commit.hooks.commit-msg = {
    enable = true;

    # The name of the hook (appears on the report table):
    name = "Commit Message";

    # The command to execute (mandatory):
    entry = "yarn commitlint --edit";

    # The language of the hook - tells pre-commit
    # how to install the hook (default: "system")
    # see also https://pre-commit.com/#supported-languages
    language = "node";

    stages = [ "commit-msg" ];

    # Set this to false to not pass the changed files
    # to the command (default: true):
    pass_filenames = false;
  };

  pre-commit.hooks.linting = {
    enable = true;

    # The name of the hook (appears on the report table):
    name = "Pre Commit";

    # The command to execute (mandatory):
    entry = "yarn lint-staged";

    # The language of the hook - tells pre-commit
    # how to install the hook (default: "system")
    # see also https://pre-commit.com/#supported-languages
    language = "node";

    # Set this to false to not pass the changed files
    # to the command (default: true):
    pass_filenames = true;
  };
  # See full reference at https://devenv.sh/reference/options/
}
