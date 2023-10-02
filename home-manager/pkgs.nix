{pkgs, ...}: {
  # all package from the stable repo here
  home.packages = with pkgs; [
    #i3lock-fancy-rapid
    rofi
    neofetch
    fish
    neovim
    polybar
    fishPlugins.hydro
    tldr
    via
    picom
    betterlockscreen
  ];
}
