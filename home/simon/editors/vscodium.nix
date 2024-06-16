{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    enableUpdateCheck = false;
    enableExtensionUpdateCheck = false;
    mutableExtensionsDir = false;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      editorconfig.editorconfig
      pkief.material-icon-theme
      bbenoist.nix
      jnoortheen.nix-ide
      redhat.vscode-yaml
      yzhang.markdown-all-in-one
      #kamadorueda.alejandra
      editorconfig.editorconfig
      mkhl.direnv
      eamodio.gitlens
      christian-kohler.path-intellisense
    ];
    userSettings = {
      "update.mode" = "none";
      "files.autoSave" = "afterDelay";
      "files.insertFinalNewline" = true;
      "files.trimFinalNewlines" = true;
      "files.trimTrailingWhitespace" = true;
      "workbench.iconTheme" = "material-icon-theme";
      "workbench.startupEditor" = "none";
      "redhat.telemetry.enabled" = false;
      "git.enableSmartCommit" = true;
      "git.confirmSync" = false;
      "terminal.integrated.fontFamily" = "JetBrains Mono";
      "editor.fontFamily" = "'JetBrains Mono'";
      "editor.fontSize" = 15;
      "editor.fontLigatures" = true;
      "editor.fontVariations" = false;
      "editor.formatOnSave" = true;
      "github.gitProtocol" = "ssh";
      "git.alwaysShowStagedChangesResourceGroup" = true;
      "git.branchRandomName.dictionary" = [
        "colors"
      ];
      "git.branchSortOrder" = "alphabetically";
      "git.defaultCloneDirectory" = "$HOME/code";
      "editor.tabSize" = 2;
      "git.rebaseWhenSync" = true;
      "direnv.restart.automatic" = true;
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "${pkgs.nixd}/bin/nixd";
      "nix.formatterPath" = "${pkgs.nixfmt-rfc-style}/bin/nixfmt";
      "nix.serverSettings" = {
        nixd = {
          formatting.command = [ "${pkgs.nixfmt-rfc-style}/bin/nixfmt" ];
        };
      };
    };
  };
}
