programs.prismLauncher = {
    enable = true;

    # Pass your custom JDK-override package right here!
    package = pkgs.prismlauncher.override {
      jdks = [ mcsrPkgs.graalvm-21 ];
    };

    settings = {
      General = {
        ApplicationTheme = "dark";
        AutoCloseConsole = false;
        AutomaticJavaDownload = false;
        AutomaticJavaSwitch = true;
        ConsoleFont = "JetBrainsMonoNL Nerd Font";
        ConsoleFontSize = 11;
        Env = "{\"LD_PRELOAD\":\"/nix/store/7830mkmrlim6br3ndl9ldxf48xhycc0p-jemalloc-5.3.1/lib/libjemalloc.so.2\"}";
        MaxMemAlloc = 4096;
        MinMemAlloc = 256;
        WrapperCommand = "waywall wrap --";
      };

      UI = {
        "mods_Page\\ColumnsVisibility" =
          "{\"Image\":true,\"Last Modified\":true,\"Loaders\":false,\"Minecraft Versions\":false,\"Pack Format\":true,\"Provider\":true,\"Release Type\":false,\"Required By\":false,\"Requires\":false,\"Side\":false,\"Size\":false,\"Version\":true}";
      };
    };
  };
}
