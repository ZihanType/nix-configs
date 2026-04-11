{ config, ... }:
{
  xdg = {
    enable = true;
    localBinInPath = true;
  };

  home = {
    preferXdgDirectories = true;

    sessionVariables = {
      ANDROID_USER_HOME = "${config.xdg.dataHome}/android";
      LESSHISTFILE = "${config.xdg.stateHome}/lesshst";
    };
  };
}
