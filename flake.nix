{
  description = "pipeline-aws-plugin";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-21.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    { self
    , nixpkgs
    , flake-utils
    , ...
    }:
    flake-utils.lib.eachSystem [ "x86_64-linux" ]
      (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in
      with pkgs;
      rec {
        devShell = mkShell {
          buildInputs = [
            maven
            jdk8
          ];
        };
      }
      );
}
