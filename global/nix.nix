{
  vars,
  ...
}:
{
  nix = {
    settings = {
      # access-tokens = "";

      use-xdg-base-directories = true;
      substituters = [ "https://mirror.sjtu.edu.cn/nix-channels/store" ];
      # trusted-public-keys = [ ];
      extra-substituters = [
        "https://zihan-type.cachix.org"

        "https://cache.numtide.com"
        "https://nix-community.cachix.org"
        "https://devenv.cachix.org"
      ];
      extra-trusted-public-keys = [
        "zihan-type.cachix.org-1:Et3+mUASnAGou+mo4Ei1jdQDUWI/UnlF1k3xvxnJzIo="

        "niks3.numtide.com-1:DTx8wZduET09hRmMtKdQDxNNthLQETkc/yaX7M4qK0g="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="
      ];
      experimental-features = "nix-command flakes";
      trusted-users = [ vars.username ];
      sandbox = true;
      sandbox-fallback = false;
      # extra-sandbox-paths = [
      #   "/System/Library/Frameworks"
      #   "/usr/lib"
      # ];

      auto-optimise-store = true;
      min-free = 10737418240; # 10GB
      preallocate-contents = true;

      # 否定查找的 TTL，强制 Nix 重新检查二进制缓存中是否存在某个文件
      narinfo-cache-negative-ttl = 0;
    };

    gc = {
      automatic = true;
      interval = [
        {
          Hour = 23;
        }
      ];
      options = "--delete-older-than 7d";
    };

    optimise = {
      automatic = true;
      interval = [
        {
          Hour = 23;
        }
      ];
    };
  };

}
