{
<<<<<<< HEAD
  description = "WSL Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
  };

  outputs = { self, nixpkgs, nixos-wsl, ... }: {
    nixosConfigurations = {
      system = "x86_64-linux";
      modules = [
        nixos-wsl.nixosModules.default {
          system.stateVersion = "23.11";
          wsl.enable = true;
        };
      ];
=======
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations = {
      
      wsl = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/wsl/configuration.nix
        ];
      };

      desktop = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/desktop/configuration.nix
        ];
      };
      
      homeManagerModules.default = ./homeManagerModules;

>>>>>>> 07e56f8 (Flakes)
    };
  };
}
