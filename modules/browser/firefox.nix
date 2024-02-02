{
  config,
  inputs,
  pkgs,
  home-manager,
  ...
}: {
  programs.firefox = {
    enable = true;
    package = pkgs.firefox-wayland;
    policies = {
      AppAutoUpdate = false;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DisableFirefoxAccounts = true;
      DontCheckDefaultBrowser = true;
      NoDefaultBookmarks = true;
      OfferToSaveLogins = false;
      OfferToSaveLoginsDefault = false;
      PasswordManagerEnabled = false;
      FirefoxHome = {
        Search = true;
        Pocket = false;
        Snippets = false;
        TopSites = false;
        Highlights = false;
      };
      Cookies = {
        Default = true;
        AcceptThirdParty = "always";
        ExpireAtSessionEnd = false;
        RejectTracker = true;
      };
      UserMessaging = {
        ExtensionRecommendations = false;
        SkipOnboarding = true;
        WhatsNew = false;
        FeatureRecomendations = false;
        UrlbarInterventions = false;
        MoreFromMozilla = false;
      };
    };
    profiles = {
      default = {
        id = 0;
        name = "default";
        isDefault = true;
        extensions = with pkgs.nur.repos.rycee.firefox-addons; [
          ublock-origin
          bitwarden
          startpage-private-search
          darkreader
        ];
        search = {
          force = true;
          default = "Startpage";
          engines = {
            "Startpage" = {
              urls = [
                {
                  template = "https://www.startpage.com/do/dsearch?query={searchTerms}";
                }
              ];
              icon = "https://www.startpage.com/sp/cdn/favicons/favicon--default.ico";
              definedAliases = ["@sp"];
            };
            "Nix Packages" = {
              urls = [
                {
                  template = "https://search.nixos.org/packages";
                  params = [
                    {
                      name = "type";
                      value = "packages";
                    }
                    {
                      name = "query";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = ["@np"];
            };
            "NixOS Wiki" = {
              urls = [{template = "https://nixos.wiki/index.php?search={searchTerms}";}];
              iconUpdateURL = "https://nixos.wiki/favicon.png";
              updateInterval = 24 * 60 * 60 * 1000;
              definedAliases = ["@nw"];
            };
          };
        };

        bookmarks = [
          {
            toolbar = true;
            bookmarks = [
              {
                name = "News";
                bookmarks = [
                  {
                    name = "Zeit";
                    url = "https://zeit.de";
                  }
                  {
                    name = "Spiegel";
                    url = "https://spiegel.de";
                  }
                  {
                    name = "SZ";
                    url = "https://sueddeutsche.de";
                  }
                ];
              }
              {
                name = "Tech";
                bookmarks = [
                  {
                    name = "MeinMMO";
                    url = "https://mein-mmo.de";
                  }
                  {
                    name = "Heise";
                    url = "https://heise.de";
                  }
                  {
                    name = "Golem";
                    url = "https://golem.de";
                  }
                  {
                    name = "Computerbase";
                    url = "https://computerbase.de";
                  }
                  {
                    name = "Geizhals";
                    url = "https://geizhals.de";
                  }
                  {
                    name = "BlurBusters";
                    url = "https://blurbusters.com";
                  }
                  {
                    name = "HabeIBeenPwned";
                    url = "https://haveibeenpwned.com";
                  }
                  {
                    name = "Nextcloud";
                    url = "https://nextcloud.webo.hosting";
                  }
                ];
              }
              {
                name = "Streaming";
                bookmarks = [
                  {
                    name = "Prime Video";
                    url = "https://primevideo.com";
                  }
                  {
                    name = "Disney+";
                    url = "https://disneyplus.com";
                  }
                  {
                    name = "Joyn";
                    url = "https://joyn.de";
                  }
                  {
                    name = "ARD";
                    url = "https://ard.de";
                  }
                  {
                    name = "ZDF";
                    url = "https://zdf.de";
                  }
                ];
              }
              {
                name = "Netflix";
                url = "https://netflix.com";
              }
              {
                name = "Twitch";
                url = "https://twitch.tv";
              }
              {
                name = "YouTube";
                url = "https://youtube.com";
              }
              {
                name = "Twitter";
                url = "https://twitter.com";
              }
              {
                name = "ChatGPT";
                url = "https://chat.openai.com";
              }
              {
                name = "Proton";
                bookmarks = [
                  {
                    name = "Proton Calendar";
                    url = "https://calendar.proton.me";
                  }
                  {
                    name = "Proton Pass";
                    url = "https://pass.proton.me";
                  }
                ];
              }
              {
                name = "Proton Mail";
                url = "https://mail.proton.me";
              }
              {
                name = "Proton Drive";
                url = "https://drive.proton.me";
              }
              {
                name = "Banking";
                bookmarks = [
                  {
                    name = "ING DiBa";
                    url = "https://ing.de";
                  }
                  {
                    name = "DKB";
                    url = "https://dkb.de";
                  }
                  {
                    name = "PayPal";
                    url = "https://paypal.com";
                  }
                ];
              }
              {
                name = "Games";
                bookmarks = [
                  {
                    name = "Star Citizen";
                    bookmarks = [
                      {
                        name = "Official Page";
                        url = "https://robertsspaceindustries.com";
                      }
                      {
                        name = "Spectrum";
                        url = "https://robertsspaceindustries.com/spectrum";
                      }
                      {
                        name = "Server Status";
                        url = "https://status.robertsspaceindustries.com";
                      }
                      {
                        name = "StarMap";
                        url = "https://robertsspaceindustries.com/starmap";
                      }
                      {
                        name = "Telemetry";
                        url = "https://robertsspaceindustries.com/telemetry";
                      }
                      {
                        name = "Roadmap";
                        url = "https://robertsspaceindustries.com/roadmap";
                      }
                      {
                        name = "Wiki";
                        url = "https://starcitizen.tools";
                      }
                      {
                        name = "Erkul.Games";
                        url = "https://erkul.games";
                      }
                      {
                        name = "Center Apps";
                        url = "https://starcitizen.center";
                      }
                      {
                        name = "CCU App";
                        url = "https://stardust-citizen.app";
                      }
                      {
                        name = "Cornerstonebase";
                        url = "https://cornerstonebase.space";
                      }
                      {
                        name = "Interdiction Tool";
                        url = "https://snare.das-kartell.ml";
                      }
                    ];
                  }
                  {
                    name = "Path of Exile";
                    bookmarks = [
                      {
                        name = "Official Page";
                        url = "https://pathofexile.com";
                      }
                      {
                        name = "Trade";
                        url = "https://pathofexile.com/trade";
                      }
                      {
                        name = "Leveling";
                        url = "https://poe-leveling.com";
                      }
                    ];
                  }
                  {
                    name = "Rocket League";
                    bookmarks = [
                      {
                        name = "Official Page";
                        url = "https://rocketleague.com";
                      }
                    ];
                  }
                  {
                    name = "Trackmania";
                    bookmarks = [
                      {
                        name = "Official Page";
                        url = "https://trackmania.com";
                      }
                    ];
                  }
                  {
                    name = "Escape from Tarkov";
                    bookmarks = [
                      {
                        name = "Official Page";
                        url = "https://escapefromtarkov.com";
                      }
                    ];
                  }
                ];
              }
              {
                name = "Github";
                url = "https://github.com";
              }
              {
                name = "Nix/OS";
                bookmarks = [
                  {
                    name = "Manual";
                    url = "https://nixos.org/manual/nixos/stable/nixos";
                  }
                  {
                    name = "Wiki";
                    url = "https://nixos.wiki";
                  }
                  {
                    name = "Package Search";
                    url = "https://search.nixos.org/packages";
                  }
                  {
                    name = "Options Search";
                    url = "https://search.nixos.org/options";
                  }
                  {
                    name = "Hound";
                    url = "https://search.nix.gsc.io";
                  }
                  {
                    name = "Noogle";
                    url = "https://noogle.dev";
                  }
                  {
                    name = "HM Option Search";
                    url = "https://mipmip.github.io/home-manager-option-search";
                  }
                  {
                    name = "Snowfall";
                    url = "https://snowfall.org";
                  }
                  {
                    name = "Noogle";
                    url = "https://noogle.dev";
                  }
                ];
              }
              {
                name = "Nix Search";
                url = "https://search.nixos.org";
              }
              {
                name = "Sourcegraph Search";
                url = "https://sourcegraph.com/search";
              }
            ];
          }
        ];
        settings = {
          "general.smoothScroll" = true;

          # performance settings
          "gfx.webrender.all" = true;
          "gfx.webrender.enabled" = true;
          "media.ffmpeg.vaapi.enable" = true;
          "media.ffvpx.enabled" = false;

          # Enable multi-pip
          "media.videocontrols.picture-in-picture.allow-multiple" = true;

          #misc
          "browser.aboutConfig.showWarning" = false;
          "browser.tabs.warnOnClose" = true;
          "widget.use-xdg-desktop-portal" = true;
          "browser.toolbars.bookmarks.visibility" = "always";

          # privacy
          "browser.contentblocking.category" = "strict";
          "network.trr.confirmation_telemetry_enabled" = false;

          "app.shield.optoutstudies.enabled" = false;
          "browser.bookmarks.restore_default_bookmarks" = false;
          "browser.ctrlTab.recentlyUsedOrder" = true;
          "browser.urlbar.suggest.openpage" = false;
          "datareporting.policy.dataSubmissionEnable" = false;
          "datareporting.policy.dataSubmissionPolicyAcceptedVersion" = 2;
          "dom.security.https_only_mode" = true;
          "dom.security.https_only_mode_ever_enabled" = true;
          "extensions.getAddons.showPane" = false;
          "extensions.htmlaboutaddons.recommendations.enabled" = false;
          "extensions.pocket.enabled" = false;
          "identity.fxaccounts.enabled" = false;
          "privacy.trackingprotection.enabled" = true;
          "privacy.trackingprotection.socialtracking.enabled" = true;
          "browser.urlbar.placeholderName" = "Startpage";
          "browser.search.defaultenginename" = "Startpage";
          "browser.startup.homepage" = "https://eu.startpage.com/do/mypage.pl?prfe=1dac62e5595f79947b1cdc2849cc6d26cfc1a64b90d30585411c13b94f8146794ff6196ff1e291fbb48d7ab671ac2e225ba50989b1ef28f0d912c5761bc71423602707ffff1759e9f158126847";
        };
      };
    };
  };
}
