inputs: let
  mkHomeConfig = username: {
    imports = [ ./packages ];
    home = {
      username = username;
      homeDirectory = "/Users/${username}";
      stateVersion = "24.05";
    };
  };

in
{
  mkHomeManagerModule = username: enabledApps: {
    imports = [ inputs.home-manager.darwinModules.home-manager ];
    nixpkgs.config.allowUnfree = true;
    home-manager.useGlobalPkgs = true;
    home-manager.extraSpecialArgs = { inherit enabledApps; };
    nixpkgs.overlays = [ inputs.vscode-extensions.overlays.default ];
    home-manager.users.${username} = mkHomeConfig username;
  };
}
