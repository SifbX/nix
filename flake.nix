{
  description = "initial nix setup";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nix-darwin, nixpkgs, home-manager, ... }:
  let
    mkDarwin = import ./configurations/darwin;
  in
  {
    darwinConfigurations."mbpro" = nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [
        (mkDarwin "mozsoy")
        home-manager.darwinModules.home-manager
        {
          nixpkgs.config.allowUnfree = true;
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.mozsoy = { pkgs, ... }: {
            home.username = "mozsoy";
            home.stateVersion = "24.05";
            home.homeDirectory = "/Users/mozsoy";
            home.packages = [ pkgs.code-cursor];
          };
        }
      ];
    };

    darwinPackages = self.darwinConfigurations."mbpro".pkgs; 
  };

}
