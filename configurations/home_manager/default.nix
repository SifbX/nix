let
  mkHomeConfig = username: programs: {
    imports = programs;
    home = {
      username = username;
      homeDirectory = "/Users/${username}";
      stateVersion = "24.05";
    };
  };

  mkModule = username: programs: {
    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;
    home-manager.users.${username} =
      mkHomeConfig username programs;
  };

in
{
  profiles = {
    full = mkModule "mozsoy" [ ./packages ];
    minimal = mkModule "mozsoy" [ ];
  };
}
