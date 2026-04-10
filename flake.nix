{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs?ref=nixpkgs-unstable";
    };

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-homebrew = {
      url = "github:zhaofengli/nix-homebrew";
    };

    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };

    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };

    zihantype = {
      url = "github:ZihanType/homebrew-tap";
      flake = false;
    };

    jurplel = {
      url = "github:jurplel/homebrew-tap";
      flake = false;
    };

    # 仓库大，不止有最新的插件
    # nix4vscode = {
    #   url = "github:nix-community/nix4vscode";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    # 仓库小，只有最新的插件
    # nix-vscode-extensions = {
    #   url = "github:nix-community/nix-vscode-extensions";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    flake-utils = {
      url = "github:numtide/flake-utils";
    };

    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs =
    {
      self,
      nixpkgs,
      nix-darwin,
      home-manager,
      nix-homebrew,
      homebrew-core,
      homebrew-cask,
      zihantype,
      jurplel,
      # nix4vscode,
      fenix,
      ...
    }:
    let
      vars = {
        username = "arthur";
        hostname = "Avalon";
        system = "aarch64-darwin";
      };
      pkgs = import nixpkgs {
        system = vars.system;
        config = {
          allowUnfree = true;
        };
        overlays = [
          # nix4vscode.overlays.default
          fenix.overlays.default
          (final: prev: {
            larkCli = prev.callPackage ./pkgs/lark-cli.nix { };
          })
        ];
      };
    in
    {
      darwinConfigurations = {
        ${vars.hostname} = nix-darwin.lib.darwinSystem {
          pkgs = pkgs;
          system = vars.system;
          specialArgs = {
            inherit self vars;
          };
          modules = [
            ./global/configuration.nix

            nix-homebrew.darwinModules.nix-homebrew

            {
              nix-homebrew = {
                enable = true;

                enableRosetta = false;

                user = vars.username;

                taps = {
                  "homebrew/homebrew-core" = homebrew-core;
                  "homebrew/homebrew-cask" = homebrew-cask;
                  "zihan-type/homebrew-tap" = zihantype;
                  "jurplel/homebrew-tap" = jurplel;
                };

                mutableTaps = false;

                autoMigrate = true;
              };
            }

            home-manager.darwinModules.home-manager

            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = { inherit vars; };
                users = {
                  ${vars.username} = ./home/home.nix;
                };
              };
            }

          ];
        };
      };
    };
}
