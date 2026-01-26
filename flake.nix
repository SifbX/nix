{
  description = "initial nix setup";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    vscode-extensions.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nix-darwin, nixpkgs, home-manager, ... }:
    let
      darwinModules = import ./configurations/darwin/default.nix;
      homeManagerModules = import ./configurations/home_manager;
    in
    {
    darwinConfigurations = {
      MacbookProFull = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          darwinModules.profiles.full
          home-manager.darwinModules.home-manager
          homeManagerModules.profiles.full
        ];
      };
      MacbookProMinimal = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          darwinModules.profiles.minimal
          home-manager.darwinModules.home-manager
          homeManagerModules.profiles.minimal
        ];
      };
    };
    };
}
