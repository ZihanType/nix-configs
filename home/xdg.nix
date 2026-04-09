{ config, ... }:
let
  binDir = "${config.home.homeDirectory}/bin";
in
{
  xdg.enable = true;

  home = {
    preferXdgDirectories = true;

    sessionVariables = {
      XDG_BIN_HOME = "${binDir}";

      ANDROID_USER_HOME = "${config.xdg.dataHome}/android";
      LESSHISTFILE = "${config.xdg.stateHome}/lesshst";
    };

    sessionPath = [ "${binDir}" ];
  };
}
