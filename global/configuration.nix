{
  pkgs,
  self,
  vars,
  ...
}:
{
  imports = [
    ./nix.nix
    ./homebrew.nix
    ./macos-settings.nix

    # app
    ./app/fish.nix
    ./app/zsh.nix

    # dev
    ./dev/direnv.nix
    ./dev/dev-env-vars.nix
    # ./dev/xcode.nix

    # launchd
    ./launchd/fix-brave-policy.nix
    ./launchd/create-ramdisk.nix
  ];

  documentation.enable = false;

  environment = {
    # List packages installed in system profile. To search by name, run:
    # $ nix-env -qaP | grep wget
    systemPackages = with pkgs; [
      # nix official cli
      nixd
      nixfmt

      # nix community cli
      nix-tree
      nix-diff
      nix-inspect
      nvd

      # cli
      bat
      inetutils
      lsd
      samply
      somo
      taplo
      tokei
      dioxus-cli
      grcov
      leptosfmt
      xdg-ninja
      dos2unix
      curl
      wget
      fd
      gh
      jq
      fresh-editor
      gdu
      actionlint
      feishu-cli

      # AI
      github-copilot-cli
      (openspec.override {
        nodejs_20 = nodejs_25;
      })
      skills
    ];

    shells = with pkgs; [
      fishMinimal
      zsh
      nushell
    ];

    variables = {
      EDITOR = "fresh";
    };
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    lxgw-wenkai
    sarasa-gothic
  ];

  users = {
    users = {
      ${vars.username} = {
        name = vars.username;
        home = "/Users/${vars.username}";
        shell = pkgs.fishMinimal;
        # MacOS 用户 ID 从 501 开始分配，使用以下命令查询当前用户的 ID
        # dscl . -read /Users/${vars.username} UniqueID
        uid = 501;
      };
    };

    knownUsers = [ vars.username ];
  };

  security.pam.services.sudo_local.touchIdAuth = true;

  system = {
    primaryUser = vars.username;

    # Set Git commit hash for darwin-version.
    configurationRevision = self.rev or self.dirtyRev or null;

    # Used for backwards compatibility, please read the changelog before changing.
    # $ darwin-rebuild changelog
    stateVersion = 6;
  };

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = vars.system;
}
