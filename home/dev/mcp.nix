{
  programs.mcp = {
    enable = true;
    servers = {

      github = {
        type = "http";
        url = "https://api.githubcopilot.com/mcp/";
      };

      playwright = {
        type = "stdio";
        command = "bunx";
        args = [
          "@playwright/mcp@latest"
        ];
      };

    };
  };
}
