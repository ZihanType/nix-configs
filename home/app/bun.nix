{
  config,
  pkgs,
  ...
}:
let
  globalDir = "${config.xdg.cacheHome}/.bun/install/global";

  bunWithNodeAlias = pkgs.symlinkJoin {
    name = "bun-as-node";
    paths = [ pkgs.bun ];
    postBuild = ''
      ln -s $out/bin/bun $out/bin/node
    '';
  };
in
{
  home.packages = [
    bunWithNodeAlias
  ];

  programs.bun = {
    enable = true;
    enableGitIntegration = true;
    settings = {
      run = {
        bun = true;
      };
      install = {
        registry = "https://registry.npmmirror.com";
        globalBinDir = config.xdg.binHome;
        linker = "isolated";
        linkWorkspacePackages = false;
      };
    };
  };

  home.file."${globalDir}/bunfig.toml".text = ''
    [install]
    linker = "hoisted"
  '';
}
