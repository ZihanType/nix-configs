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
      PKG_CONFIG_PATH = "${opencv}/lib/pkgconfig:${openssl.dev}/lib/pkgconfig:$PKG_CONFIG_PATH";
    };
  };
}
