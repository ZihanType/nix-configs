let
  name = "create-ramdisk";
  size = 6 * 1024 * 1024 * 1024 / 512; # 6 GB
in
{
  launchd.daemons.${name} = {
    serviceConfig = {
      Label = "by-nix-darwin.${name}";

      ProgramArguments = [
        "/bin/sh"
        "-c"
        "diskutil partitionDisk $(hdiutil attach -nomount ram://${toString size}) 1 GPT APFS 'ramdisk' '100%'"
      ];

      RunAtLoad = true;

      StandardOutPath = "/var/log/${name}.log";
      StandardErrorPath = "/var/log/${name}.log";
    };
  };
}
