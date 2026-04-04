{
  system = {
    defaults = {
      LaunchServices = {
        LSQuarantine = false; # 关闭下载文件的安全警告
      };

      NSGlobalDomain = {
        # 打开文稿时首选标签页
        AppleWindowTabbingMode = "always"; # 始终
        # 是否启用24小时制
        AppleICUForce24HourTime = false; # 12小时制
        # 键盘全控制模式
        AppleKeyboardUIMode = 2; # 允许使用键盘导航所有控制项，包括对话框中的按钮和菜单栏中的项目
        # 是否在 Finder 中显示所有文件扩展名
        AppleShowAllExtensions = true;
        # 是否始终显示隐藏文件
        AppleShowAllFiles = true;
        # 自动大写字词的首字母
        NSAutomaticCapitalizationEnabled = false;
        # 使用智能破折号
        NSAutomaticDashSubstitutionEnabled = false;
        # 使用智能引号
        NSAutomaticQuoteSubstitutionEnabled = false;

        # 显示文内预测文本
        NSAutomaticInlinePredictionEnabled = false;
        # 连按两下空格键插入句号
        NSAutomaticPeriodSubstitutionEnabled = false;
        # 长按弹出“重音符号”
        ApplePressAndHoldEnabled = false; # 关闭长按弹出重音符号的功能，改为重复输入字符
        # 跳转到滚动条上点击的位置
        AppleScrollerPagingBehavior = true;
        # 是否禁用不活跃应用程序的自动终止功能
        NSDisableAutomaticTermination = true; # 禁止自动终止应用程序

        # 这两个设置都需要设置为 true，才能在保存对话框中默认展开更多选项
        NSNavPanelExpandedStateForSaveMode = true;
        NSNavPanelExpandedStateForSaveMode2 = true;

        # 是否默认将新文档保存到 iCloud
        NSDocumentSaveNewDocumentsToCloud = false;
      };

      trackpad = {
        # 四指左右轻扫
        TrackpadFourFingerHorizSwipeGesture = 2; # 在全屏应用程序之间滑动
        # 三指左右轻扫
        # TrackpadThreeFingerHorizSwipeGesture = 1; # 什么行为要看具体应用的实现，Finder 和 Safari 是前进后退，VSCode 是切换打开的文件
      };

      CustomUserPreferences = {
        NSGlobalDomain = {
          # 关闭文稿时要求保存更改
          NSCloseAlwaysConfirmsChanges = true;
          # 退出应用程序时关闭窗口
          NSQuitAlwaysKeepsWindows = false; # 退出应用程序时不保留窗口状态

          # 自动纠正拼写
          NSAutomaticSpellingCorrectionEnabled = false;
          WebAutomaticSpellingCorrectionEnabled = false;
        };

        "com.apple.Safari" = {
          # 显示完整网站地址
          "ShowFullURLInSmartSearchField" = true; # 并不是真的显示完整地址，只是相对显示了更多地址信息
          # 显示单独的标签栏
          "ShowStandaloneTabBar" = false; # 否，在窗口标题栏显示标签页，和 Chrome 类似，而不是单独的标签栏
        };

        "com.apple.controlcenter" = {
          # 最近使用的文稿、应用程序和服务器
          NumberOfRecents = 0; # 无
        };

        # 键盘快捷键
        "com.apple.symbolichotkeys" = {
          "AppleSymbolicHotKeys" = {
            # 显示“聚焦”搜索
            "64" = {
              enabled = false;
              value = {
                type = "standard";
                parameters = [
                  65535
                  49
                  1048576
                ];
              };
            };
            # 显示“访达”搜索窗口
            "65" = {
              enabled = false;
              value = {
                type = "standard";
                parameters = [
                  65535
                  49
                  1572864
                ];
              };
            };
          };
        };

      };
    };
  };
}
