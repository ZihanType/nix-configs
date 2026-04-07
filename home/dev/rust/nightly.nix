{ pkgs, ... }:
{
  home.sessionVariables = {
    RUSTFLAGS = "-Z threads=8 -Z share-generics=y";
    # RUSTFLAGS = "-Z threads=8 -Z share-generics=y -Z next-solver=globally";
  };

  home.packages = [
    (pkgs.fenix.fromToolchainFile {
      file = ./nightly.toml;
      sha256 = "bolWw9A8sBZf3JDd7F/OMZgQelmuAuGO7ng2HSSEDIg=";
    })
  ];
}
