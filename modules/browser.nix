{ inputs, ... }:
{

  programs.firefox = {
    enable = true;
    profiles.default = {
      name = "Default";
    };
  };
}  
