{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "khassanov";
  home.homeDirectory = "/home/khassanov";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [ 
    # ark # KDE archive manager
    bmon
    gparted
    # libreoffice
    htop
    ncdu # disk usage
    # (eclipses.eclipseWithPlugins {
    #   eclipse = eclipses.eclipse-cpp;
    #   jvmArgs = [ "-Xmx2048m" ];
    #   plugins = with eclipses.plugins;
    #     [ cdt ];
    # })
    # kate
    spotify

    # instant messaging and calls
    element-desktop
    skype
    slack
    zoom-us
    tdesktop
    discord
  ];
  programs = {
    command-not-found.enable = true;
    tmux = {
      enable = true;
      extraConfig = ''
	      source /home/khassanov/Workspace/configuration/dotfiles/.tmux.conf
	    '';
    };
    chromium.enable = true;
    git = {
    	enable = true;
      includes = [{ path = "/home/khassanov/Workspace/configuration/dotfiles/.gitconfig"; }];
    };
    # bash.enable = true;
    zsh = {
      enable = true;
      enableAutosuggestions = true;
      enableCompletion = true;
      oh-my-zsh = {
        enable = true;
        theme = "candy";
        plugins = [ "git" "ssh-agent" ];
        # extra config for plugins
        # extraConfig = ''
        #   zstyle :omz:plugins:ssh-agent identities id_rsa id_ed25519
        # '';
      };
      # extra config for zsh itself
      initExtra = (builtins.readFile /home/khassanov/Workspace/configuration/dotfiles/.zshrc);
    };
    neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
      withPython = true;
      withPython3 = true;
      withRuby = true;
      withNodeJs = true;
      configure.customRC = (builtins.readFile /home/khassanov/Workspace/configuration/dotfiles/.vimrc);
    };
    # eclipse = {
    #   enable = true;
    #   jvmArgs = [ "-Xmx2048m" ];
    #   plugins = with eclipses.plugins; [ cdt ];
    #   # plugins = [ "cdt" ];
    # };
  };
  # xsession.enable = true;
  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
  };

  home.stateVersion = "20.09";
}