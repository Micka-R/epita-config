{ pkgs, ... }:
{
  programs.fish = {
    enable = true;

    shellAliases = {
      ll = "ls -a -l";
      la = "ls -a";
      ".." = "cd ..";
      c = "clear";
      vim = "nvim";
      pkgs = "nvim ~/afs/epita-config/home-manager/pkgs.nix";
      hs = "home-manager switch";
      rompiche = "while true; do i3lock && sleep 2700 && pkill i3lock; done";
    };

    plugins = [
      {
        name = "theme-lambda";
        src = pkgs.fetchFromGitHub {
          owner = "hasanozgan";
          repo = "theme-lambda";
          rev = "9cf5825c31a1d09d37d87e681ac2fa1d771ef6d2";
          sha256 = "1aq8r27n4ifickg7my039k618d7dllknyi4g7x742hcy19zr1336";
        };
      }
    ];

    functions = { "fish_greeting" = builtins.readFile ./fish_greeting.fish; };
  };
}
