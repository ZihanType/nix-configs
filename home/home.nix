{
  vars,
  ...
}:
{
  imports = [
    ./xdg.nix
    ./nix.nix

    # app
    ./app/atuin.nix
    ./app/brave.nix
    ./app/bun.nix
    # ./app/chromium.nix
    ./app/docker.nix
    ./app/fastfetch.nix
    ./app/firefox.nix
    ./app/fish.nix
    ./app/fzf.nix
    ./app/ghostty.nix
    ./app/git.nix
    ./app/gradle.nix
    ./app/nh.nix
    ./app/opencode.nix
    ./app/ripgrep.nix
    ./app/starship.nix
    ./app/uv.nix
    # ./app/vscode.nix
    ./app/yazi.nix
    ./app/zsh.nix

    # dev
    ./dev/rust.nix
    ./dev/mcp.nix
  ];

  programs.man.generateCaches = false;

  home = {
    # Home Manager needs a bit of information about you and the
    # paths it should manage.
    username = vars.username;
    homeDirectory = "/Users/${vars.username}";

    # Home Manager is pretty good at managing dotfiles. The primary way to manage
    # plain files is through 'home.file'.
    file = {
      # # Building this configuration will create a copy of 'dotfiles/screenrc' in
      # # the Nix store. Activating the configuration will then make '~/.screenrc' a
      # # symlink to the Nix store copy.
      # ".screenrc".source = dotfiles/screenrc;
    };

    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    stateVersion = "26.05";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
