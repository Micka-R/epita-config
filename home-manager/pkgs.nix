{pkgs, ...}: {
  # all package from the stable repo here
  home.packages = with pkgs; [
    #i3lock-fancy-rapid
    plex-mpv-shim
    rofi
    prismlauncher
 #   neofetch
    #fish
#    neovim
    polybar
    fishPlugins.hydro
#    tldr
    via
    picom
    betterlockscreen
    helix
#    vimPlugins.gruvbox
    vimPlugins.coc-clangd
    bat
    jetbrains.clion
#    toilet
#    sqlfluff
  ];
}
