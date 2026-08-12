{
  lib,
  pkgs,
  config,
  ...
}:

let
  cfg = config.programs.MCSR-Prismlauncher.config;
in
{
  options.programs.MCSR-Prismlauncher = {
    enable = lib.mkEnableOption "Enable PrismLauncher configuration";
    package = lib.mkOption {
      type = lib.types.package;
      default = pkgs.prismlauncher;
    };
    configFilePath = lib.mkOption {
      type = lib.types.str;
      default = ".local/share/PrismLauncher/prismlauncher.cfg";
    };
    config = {
      general.instanceSorting = lib.mkOption {
        type = lib.types.enum [
          "Name"
          "LastLaunch"
        ];
        default = "Name";
      };
      general.instanceRenaming = lib.mkOption {
        type = lib.types.enum [
          "AskEverytime"
          "PhysicalDir"
          "MetadataOnly"
        ];
        default = "AskEverytime";
      };
      general.menuBar = lib.mkOption {
        type = lib.types.bool;
        default = false;
      };
      general.instanceDirectory = lib.mkOption {
        type = lib.types.str;
        default = "instances";
      };
      general.modsDirectory = lib.mkOption {
        type = lib.types.str;
        default = "mods";
      };
      general.iconsDirectory = lib.mkOption {
        type = lib.types.str;
        default = "icons";
      };
      general.javaDirectory = lib.mkOption {
        type = lib.types.str;
        default = "java";
      };
      general.skinsDirectory = lib.mkOption {
        type = lib.types.str;
        default = "skins";
      };
      general.modMetadata = lib.mkOption {
        type = lib.types.bool;
        default = true;
      };
      general.modDependencyAutoInstall = lib.mkOption {
        type = lib.types.bool;
        default = true;
      };
      general.detectModIncompatibility = lib.mkOption {
        type = lib.types.bool;
        default = false;
      };
      general.modpackUpdatePrompt = lib.mkOption {
        type = lib.types.bool;
        default = true;
      };
      general.logHistoryLimit = lib.mkOption {
        type = lib.types.int;
        default = 100000;
      };
      general.concurrentTaskLimit = lib.mkOption {
        type = lib.types.int;
        default = 8;
      };
      general.concurrentDownloadLimit = lib.mkOption {
        type = lib.types.int;
        default = 6;
      };
      general.retryLimit = lib.mkOption {
        type = lib.types.int;
        default = 1;
      };
      general.HTTPTimeout = lib.mkOption {
        type = lib.types.int;
        default = 60;
      };
      language.language = lib.mkOption {
        type = lib.types.str;
        default = "en_US";
      };
      appearance.theme = lib.mkOption {
        type = lib.types.str;
        default = "system";
      };
      appearance.icons = lib.mkOption {
        type = lib.types.str;
        default = "flat";
      };
      appearance.consoleFont = lib.mkOption {
        type = lib.types.str;
        default = "FiraCode Nerd Font";
      };
      appearance.consoleFontSize = lib.mkOption {
        type = lib.types.int;
        default = 16;
      };
      appearance.backgroundCat = lib.mkOption {
        type = lib.types.str;
        default = "rory";
      };
      appearance.catFit = lib.mkOption {
        type = lib.types.enum [
          "fit"
          "fill"
          "stretch"
        ];
        default = "fit";
      };
      appearance.catOpacity = lib.mkOption {
        type = lib.types.int;
        default = 50;
      };
      minecraft.general.maximize = lib.mkOption {
        type = lib.types.bool;
        default = false;
      };
      minecraft.general.windowHeight = lib.mkOption {
        type = lib.types.int;
        default = 480;
      };
      minecraft.general.windowWidth = lib.mkOption {
        type = lib.types.int;
        default = 854;
      };
      minecraft.general.showConsole = lib.mkOption {
        type = lib.types.bool;
        default = false;
      };
      minecraft.general.errorConsole = lib.mkOption {
        type = lib.types.bool;
        default = true;
      };
      minecraft.general.showGameTime = lib.mkOption {
        type = lib.types.bool;
        default = true;
      };
      minecraft.general.showGameTimeDays = lib.mkOption {
        type = lib.types.bool;
        default = true;
      };
      minecraft.general.ShowGlobalGameTime = lib.mkOption {
        type = lib.types.bool;
        default = true;
      };
      minecraft.tweaks.onlineFixes = lib.mkOption {
        type = lib.types.bool;
        default = false;
      };
      minecraft.tweaks.naitiveGLFW = lib.mkOption {
        type = lib.types.bool;
        default = true;
      };
      minecraft.tweaks.naitiveOpenAL = lib.mkOption {
        type = lib.types.bool;
        default = true;
      };
      minecraft.tweaks.feralGamemode = lib.mkOption {
        type = lib.types.bool;
        default = true;
      };
      minecraft.tweaks.mangoHUD = lib.mkOption {
        type = lib.types.bool;
        default = false;
      };
      minecraft.tweaks.discreteGPU = lib.mkOption {
        type = lib.types.bool;
        default = false;
      };
      minecraft.tweaks.zink = lib.mkOption {
        type = lib.types.bool;
        default = false;
      };
      minecraft.customCommands.preLaunch = lib.mkOption {
        type = lib.types.str;
        default = "";
      };
      minecraft.customCommands.wrapper = lib.mkOption {
        type = lib.types.str;
        default = "waywall wrap --";
      };
      minecraft.customCommands.postExit = lib.mkOption {
        type = lib.types.str;
        default = "";
      };
      minecraft.environmentVariables = lib.mkOption {
        type = lib.types.attrsOf lib.types.str;
        default = { };
        description = "Environment variables passed to PrismLauncher.";
      };
      java.executable = lib.mkOption {
        type = lib.types.str;
        default = "pkgs.temurin-bin-8";
      };
      java.javaCompatibilityCheck = lib.mkOption {
        type = lib.types.bool;
        default = true;
      };
      java.javaWizard = lib.mkOption {
        type = lib.types.bool;
        default = true;
      };
      java.detectJavaVersion = lib.mkOption {
        type = lib.types.bool;
        default = true;
      };
      java.minMemoryUsage = lib.mkOption {
        type = lib.types.int;
        default = 256;
      };
      java.maxMemoryUsage = lib.mkOption {
        type = lib.types.int;
        default = 4096;
      };
      java.permGenSize = lib.mkOption {
        type = lib.types.int;
        default = 128;
      };
      java.lowMemoryWarning = lib.mkOption {
        type = lib.types.bool;
        default = true;
      };

    };
    instances = lib.mkOption {
      type = lib.types.attrsOf (
        lib.types.submodule (
          { name, ... }: {
            options = {
              settings = lib.mkOption {
                type = lib.types.submodule {
                  options = {
                    general = lib.mkOption {
                      type = lib.types.submodule {
                        options = {
                          version = lib.mkOption {
                            type = lib.types.str;
                            description = "Minecraft version for this instance.";
                          };
                          name = lib.mkOption {
                            type = lib.types.str;
                            description = "Display name of the instance.";
                          };
                        };
                      };
                    };

                    window = lib.mkOption {
                      type = lib.types.submodule {
                        options = {
                          maximize = lib.mkOption {
                            type = lib.types.bool;
                            default = false;
                          };
                          windowHeight = lib.mkOption {
                            type = lib.types.int;
                            default = 480;
                          };
                          windowWidth = lib.mkOption {
                            type = lib.types.int;
                            default = 854;
                          };
                        };
                      };
                    };

                    console = lib.mkOption {
                      type = lib.types.submodule {
                        options = {
                          showConsole = lib.mkOption {
                            type = lib.types.bool;
                            default = false;
                          };
                          errorConsole = lib.mkOption {
                            type = lib.types.bool;
                            default = true;
                          };
                        };
                      };
                    };

                    gameTime = lib.mkOption {
                      type = lib.types.submodule {
                        options = {
                          showGameTime = lib.mkOption {
                            type = lib.types.bool;
                            default = true;
                          };
                        };
                      };
                    };

                    java = lib.mkOption {
                      type = lib.types.submodule {
                        options = {
                          executable = lib.mkOption {
                            type = lib.types.str;
                          };
                          javaCompatibilityCheck = lib.mkOption {
                            type = lib.types.bool;
                            default = true;
                          };
                          minMemoryUsage = lib.mkOption {
                            type = lib.types.int;
                            default = 256;
                          };
                          maxMemoryUsage = lib.mkOption {
                            type = lib.types.int;
                            default = 4096;
                          };
                          permGenSize = lib.mkOption {
                            type = lib.types.int;
                            default = 128;
                          };
                          lowMemoryWarning = lib.mkOption {
                            type = lib.types.bool;
                            default = true;
                          };
                        };
                      };
                    };

                    tweaks = lib.mkOption {
                      type = lib.types.submodule {
                        options = {
                          onlineFixes = lib.mkOption {
                            type = lib.types.bool;
                            default = false;
                          };
                          naitiveGLFW = lib.mkOption {
                            type = lib.types.bool;
                            default = true;
                          };
                          naitiveOpenAL = lib.mkOption {
                            type = lib.types.bool;
                            default = true;
                          };
                          feralGamemode = lib.mkOption {
                            type = lib.types.bool;
                            default = true;
                          };
                          mangoHUD = lib.mkOption {
                            type = lib.types.bool;
                            default = false;
                          };
                          discreteGPU = lib.mkOption {
                            type = lib.types.bool;
                            default = false;
                          };
                          zink = lib.mkOption {
                            type = lib.types.bool;
                            default = false;
                          };
                        };
                      };
                    };

                    customCommands = lib.mkOption {
                      type = lib.types.submodule {
                        options = {
                          preLaunch = lib.mkOption {
                            type = lib.types.str;
                            default = "";
                          };
                          wrapper = lib.mkOption {
                            type = lib.types.str;
                            default = "waywall wrap --";
                          };
                          postExit = lib.mkOption {
                            type = lib.types.str;
                            default = "";
                          };
                        };
                      };
                    };
                    environmentVariables = lib.mkOption {
                      type = lib.types.attrsOf lib.types.str;
                      default = { };
                      description = "Environment variables passed to PrismLauncher.";
                    };
                  };
                };
              };
            };
          }
        )
      );
      default = { };
      description = "Declarative PrismLauncher instances.";
    };
  };

  config = lib.mkIf config.programs.MCSR-Prismlauncher.enable {

    # Global config symlink if this breaks fix it urself i dont feel like making another activation script
    home.file."${config.programs.MCSR-Prismlauncher.configFilePath}" = {
      force = true;
      text =
        let
          g = cfg;
        in
        ''
          [General]
          InstSortMode=${g.general.instanceSorting}
          InstRenamingMode=${g.general.instanceRenaming}
          MenuBarInsteadOfToolBar=${lib.boolToString g.general.menuBar}
          InstanceDir=${g.general.instanceDirectory}
          CentralModsDir=${g.general.modsDirectory}
          IconsDir=${g.general.iconsDirectory}
          JavaDir=${g.general.javaDirectory}
          SkinsDir=${g.general.skinsDirectory}
          ModMetadataDisabled=${lib.boolToString (!g.general.modMetadata)}
          ModDependenciesDisabled=${lib.boolToString (!g.general.modDependencyAutoInstall)}
          ShowModIncompat=${lib.boolToString g.general.detectModIncompatibility}
          SkipModpackUpdatePrompt=${lib.boolToString (!g.general.modpackUpdatePrompt)}
          ConsoleMaxLines=${toString g.general.logHistoryLimit}
          NumberOfConcurrentTasks=${toString g.general.concurrentTaskLimit}
          NumberOfConcurrentDownloads=${toString g.general.concurrentDownloadLimit}
          NumberOfManualRetries=${toString g.general.retryLimit}
          RequestTimeout=${toString g.general.HTTPTimeout}
          Language=${g.language.language}
          ApplicationTheme=${g.appearance.theme}
          IconTheme=${g.appearance.icons}
          ConsoleFont=${g.appearance.consoleFont}
          ConsoleFontSize=${toString g.appearance.consoleFontSize}
          BackgroundCat=${g.appearance.backgroundCat}
          CatFit=${g.appearance.catFit}
          CatOpacity=${toString g.appearance.catOpacity}
          LaunchMaximized=${lib.boolToString g.minecraft.general.maximize}
          MinecraftWinHeight=${toString g.minecraft.general.windowHeight}
          MinecraftWinWidth=${toString g.minecraft.general.windowWidth}
          ShowConsole=${lib.boolToString g.minecraft.general.showConsole}
          ShowConsoleOnError=${lib.boolToString g.minecraft.general.errorConsole}
          ShowGameTime=${lib.boolToString g.minecraft.general.showGameTime}
          ShowGameTimeWithoutDays=${lib.boolToString (!g.minecraft.general.showGameTimeDays)}
          ShowGlobalGameTime=${lib.boolToString g.minecraft.general.ShowGlobalGameTime}
          OnlineFixes=${lib.boolToString g.minecraft.tweaks.onlineFixes}
          UseNativeGLFW=${lib.boolToString g.minecraft.tweaks.naitiveGLFW}
          UseNativeOpenAL=${lib.boolToString g.minecraft.tweaks.naitiveOpenAL}
          EnableFeralGamemode=${lib.boolToString g.minecraft.tweaks.feralGamemode}
          EnableMangoHud=${lib.boolToString g.minecraft.tweaks.mangoHUD}
          UseDiscreteGpu=${lib.boolToString g.minecraft.tweaks.discreteGPU}
          UseZink=${lib.boolToString g.minecraft.tweaks.zink}
          PreLaunchCommand=${g.minecraft.customCommands.preLaunch}
          WrapperCommand=${g.minecraft.customCommands.wrapper}
          PostExitCommand=${g.minecraft.customCommands.postExit}
          Env={${
            lib.concatStringsSep "," (
              lib.mapAttrsToList (
                name: value: "\\\"${name}\\\":\\\"${value}\\\""
              ) g.minecraft.environmentVariables
            )
          }}
          JavaPath=${g.java.executable}
          IgnoreJavaCompatibility=${lib.boolToString (!g.java.javaCompatibilityCheck)}
          IgnoreJavaWizard=${lib.boolToString (!g.java.javaWizard)}
          AutomaticJavaSwitch=${lib.boolToString g.java.detectJavaVersion}
          MinMemAlloc=${toString g.java.minMemoryUsage}
          MaxMemAlloc=${toString g.java.maxMemoryUsage}
          PermGen=${toString g.java.permGenSize}
          LowMemWarning=${lib.boolToString g.java.lowMemoryWarning}
        '';
    };

    # Activation script to copy actual instance files (thanks me ow)
    home.activation.setupPrismInstances = lib.hm.dag.entryAfter [ "writeBoundary" ] (
      let
        prismDataPath = "${config.home.homeDirectory}/.local/share/PrismLauncher/${cfg.general.instanceDirectory}";

        copyCommands = lib.mapAttrsToList (
          instName: instCfg:
          let
            I = instCfg.settings;

            instanceCfgStorePath = pkgs.writeText "${instName}-instance.cfg" ''
              [General]
              ConfigVersion=1.3
              InstanceType=OneSix
              iconKey=default
              name=${I.general.name}
              OverrideCommands=true
              OverrideConsole=true
              OverrideEnv=true
              OverrideGameTime=true
              OverrideJavaArgs=true
              OverrideJavaLocation=true
              OverrideLegacySettings=true
              OverrideMemory=true
              OverrideMiscellaneous=true
              OverrideModDownloadLoaders=false
              OverrideNativeWorkarounds=true
              OverridePerformance=true
              LaunchMaximized=${lib.boolToString I.window.maximize}
              MinecraftWinHeight=${toString I.window.windowHeight}
              MinecraftWinWidth=${toString I.window.windowWidth}
              ShowConsole=${lib.boolToString I.console.showConsole}
              ShowConsoleOnError=${lib.boolToString I.console.errorConsole}
              ShowGameTime=${lib.boolToString I.gameTime.showGameTime}
              OnlineFixes=${lib.boolToString I.tweaks.onlineFixes}
              UseNativeGLFW=${lib.boolToString I.tweaks.naitiveGLFW}
              UseNativeOpenAL=${lib.boolToString I.tweaks.naitiveOpenAL}
              EnableFeralGamemode=${lib.boolToString I.tweaks.feralGamemode}
              EnableMangoHud=${lib.boolToString I.tweaks.mangoHUD}
              UseDiscreteGpu=${lib.boolToString I.tweaks.discreteGPU}
              UseZink=${lib.boolToString I.tweaks.zink}
              PreLaunchCommand=${I.customCommands.preLaunch}
              WrapperCommand=${I.customCommands.wrapper}
              PostExitCommand=${I.customCommands.postExit}
              Env={${
                lib.concatStringsSep "," (
                  lib.mapAttrsToList (name: value: "\\\"${name}\\\":\\\"${value}\\\"") I.environmentVariables
                )
              }}
              JavaPath=${I.java.executable}
              IgnoreJavaCompatibility=${lib.boolToString (!I.java.javaCompatibilityCheck)}
              MinMemAlloc=${toString I.java.minMemoryUsage}
              MaxMemAlloc=${toString I.java.maxMemoryUsage}
              PermGen=${toString I.java.permGenSize}
              LowMemWarning=${lib.boolToString I.java.lowMemoryWarning}
            '';

            mmcPackStorePath = pkgs.writeText "${instName}-mmc-pack.json" ''
              {
                "components": [
                  {
                    "important": true,
                    "uid": "net.minecraft",
                    "version": "${instCfg.settings.general.version}"
                  }
                ],
                "formatVersion": 1
              }
            '';

            targetDir = "${prismDataPath}/${instName}";
          in
          ''
            $DRY_RUN_CMD mkdir -p "${targetDir}"

            # Copy ONLY if the files do not exist yet, preventing overrides of Prism's internal edits
            if [ ! -f "${targetDir}/instance.cfg" ]; then
              $DRY_RUN_CMD cp -f "${instanceCfgStorePath}" "${targetDir}/instance.cfg"
              $DRY_RUN_CMD chmod 644 "${targetDir}/instance.cfg"
            fi

            if [ ! -f "${targetDir}/mmc-pack.json" ]; then
              $DRY_RUN_CMD cp -f "${mmcPackStorePath}" "${targetDir}/mmc-pack.json"
              $DRY_RUN_CMD chmod 644 "${targetDir}/mmc-pack.json"
            fi
          ''
        ) config.programs.MCSR-Prismlauncher.instances;
      in
      lib.concatStringsSep "\n" copyCommands
    );
  };
}
