{
  pkgs,
  config,
  ...
}:
let
  cargoHome = "${config.xdg.dataHome}/cargo";
  targetDir = "/Volumes/ramdisk/target";
  trunkDir = "/Volumes/ramdisk/dist";
in
{
  imports = [
    ./rust/nightly.nix
    # ./rust/stable.nix
  ];

  home.sessionVariables = {
    # cargo
    CARGO_REGISTRY_TOKEN = "";
    CARGO_TARGET_DIR = targetDir;

    # trunk
    TRUNK_BUILD_DIST = trunkDir;
    TRUNK_CLEAN_DIST = trunkDir;
  };

  programs.cargo = {
    enable = true;
    package = null;
    cargoHome = cargoHome;
    settings = fromTOML (builtins.readFile ./rust/config.toml);
  };

  home.sessionPath = [ "${cargoHome}/bin" ];

  home.packages = with pkgs; [
    binaryen
    trunk
    rust-bindgen
    wasm-bindgen-cli

    cargo-deny
    cargo-expand
    cargo-generate
    cargo-llvm-cov
    cargo-nextest
    cargo-update
    cargo-tarpaulin
    cargo-tauri
    cargo-chef
  ];
}
