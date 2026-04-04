{
  config,
  ...
}:
{
  programs.firefox = {
    enable = true;
    languagePacks = [ "zh-CN" ];
    nativeMessagingHosts = [ ];

    policies = {
      DisableAppUpdate = true;
      SkipTermsOfUse = true;
      DisableFirefoxAccounts = true;
      DisableTelemetry = true;
      DontCheckDefaultBrowser = true;
      DisplayBookmarksToolbar = "always";
      HttpsOnlyMode = "disallowed";
      NoDefaultBookmarks = true;
      PostQuantumKeyAgreementEnabled = true;

      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;

      OverrideFirstRunPage = "";
      OverridePostUpdatePage = "";

      DefaultDownloadDirectory = "${config.home.homeDirectory}/Downloads";
      PromptForDownloadLocation = false;

      RequestedLocales = [ "zh-CN" ];
      TranslateEnabled = false;

      SanitizeOnShutdown = {
        Cache = false;
        Cookies = false;
        FormData = true;
        History = false;
        Sessions = false;
        SiteSettings = false;
        Locked = true;
      };

      GenerativeAI = {
        Enabled = false;
        Chatbot = false;
        LinkPreviews = false;
        TabGroups = false;
        Locked = true;
      };

      Permissions = {
        Camera = {
          BlockNewRequests = true;
          Locked = true;
        };
        Microphone = {
          BlockNewRequests = true;
          Locked = true;
        };
        Location = {
          BlockNewRequests = true;
          Locked = true;
        };
        Notifications = {
          BlockNewRequests = true;
          Locked = true;
        };
        VirtualReality = {
          BlockNewRequests = true;
          Locked = true;
        };
        ScreenShare = {
          BlockNewRequests = true;
          Locked = true;
        };
        Autoplay = {
          Default = "block-audio-video";
          Locked = true;
        };
      };

      SearchEngines = {
        Add = [ ];
        Remove = [ ];
        Default = "百度";
        PreventInstalls = false;
      };
      SearchSuggestEnabled = false;

      UserMessaging = {
        ExtensionRecommendations = false;
        FeatureRecommendations = false;
        UrlbarInterventions = false;
        SkipOnboarding = true;
        MoreFromMozilla = false;
        FirefoxLabs = false;
        Locked = true;
      };

      EnableTrackingProtection = {
        Value = true;
        Cryptomining = true;
        Fingerprinting = true;
        EmailTracking = true;
        SuspectedFingerprinting = true;
        Category = "strict";
        Exceptions = [ ];
        BaselineExceptions = false;
        ConvenienceExceptions = false;
        Locked = true;
      };

      PrimaryPassword = false;
      OfferToSaveLogins = true;
      PasswordManagerEnabled = true;

      FirefoxSuggest = {
        WebSuggestions = false;
        SponsoredSuggestions = false;
        ImproveSuggest = false;
        Locked = true;
      };

      Homepage = {
        URL = "";
        Additional = [ ];
        StartPage = "none";
        Locked = true;
      };

      ExtensionSettings = {
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "normal_installed";
          # 显示在工具栏
          default_area = "navbar";
          private_browsing = true;
        };

        "{5efceaa7-f3a2-4e59-a54b-85319448e305}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/immersive-translate/latest.xpi";
          installation_mode = "normal_installed";
          # 显示在扩展菜单中
          default_area = "menupanel";
          private_browsing = true;
        };
      };
    };

    profiles.default = {
      id = 0;

      bookmarks = { };

      containers = { };
      containersForce = true;

      settings = {
        "sidebar.verticalTabs" = true;
        "sidebar.verticalTabs.dragToPinPromo.dismissed" = true;

        "intl.accept_languages" = "zh-CN";

        "devtools.toolbox.host" = "right";

        "browser.urlbar.trimURLs" = false;
        "browser.uiCustomization.state" = ''
          {
            "placements": {
              "widget-overflow-fixed-list": [],
              "unified-extensions-area": [
                "ublock0_raymondhill_net-browser-action",
                "_5efceaa7-f3a2-4e59-a54b-85319448e305_-browser-action"
              ],
              "nav-bar": [
                "sidebar-button",
                "back-button",
                "forward-button",
                "stop-reload-button",
                "customizableui-special-spring1",
                "vertical-spacer",
                "urlbar-container",
                "customizableui-special-spring2",
                "fxa-toolbar-menu-button",
                "unified-extensions-button"
              ],
              "TabsToolbar": [],
              "vertical-tabs": ["tabbrowser-tabs"],
              "PersonalToolbar": ["personal-bookmarks"]
            },
            "seen": [
              "ublock0_raymondhill_net-browser-action",
              "_5efceaa7-f3a2-4e59-a54b-85319448e305_-browser-action",
              "developer-button",
              "screenshot-button"
            ],
            "dirtyAreaCache": [
              "unified-extensions-area",
              "TabsToolbar",
              "vertical-tabs",
              "nav-bar",
              "PersonalToolbar"
            ],
            "currentVersion": 23,
            "newElementCount": 3
          }
        '';

        # "browser.startup.homepage" = "https://nixos.org";
        # "browser.search.region" = "GB";
        # "browser.search.isUS" = false;
        # "distribution.searchplugins.defaultLocale" = "en-GB";
        # "general.useragent.locale" = "en-GB";
        # "browser.bookmarks.showMobileBookmarks" = true;
        # "browser.newtabpage.pinned" = [
        #   {
        #     title = "NixOS";
        #     url = "https://nixos.org";
        #   }
        # ];
      };
      extensions = {
        # force = true;
        packages = [ ];
        settings = {
          # Example with uBlock origin's extensionID
          # "uBlock0@raymondhill.net" = {
          #   # force = true;
          #   settings = {
          #     selectedFilterLists = [
          #       "ublock-filters"
          #       "ublock-badware"
          #       "ublock-privacy"
          #       "ublock-unbreak"
          #       "ublock-quick-fixes"
          #     ];
          #   };
          # };
        };
      };
      handlers = {
        # force = true;

        mimeTypes = {
          # "application/pdf" = {
          #   action = 2;
          #   ask = false;
          #   handlers = [
          #     {
          #       name = "Okular";
          #       path = "${pkgs.okular}/bin/okular";
          #     }
          #   ];
          #   extensions = [ "pdf" ];
          # };
        };

        schemes = {
          # mailto = {
          #   action = 2;
          #   ask = false;
          #   handlers = [
          #     {
          #       name = "Gmail";
          #       uriTemplate = "https://mail.google.com/mail/?extsrc=mailto&url=%s";
          #     }
          #   ];
          # };
        };
      };

      search = {
        force = true;
        engines = {
          google.metaData.alias = "@g";
          baidu.metaData.alias = "@bd";
        };
      };
    };
  };
}
