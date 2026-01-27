inputs: let
  mkHomeConfig = username: programs: {
    imports = programs;
    home = {
      username = username;
      homeDirectory = "/Users/${username}";
      stateVersion = "24.05";
    };
  };

  mkModule = username: programs: {
    imports = [inputs.home-manager.darwinModules.home-manager];
    nixpkgs.config.allowUnfree = true;
    nixpkgs.hostPlatform = "aarch64-darwin";
    home-manager.useGlobalPkgs = true;
    nixpkgs.overlays = [ inputs.vscode-extensions.overlays.default ];
    
    home-manager.users.${username} =
      mkHomeConfig username programs;
  };

in
{
  profiles = {
    full = mkModule "mozsoy" [ ./packages ];
    standard = mkModule "mozsoy" [ ./packages/vscode ./packages/spotify ];
    minimal = mkModule "mozsoy" [ ];
  };
}
