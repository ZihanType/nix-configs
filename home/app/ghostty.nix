{
  programs.ghostty = {
    enable = true;
    package = null;
    settings = {
      language = "zh_CN";

      font-family = [
        "JetBrainsMono Nerd Font Mono"
        "Sarasa Term SC"
      ];
      # font-feature = "-calt, -liga, -dlig";
      font-feature = "-calt";
      font-size = 25;
      font-thicken = true;

      theme = "Gruvbox Dark";

      cursor-style = "bar";
      cursor-style-blink = false;

      # command = "${pkgs.fishMinimal}/bin/fish";

      maximize = true;

      working-directory = "home";
      window-inherit-working-directory = false;
      tab-inherit-working-directory = false;
      split-inherit-working-directory = true;

      window-padding-x = 10;
      window-padding-y = 10;

      window-new-tab-position = "end";

      copy-on-select = "clipboard";

      quit-after-last-window-closed = true;

      macos-titlebar-style = "tabs";

      bold-color = "bright";

      auto-update = "off";
    };
  };
}
