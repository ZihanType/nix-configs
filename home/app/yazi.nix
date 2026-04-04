{
  pkgs,
  config,
  ...
}:
let
  cacheDir = "${config.xdg.cacheHome}/yazi";
in
{
  programs.yazi = {
    enable = true;
    package = pkgs.yazi.override {
      _7zz = pkgs._7zz-rar; # Support for RAR extraction
    };
    enableFishIntegration = true;
    enableZshIntegration = true;
    shellWrapperName = "yy";
    settings = {
      mgr = {
        sort_by = "natural";
        sort_sensitive = false;
        sort_dir_first = true;
        show_hidden = true;
        show_symlink = true;
      };
      preview = {
        cache_dir = cacheDir;
      };
      plugin = {
        prepend_fetchers = [
          {
            id = "git";
            url = "*";
            run = "git";
          }
          {
            id = "git";
            url = "*/";
            run = "git";
          }
        ];
      };
    };
    initLua = ''
      require("full-border"):setup()

      require("git"):setup {
        -- Order of status signs showing in the linemode
        order = 1500,
      }

      require("starship"):setup()
    '';
    plugins = {
      starship = pkgs.yaziPlugins.starship;
      git = pkgs.yaziPlugins.git;
      full-border = pkgs.yaziPlugins.full-border;
    };
  };
}
