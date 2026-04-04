{ lib, ... }:
{
  home.file.".zshenv".enable = false;

  programs.zsh = {
    enable = true;

    initContent =
      let
        initExtraFirst = lib.mkOrder 500 "";

        initExtraBeforeCompInit = lib.mkOrder 550 "";

        initExtra = lib.mkOrder 1000 ''
          # Disable shell history
          # SAVEHIST=0
        '';

        initExtraLast = lib.mkOrder 1500 "";
      in
      lib.mkMerge [
        initExtraFirst
        initExtraBeforeCompInit
        initExtra
        initExtraLast
      ];

    siteFunctions = {
      # nh = "$1 &>/dev/null & disown";

      rust_install = ''
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --no-modify-path --default-toolchain nightly
        # curl --proto '=https' --tlsv1.2 -sSf https://rsproxy.cn/rustup-init.sh | sh -s -- --no-modify-path --default-toolchain nightly

        echo "Remember to modify the `~/.cargo/config.toml` file"
      '';

      rust_setup = ''
        # 保存并删除 RUSTFLAGS
        old_rustflags=$RUSTFLAGS
        unset RUSTFLAGS

        rustup component add llvm-tools
        rustup target add wasm32-unknown-unknown
        cargo +stable install volo-cli
        cargo +stable install sea-orm-cli@^2.0.0-rc
        cargo +stable install loco-cli
        cargo +stable install cargo-tessera

        # 恢复 RUSTFLAGS
        if [ -n "$old_rustflags" ]; then
            export RUSTFLAGS=$old_rustflags
        fi
      '';

      rust_clean = ''
        rm -rf $SCCACHE_DIR
        rm -rf $CARGO_TARGET_DIR
        rm -rf $TRUNK_BUILD_DIST
      '';

      coverage_rs = ''
        bash /Users/arthur/Avalon/rust_code_coverage.sh
      '';

      brew_list = ''
        echo "==> Formulae"; brew list -1 --installed-on-request; echo -e "\n==> Casks"; brew list -1 --cask
      '';
    };
  };
}
