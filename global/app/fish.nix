{
  pkgs,
  ...
}:
{
  programs.fish = {
    enable = true;
    package = pkgs.fishMinimal;
    useBabelfish = true;
  };
}
