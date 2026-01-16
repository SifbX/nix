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
      environment.systemPackages = [pkgs.neovim];
      services.nix-daemon.enable = true;
      nix.settings.experimental-features = "nix-command flakes";
      program.zsh.enable = true;
      systemconfigurationRevision = self.rev or self.dirtyRev or null; 
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
