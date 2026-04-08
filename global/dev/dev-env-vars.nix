{
  pkgs,
  lib,
  ...
}:
{
  environment = {
    systemPackages = with pkgs; [
      pkg-config
    ];

    variables = {
      LIBCLANG_PATH = "${pkgs.libclang.lib}/lib";

      PKG_CONFIG_PATH =
        lib.makeSearchPath "lib/pkgconfig" (
          with pkgs;
          [
            opencv
            openssl.dev
          ]
        )
        + ":$PKG_CONFIG_PATH";
    };
  };
}
