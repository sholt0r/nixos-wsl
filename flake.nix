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

  outputs = {
    self,
    nixpkgs,
    nixos-wsl,
    home-manager,
    ...
  }@inputs: let
      inherit (self) outputs;

      systems = [
        "x86_64-linux"
      ];

      forAllSystems = nixpkgs.lib.genAttrs systems;

    in
    {
      packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});
      formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.nixpkgs-fmt);
      overlays = import ./overlays {inherit inputs;};
      nixosModules = import ./modules/nixos;
      homeManagerModules = import ./modules/home-manager;

      nixosConfigurations = {

        wsl-badmobo = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs outputs;};
          modules = [
	    nixos-wsl.nixosModules.wsl
	    home-manager.nixosModules.home-manager
            ./hosts/wsl-badmobo/configuration.nix
          ];
        };

        desktop = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs outputs;};
          modules = [
            ./hosts/desktop/configuration.nix
          ];
        };

      };

      homeConfigurations = {
        "jstaples@nix-wsl-badmobo" = home-manager.lib.homeManagerConfiguration {
	  pkgs = nixpkgs.legacyPackages.x86_64-linux;
	  extraSpecialArgs = {inherit inputs outputs;};
	  modules = [
	    ./home-manager/jstaples.nix
	  ];
	};
      };
    };
  }

