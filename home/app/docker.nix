{
  config,
  pkgs,
  ...
}:
{
  # TUI
  programs.lazydocker = {
    enable = true;
    settings = {
      gui = {
        language = "zh";
        expandFocusedSidePanel = true;
      };
      logs = {
        since = "";
      };
      commandTemplates.dockerCompose = "docker compose"; # Lazydocker uses docker-compose by default which will not work
    };
  };

  # client config
  programs.docker-cli = {
    enable = true;
  };

  # client
  home.packages = with pkgs; [
    docker
    docker-compose
    docker-buildx
  ];

  # server
  services.colima = {
    enable = true;
    package = pkgs.colima.override {
      krunkit = null;
      qemu = null;
      lima-full = pkgs.lima.override {
        qemu = null;
      };
    };
    limaHomeDir = "${config.xdg.dataHome}/lima";
    profiles = {
      default = {
        isActive = true;
        # isService = true;
        setDockerHost = true;

        settings = {
          cpu = 4;
          disk = 10;
          memory = 4;
          arch = "host";
          runtime = "docker";
          modelRunner = "docker";
          hostname = null;
          kubernetes = {
            enabled = false;
            version = "v1.35.0+k3s1";
            k3sArgs = [ "--disable=traefik" ];
            port = 0;
          };
          autoActivate = true;
          network = {
            address = false;
            mode = "shared";
            interface = "en0";
            preferredRoute = false;
            dns = [ ];
            dnsHosts = {
              "host.docker.internal" = "host.lima.internal";
            };
            hostAddresses = false;
            gatewayAddress = "192.168.5.2";
          };
          forwardAgent = false;
          docker = { };
          vmType = "vz";
          portForwarder = "ssh";
          rosetta = true;
          binfmt = true;
          nestedVirtualization = false;
          mountType = "virtiofs";
          mountInotify = false;
          cpuType = "host";
          provision = [ ];
          sshConfig = true;
          sshPort = 0;
          mounts = [ ];
          diskImage = "";
          rootDisk = 10;
          env = { };
        };
      };
    };
  };
}
