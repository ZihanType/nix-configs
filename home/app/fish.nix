{
  pkgs,
  ...
}:
{
  programs.fish = {
    enable = true;
    package = pkgs.fishMinimal;
    shellInit = ''
      # Disable shell history
      # set -gx fish_private_mode 1

      # Disable dir truncation
      set -gx fish_prompt_pwd_dir_length 0
    '';

    functions = {
      # Disable greeting
      fish_greeting = {
        body = "# empty";
      };

      # nh = {
      #   body = "$argv[1] &>/dev/null & disown";
      # };

      rust_install = {
        body = ''
          curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --no-modify-path --default-toolchain nightly
          # curl --proto '=https' --tlsv1.2 -sSf https://rsproxy.cn/rustup-init.sh | sh -s -- --no-modify-path --default-toolchain nightly

          echo "Remember to modify the `~/.cargo/config.toml` file"
        '';
      };

      rust_setup = {
        body = ''
          # 保存并删除 RUSTFLAGS
          set -l old_rustflags $RUSTFLAGS
          set -e RUSTFLAGS

          rustup component add llvm-tools
          rustup target add wasm32-unknown-unknown
          cargo +stable install volo-cli
          cargo +stable install sea-orm-cli@^2.0.0-rc
          cargo +stable install loco-cli
          cargo +stable install cargo-tessera

          # 恢复 RUSTFLAGS
          if test -n "$old_rustflags"
              set -gx RUSTFLAGS $old_rustflags
          end
        '';
      };

      rust_clean = {
        body = ''
          rm -rf $SCCACHE_DIR
          rm -rf $CARGO_TARGET_DIR
          rm -rf $TRUNK_BUILD_DIST
        '';
      };

      coverage_rs = {
        body = ''
          bash /Users/arthur/Avalon/rust_code_coverage.sh
        '';
      };

      brew_list = {
        body = ''
          echo "==> Formulae"; brew list -1 --installed-on-request; echo -e "\n==> Casks"; brew list -1 --cask
        '';
      };

    };
  };
}
