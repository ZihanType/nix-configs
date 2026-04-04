{
  pkgs,
  ...
}:
{
  environment = {
    systemPackages = with pkgs; [
      pkg-config
    ];

    variables = with pkgs; {
      LIBCLANG_PATH = "${libclang.lib}/lib";
      PKG_CONFIG_PATH = "${opencv}/lib/pkgconfig:$PKG_CONFIG_PATH";
    };
  };
}
