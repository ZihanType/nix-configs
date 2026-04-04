{
  pkgs,
  ...
}:
{
  programs.fastfetch = {
    enable = true;
    package = pkgs.fastfetch.override {
      apple-sdk_15 = pkgs.apple-sdk_26;
    };
    settings = { };
  };
}
