{ pkgs, ... }:
{
  home.packages = [
    (pkgs.fenix.fromToolchainFile {
      file = ./stable.toml;
      sha256 = "zC8E38iDVJ1oPIzCqTk/Ujo9+9kx9dXq7wAwPMpkpg0=";
    })
  ];
}
