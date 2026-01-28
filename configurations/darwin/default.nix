inputs: let
  username = "mozsoy";

  darwinModules = import ../../modules/darwin inputs;
  homeManagerModules = import ../../modules/home_manager inputs;
  aliasScript = import ./scripts/alias_script.nix username;


  mkDarwinConfig = username: profile:
    inputs.nix-darwin.lib.darwinSystem {
      modules = [
        (darwinModules.mkDarwin username)
        aliasScript
        homeManagerModules.profiles.${profile}
      ];
    };

  in {
    MacbookProFull = mkDarwinConfig username "full";  # useful for testing all packages together
    MacbookProStandard = mkDarwinConfig username "standard"; # default
    MacbookProMinimal = mkDarwinConfig username "minimal"; # useful for debugging 
  }

