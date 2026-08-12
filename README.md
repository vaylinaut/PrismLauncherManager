# PrismLauncherManager

Nothing much to say here.\
It manages your prism launcher.\
Check out your ~/.local/share/PrismLauncher/prismlauncher.cfg to see what options you can modify.\
Let me know if you have any questions. I'm on Discord @vaylinaut.\
If something breaks, then let me know. I will do my best to fix it.

Check out config.nix to see how you can configure it.

```nix

{
  description = "Nixos config flake or something like that";

  inputs = {
    prism-manager = {
      url = "github:vaylinaut/PrismLauncherManager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  }

```
