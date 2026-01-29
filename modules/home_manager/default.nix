inputs: let
  username = "mozsoy";

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
    home-manager.useGlobalPkgs = true;
    nixpkgs.overlays = [ inputs.vscode-extensions.overlays.default ];
    home-manager.users.${username} =
      mkHomeConfig username programs;
  };

in
{
  profiles = {
    full = mkModule username [ ./packages ];
    standard = mkModule username [ ./packages/vscode ./packages/spotify ./packages/uv];
    minimal = mkModule username [ ./packages/zsh ];
  };
}
