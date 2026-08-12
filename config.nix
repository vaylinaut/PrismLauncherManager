{
  pkgs,
  config,
  ...
}:

{
  home.packages = [
    config.programs.MCSR-Prismlauncher.package
  ];

  programs.MCSR-Prismlauncher = {
    enable = true;

    package = pkgs.prismlauncher.override {
      jdks = [
        pkgs.temurin-bin-8
        pkgs.jdk25
      ];
      additionalPrograms = [ ];
      additionalLibs = with pkgs; [
        libXtst
        libXext
        libX11
        libxkbcommon
        libxcb
        libxt
        libxinerama
        jemalloc
      ];
    };

    config = {
      general = {
        instanceSorting = "Name";
        instanceRenaming = "AskEverytime";
        menuBar = false;

        instanceDirectory = "instances";
        modsDirectory = "mods";
        iconsDirectory = "icons";
        javaDirectory = "java";
        skinsDirectory = "skins";

        modMetadata = true;
        modDependencyAutoInstall = true;
        detectModIncompatibility = false;
        modpackUpdatePrompt = true;

        logHistoryLimit = 100000;

        concurrentTaskLimit = 8;
        concurrentDownloadLimit = 6;
        retryLimit = 1;
        HTTPTimeout = 60;
      };

      language.language = "en_US";

      appearance = {
        theme = "system";
        icons = "flat";

        consoleFont = "FiraCode Nerd Font";
        consoleFontSize = 16;

        backgroundCat = "rory";
        catFit = "fill";
        catOpacity = 100;
      };

      minecraft = {
        general = {
          maximize = false;
          windowHeight = 480;
          windowWidth = 854;
          showConsole = false;
          errorConsole = true;

          showGameTime = true;
          showGameTimeDays = true;
          ShowGlobalGameTime = true;
        };
        tweaks = {
          onlineFixes = false;
          naitiveGLFW = true;
          naitiveOpenAL = true;
          feralGamemode = true;
          mangoHUD = false;
          discreteGPU = false;
          zink = false;
        };
        customCommands = {
          preLaunch = "";
          wrapper = "waywall wrap --";
          postExit = "";
        };
        environmentVariables = {
          "LD_PRELOAD" = "${pkgs.jemalloc}/lib/libjemalloc.so";
        };
      };

      java = {
        executable = "${pkgs.temurin-bin-8}/bin/java";
        javaCompatibilityCheck = true;
        javaWizard = false;
        detectJavaVersion = true;

        minMemoryUsage = 256;
        maxMemoryUsage = 4096;
        permGenSize = 128;
        lowMemoryWarning = true;
      };
    };

    instances = {
      "idkanymore" = {
        settings = {
          general = {
            version = "1.16.1";
            name = "marginal";
          };

          window = {
            maximize = false;
            windowHeight = 480;
            windowWidth = 854;
          };
          console = {
            showConsole = false;
            errorConsole = true;
          };
          gameTime = {
            showGameTime = true;
          };
          java = {
            executable = "${pkgs.temurin-bin-8}/bin/java";
            javaCompatibilityCheck = true;

            minMemoryUsage = 256;
            maxMemoryUsage = 4096;
            permGenSize = 128;
            lowMemoryWarning = true;
          };
          tweaks = {
            onlineFixes = false;
            naitiveGLFW = true;
            naitiveOpenAL = true;
            feralGamemode = true;
            mangoHUD = false;
            discreteGPU = false;
            zink = false;
          };
          customCommands = {
            preLaunch = "";
            wrapper = "waywall wrap --";
            postExit = "";
          };
          environmentVariables = {
            "LD_PRELOAD" = "${pkgs.jemalloc}/lib/libjemalloc.so";
          };
        };
      };
    };
    #       servers = {
    #         "Vay's Awesome server" = {
    #           url = "example.com";
    #         };
    #         "Bedwars practice" = {
    #           url = "bedwarspractice.club";
    #         };
    #       };
    #       mods = [

    #       ];
    #     };
    #   };
    # };
    #
  };
}
