let
  mkDarwin = username: {
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    programs.zsh.enable = true;
    system.stateVersion = 5;
    nixpkgs.hostPlatform = "aarch64-darwin";
    users.users.${username} = {
      home = "/Users/${username}";
      name = username;
    };
  };

  mkModule = username: extraModules: {
    imports = [
      (mkDarwin username)
    ] ++ extraModules;
  };
in
{
  profiles = {
    full = mkModule "mozsoy" [ ./packages ];
    minimal = mkModule "mozsoy" [ ];
  };
}
