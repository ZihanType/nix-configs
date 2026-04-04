{ pkgs, ... }:
{
  home.sessionVariables = {
    RUSTFLAGS = "-Z threads=8 -Z share-generics=y";
    # RUSTFLAGS = "-Z threads=8 -Z share-generics=y -Z next-solver=globally";
  };

  home.packages = [
    (pkgs.fenix.fromToolchainFile {
      file = ./nightly.toml;
      sha256 = "O210KMQ4E5Iu932m7Cyg914uDeIn4v691xQzariNeQg=";
    })
  ];
}
