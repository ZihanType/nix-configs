{
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    enableZshIntegration = true;
    settings = {
      package = {
        disabled = true;
      };
      directory = {
        truncate_to_repo = false;
        truncation_length = 0;
      };
    };
  };
}
