inputs: let
  username = "mozsoy";

  darwinModules = import ../../modules/darwin inputs;
  homeManagerModules = import ../../modules/home_manager inputs;
  aliasScript = import ./scripts/alias_script.nix username;
  profiles = import ./profiles.nix;

  mkDarwinConfig = username: profile:
    let
      enabledApps = profiles.${profile};
    in
    inputs.nix-darwin.lib.darwinSystem {
      specialArgs = { inherit enabledApps; };
      modules = [
        (darwinModules.mkDarwin username)
        aliasScript
        (homeManagerModules.mkHomeManagerModule username enabledApps)
      ];
    };

  in {
    MacbookProFull = mkDarwinConfig username "full";
    MacbookProStandard = mkDarwinConfig username "standard";
    MacbookProMinimal = mkDarwinConfig username "minimal";
  }
