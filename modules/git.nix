{ config, pkgs, ... }:
let
  email = "117449098+simonoscr@users.noreply.github.com";
  name = "simonoscr";
in {
  programs.git = {
    enable = true;
    extraConfig = {
      color.ui = true;
      core.editor = "nvim";
      credential.helper = "store";
      github.user = name;
      push.autoSetupRemote = true;
      diff.colorMoved = "default";
    };
    userEmail = email;
    userName = name;

    aliases = {
      ad = "add";
      br = "branch";
      co = "commit";
      ca = "commit --amend";
      cm = "commit -m";
      checko = "checkout";
      d = "diff";
      ds = "diff --staged";
      p = "push";
      pf = "push --force-with-lease";
      pl = "pull";
      l = "log";
      r = "rebase";
      ss = "status --short";
      st = "status";
      forgor = "commit --amend --no-edit";
      graph = "log --all --decorate --graph --oneline";
      oops = "checkout --";
      fe = "fetch";
      sw = "switch";
    };

    ignores = [".DS_Store" "*.swp" "Thumbs.db" ".idea/" ".vscode/" ".vscodium/"];

    signing = {
      key = "${config.home.homeDirectory}/.ssh/id_ed25519";
      signByDefault = true;
    };

    extraConfig.gpg.format = "ssh";

  };
  home.activationScripts.setGitHubCredentials = {
    text = ''
      # Decrypt the PAT
      PAT=$(sops -d ${config.home.homeDirectory}/github_pat.txt)

      # Configure Git to use this PAT
      git config --global credential.helper "!f() { echo username=your-username; echo password=$PAT; }; f"
    '';
    deps = [ "git" ];
  };
}
