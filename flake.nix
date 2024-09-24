{
  description = "Sholtor's Flakes";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixos-wsl, home-manager, ... }@inputs: 
    let
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

    in
    {
      nixosConfigurations = {

        wsl = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit system inputs pkgs;};
          modules = [
            ./hosts/wsl/configuration.nix
          ];
        };

        desktop = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit system inputs pkgs;};
          modules = [
            ./hosts/desktop/configuration.nix
          ];
        };

      };
    };
  }

