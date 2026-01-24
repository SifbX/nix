
let
  inherit (import ./helpers.nix) mkDarwin;
in
{
  macbookProMinimal = mkDarwin "mozsoy";
  packages = import ./packages.nix;
}