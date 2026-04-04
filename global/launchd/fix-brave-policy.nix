let
  name = "fix-brave-policy";
in
{
  launchd.daemons.${name} = {
    serviceConfig = {
      Label = "by-nix-darwin.${name}";

      ProgramArguments = [
        "/bin/sh"
        "-c"
        ''
          PLIST="/Library/Managed Preferences/com.brave.Browser.plist"
          PLISTBUDDY="/usr/libexec/PlistBuddy"

          set_bool() {
            KEY="$1"
            VALUE="$2"

            "$PLISTBUDDY" -c "Add :$KEY bool $VALUE" "$PLIST" 2>/dev/null
          }

          # 启用
          set_bool BraveWaybackMachineEnabled true
          set_bool BravePlaylistEnabled true

          # 禁用
          set_bool SyncDisabled true
          set_bool TorDisabled true
          set_bool BraveRewardsDisabled true
          set_bool BraveWalletDisabled true
          set_bool BraveVPNDisabled true
          set_bool BraveNewsDisabled true
          set_bool BraveTalkDisabled true
          set_bool BraveAIChatEnabled false
          set_bool BraveSpeedreaderEnabled false
          set_bool BraveP3AEnabled false
          set_bool BraveStatsPingEnabled false
          set_bool BraveWebDiscoveryEnabled false

          exit 0
        ''
      ];

      RunAtLoad = true;

      # 当 plist 被 profile service 重建时重新执行
      WatchPaths = [
        "/Library/Managed Preferences/com.brave.Browser.plist"
      ];

      # 额外保险，每 30 秒检查一次
      # StartInterval = 30;

      StandardOutPath = "/var/log/${name}.log";
      StandardErrorPath = "/var/log/${name}.log";
    };
  };
}
