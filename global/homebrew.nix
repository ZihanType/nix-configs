{
  config,
  ...
}:
{
  environment.variables = {
    HOMEBREW_NO_ANALYTICS = "1";
    HOMEBREW_DOWNLOAD_CONCURRENCYv = "auto";
  };

  homebrew = {
    enable = true;
    enableFishIntegration = true;
    enableZshIntegration = true;
    global = {
      autoUpdate = false;
      brewfile = true;
    };
    onActivation = {
      autoUpdate = false;
      cleanup = "none"; # "none" | "check" | "uninstall" | "zap"
      upgrade = true;
    };
    taps = builtins.attrNames config.nix-homebrew.taps;
    brews = [
      "mas"
      "m-cli"
      "mole"
    ];
    masApps = {
      "百度网盘" = 547166701;
      "QQ" = 451108668;
      "WPS Office" = 1443749478;
      "微信" = 836500024;
      "腾讯会议" = 1484048379;
      "Bandizip" = 1265704574;
      "Dropover" = 1355679052;
      "沉浸式翻译" = 6447957425;
      "Telegram" = 747648890;
      "uBlock Origin Lite" = 6745342698;
      "Userscripts" = 1463298887;
      "Windows App" = 1295203466;
      "飞书" = 1551632588;
    };
    caskArgs = {
      # appdir = "~/Applications";
      language = "zh";
    };
    greedyCasks = true;
    casks = [
      "aldente"
      "brave-browser"
      "create-tauri-app-bin"
      "crossover"
      "datagrip"
      "ghostty"
      "iina"
      "intellij-idea"
      "linearmouse"
      "macs-fan-control"
      "openineditor-lite"
      "openinterminal-lite"
      # "parallels"
      "pearcleaner"
      "pixpin"
      "raycast"
      "squirrel-app"
      "steam"
      "yaak"
      "tencent-lemon"
      "visual-studio-code"
    ];
  };
}
