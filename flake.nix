{
  description = "initial nix setup";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{self, nix-darwin, nixpkgs}:
  let 
    configuration =  {pkgs, ...}: {
      nixpkgs.config.allowUnfree = true;
      environment.systemPackages = [ pkgs.neovim pkgs.vim pkgs.code-cursor ];
      nix.settings.experimental-features = ["nix-command" "flakes"];
      programs.zsh.enable = true;
      system.configurationRevision = self.rev or self.dirtyRev or null; 
      system.stateVersion = 5;
      nixpkgs.hostPlatform = "aarch64-darwin";
    };

  in 
  {
    darwinConfigurations."mbpro" = nix-darwin.lib.darwinSystem {
      modules = [ configuration ];
    };

    darwinPackages = self.darwinConfigurations."mbpro".pkgs; 
  };

}
