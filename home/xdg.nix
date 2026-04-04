{ config, ... }:
let
  homeDir = config.home.homeDirectory;
in
{
  xdg.enable = true;

  home = {
    preferXdgDirectories = true;

    sessionVariables = {
      XDG_BIN_HOME = "${homeDir}/bin";

      ANDROID_USER_HOME = "${config.xdg.dataHome}/android";
      LESSHISTFILE = "${config.xdg.stateHome}/lesshst";
    };

    sessionPath = [ "${homeDir}/bin" ];
  };
}
