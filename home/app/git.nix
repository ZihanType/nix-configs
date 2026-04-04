{
  config,
  pkgs,
  ...
}:
{
  programs.git = {
    enable = true;
    package = pkgs.git;
    ignores = [
      "/**/.DS_Store"
      "/**/ignore"

      # direnv
      "/**/.direnv"

      "/**/.github"

      "/**/openspec"

      "/**/*.openapi.json"
    ];
    includes = [
      {
        # 必须以 `gitdir:` 开头，** 必须以 `/` 结尾 **
        condition = "gitdir:${config.home.homeDirectory}/cowa/";
        contents = {
          user = {
            email = "wangzihan@cowarobot.com";
            name = "wangzihan";
          };
        };
      }
    ];
    settings = {
      core = {
        autocrlf = "input";
        ignoreCase = false;
        editor = "code --wait";
      };
      user = {
        email = "ZihanType@protonmail.com";
        name = "ZihanType";
      };
      init = {
        defaultBranch = "main";
      };
      pull = {
        rebase = false;
      };
      push = {
        autoSetupRemote = true;
      };
      credential = {
        helper = "osxkeychain";
      };
    };
  };

  programs.lazygit = {
    enable = true;
    enableFishIntegration = true;
    enableZshIntegration = true;
    settings = {
      gui = {
        language = "zh-CN";
      };
    };
  };
}
