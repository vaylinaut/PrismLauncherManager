{
  description = "Flake example for prismlauncher";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ninjabrain-bot = {
      url = "https://tangled.org/althaea.zone/ninjabrain-bot-nix/archive/trunk";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    
    # Expose the module so it can be cleanly referenced elsewhere if needed
    nixosModules.prismLauncher = ./prism-launcher-module.nix;

    nixosConfigurations.your-hostname = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; }; 
      
      modules = [
        ./configuration.nix            
        self.nixosModules.prismLauncher # Make sure to add this.
        ./minecraft.nix              

        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = { inherit inputs; };
        }
      ];
    };
  };
}
