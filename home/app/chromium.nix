{
  programs.chromium = {
    enable = true;
    package = null;
    extensions =
      let
        commonCreateChromiumExtension =
          {
            id,
            version,
            url,
            sha256,
          }:
          {
            inherit id;
            inherit version;
            crxPath = builtins.fetchurl {
              inherit url;
              name = "${id}.crx";
              inherit sha256;
            };
          };

        createChromiumExtensionFor =
          browserVersion:
          {
            id,
            version,
            sha256,
          }:
          commonCreateChromiumExtension {
            inherit id;
            inherit version;
            url = "https://clients2.google.com/service/update2/crx?response=redirect&acceptformat=crx2,crx3&prodversion=${browserVersion}&x=id%3D${id}%26installsource%3Dondemand%26uc";
            inherit sha256;
          };

        createChromiumExtension = createChromiumExtensionFor "145";
        # createChromiumExtension = createChromiumExtensionFor (
        #   lib.versions.major pkgs.ungoogled-chromium.version
        # );
      in
      [
        # Chromium Web Store
        (
          let
            version = "1.5.5.3";
          in
          commonCreateChromiumExtension {
            id = "ocaahdebbfolfmndjeplogmgcagdmblk";
            version = version;
            url = "https://github.com/NeverDecaf/chromium-web-store/releases/download/v${version}/Chromium.Web.Store.crx";
            sha256 = "0ns451jj78z7hikqzfd010697ggnbh1am9pbb09ln81xxjx46r1j";
          }
        )

        # 'Improve YouTube!' 🎧 (for YouTube & Videos)
        (createChromiumExtension {
          id = "bnomihfieiccainjcjblhegjgglakjdd";
          version = "4.2000";
          sha256 = "1pn47i9r0710wp8h1ijl6g2vrc3a2l4cxwkzmr6jsd1a95rf2849";
        })

        # Better History | 管理、导出与删除历史记录
        (createChromiumExtension {
          id = "egehpkpgpgooebopjihjmnpejnjafefi";
          version = "7.0.0";
          sha256 = "0sv60cn68vnbknfp2in0mab8fxdpb0d5w0ykgn1c0n8ywzgyl3hx";
        })

        # C/C++ DevTools Support (DWARF)
        (createChromiumExtension {
          id = "pdcpmagijalfljmkmjngeonclgbbannb";
          version = "0.2.5854.1";
          sha256 = "1klgpmabz5bxi0cl82g2q6pyr573xirhxjz30avcrb1936axkizl";
        })

        # ClearURLs
        (createChromiumExtension {
          id = "lckanjgmijmafbedllaakclkaicjfmnk";
          version = "1.26.0";
          sha256 = "06m3b3npis7cpv0yif0rs3dkfdgd69r0rkyxlwwry26h58dp7hdc";
        })

        # Decentraleyes
        (createChromiumExtension {
          id = "ldpochfccmkkmhdbclfhpagapcfdljkj";
          version = "3.0.0";
          sha256 = "198k1hyzf3a1yz4chnx095rwqa15hkcck4ir6xs6ps29qgqw8ili";
        })

        # Disconnect
        (createChromiumExtension {
          id = "jeoacafpbcihiomhlakheieifhpjdfeo";
          version = "21.1.2";
          sha256 = "1cpr0y2zc4y49p6g5dr5bij99ihrdy7xsl2zb4wnpkbxbla8d8kf";
        })

        # Global Speed: 视频速度控制
        (createChromiumExtension {
          id = "jpbjcnkcffbooppibceonlgknpkniiff";
          version = "3.2.66";
          sha256 = "0lknrvnszpvl9c83rw79mnh0gkjjzkgnk5xpicp4jbj1kb2xjs36";
        })

        # QuickGo 外链直达 — 无感知自动跳过*乎、*书、掘*金、C**N、少数派、Gi**e 等网站的安全中心跳转限制
        (createChromiumExtension {
          id = "homllehcipjgpbpepcojhgcpfdopjhml";
          version = "3.5.0";
          sha256 = "00bxdfmzdss8zgfwwsjy5l0plfssydmgrlbs1qwvv6akiplqbdry";
        })

        # Return YouTube Dislike
        (createChromiumExtension {
          id = "gebbhagfogifgggkldgodflihgfeippi";
          version = "4.0.2";
          sha256 = "0svqnwj0vnl9cwl6jwbc6iczvl79fj0yqmj1ii61j06bazscjzlv";
        })

        # Ruffle - Flash Emulator
        (createChromiumExtension {
          id = "donbcfbmhbcapadipfkeojnmajbakjdc";
          version = "0.2.0-nightly.2026.3.17";
          sha256 = "1g7v9c49j46b5mvvh76bgf0isk7hhilijsdrkhn8rs8hxhx5w1r2";
        })

        # SingleFile
        (createChromiumExtension {
          id = "mpiodijhokgodhhofbcjdecpffjipkle";
          version = "1.22.98";
          sha256 = "0h8gdk6skdfj74afhgqgfdwshb8ci873il06w7c0diczxf10pmqb";
        })

        # uBlock Origin
        (createChromiumExtension {
          id = "cjpalhdlnbpafiamejdnhcphjbkeiagm";
          version = "1.70.0";
          sha256 = "0sf88f9wpf300v02k40i9sda6wysvlgf4smmggf6awpwb1hyd1hl";
        })

        # User-Agent Switcher for Chrome
        (createChromiumExtension {
          id = "djflhoibgkdhkhhcedjiklpkjnoahfmg";
          version = "2.0.2";
          sha256 = "0i33f6y6dchnd2lyrj9463y8vk5m6nvj43y5nn0ijsxi3686ymzp";
        })

        # WebRTC Control
        (createChromiumExtension {
          id = "fjkmabmdepjfammlpliljpnbhleegehm";
          version = "0.3.4";
          sha256 = "0rh5ndwd6xqbr9farkp4wc6w299i7ba8f309w01m2kfmandfalpl";
        })

        # 暴力猴
        (createChromiumExtension {
          id = "jinjaccalgkegednnccohejagnlnfdag";
          version = "2.35.0";
          sha256 = "1avs09ffs6zr7jr44982pay4l8hg0bi949vhvxh6kl166kw049nl";
        })

        # 沉浸式翻译 - 网页翻译插件 | PDF翻译 | 免费
        (createChromiumExtension {
          id = "bpoadfkcbjbfhfodiogcnhhhpibjhbnh";
          version = "1.26.6";
          sha256 = "1rrmhk71zlqx3ja4kp9z55mricbrpw44l7gsds65qjn0mfg307gq";
        })

        # 隐私獾
        (createChromiumExtension {
          id = "pkehgijcmpdhfbdbbnkijodmdjhbjlgp";
          version = "2026.2.20";
          sha256 = "0xl9zqmm92g03c39aqgrpzkvk8k9r376amx2x5z3sip89sy7daa8";
        })
      ];
  };
}
