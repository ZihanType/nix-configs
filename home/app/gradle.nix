{ pkgs, ... }:
{
  programs.gradle = {
    enable = true;
    package = pkgs.gradle_9;
    home = ".local/share/gradle";
    settings = {
      # System properties
      "systemProp.file.encoding" = "UTF-8";

      # Gradle properties
      "org.gradle.caching" = true;
      "org.gradle.configuration-cache" = true;
      "org.gradle.daemon" = true;
      "org.gradle.java.installations.auto-detect" = false;
      "org.gradle.java.installations.auto-download" = false;
      "org.gradle.jvmargs" = ''-Xmx512m "-XX:MaxMetaspaceSize=384m"'';
      "org.gradle.parallel" = true;

      # Project properties
      "kotlin.code.style" = "official";
    };
    initScripts = {
      "cache-settings.init.gradle".text = ''
        beforeSettings { settings ->
            settings.caches {
                # 在每次构建会话结束时执行清理操作
                cleanup = Cleanup.ALWAYS

                # 使用 CACHEDIR.TAG 文件标记缓存
                markingStrategy = MarkingStrategy.CACHEDIR_TAG

                # 稳定包装器
                releasedWrappers.removeUnusedEntriesAfterDays = 20
                # 快照包装器
                snapshotWrappers.removeUnusedEntriesAfterDays = 7
                # 共享下载缓存
                downloadedResources.removeUnusedEntriesAfterDays = 20
                # 共享构建缓存
                createdResources.removeUnusedEntriesAfterDays = 7
                # 本地构建缓存
                buildCache.removeUnusedEntriesAfterDays = 5
                # 守护进程日志
                daemonLogs.removeUnusedEntriesAfterDays = 7
            }
        }
      '';
    };
  };
}
