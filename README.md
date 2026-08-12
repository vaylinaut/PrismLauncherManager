# PrismLauncherManager

Nothing much to say here.\
It manages your prism launcher.\
Check out your ~/.local/share/PrismLauncher/prismlauncher.cfg to see what options you can modify.\
Let me know if you have any questions. I'm on Discord @vaylinaut.\
If something breaks, then let me know. I will do my best to fix it.

Check out config.nix to see how you can configure it.

```nix

{
  description = "A universal, declarative Prism Launcher module suite for NixOS and Home Manager";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Required so your module can be used directly from GitHub
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }: {
    # Export your Home Manager module
    homeManagerModules.prismLauncher = ./home-manager.nix;

    # Optional convenience alias
    homeManagerModule = self.homeManagerModules.prismLauncher;

    # Provide a test configuration (optional but useful)
    # Users can run: nix run github:you/prism-launcher#homeConfigurations.example
    homeConfigurations.example = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;

      modules = [
        ./home-manager.nix
        {
          programs.MCSR-Prismlauncher.enable = true;
        }
      ];
    };
  };
}

```
