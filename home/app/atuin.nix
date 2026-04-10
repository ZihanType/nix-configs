{
  config,
  ...
}:
let
  logDir = "${config.xdg.stateHome}/atuin/logs";
in
{
  programs.atuin = {
    enable = true;
    enableFishIntegration = true;
    enableZshIntegration = true;
    daemon.enable = false;
    forceOverwriteSettings = true;
    settings = {
      # auto_sync = true;
      # sync_frequency = "5m";
      # sync_address = "https://api.atuin.sh";
      # search_mode = "prefix";

      enter_accept = true;

      logs = {
        dir = logDir;
      };
    };
  };
}
