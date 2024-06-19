_: {
  programs.autorandr = {
    enable = true;
    profiles = {
      home = {
        config = {
          "eDP-1" = {
            enable = false;
          };
          "DP-1" = {
            enable = true;
            mode = "3440x1440";
            primary = true;
            rate = "165.00";
            position = "0x0";
          };
          "DP-2" = {
            enable = true;
            mode = "1080x1920";
            primary = false;
            rate = "240.00";
            rotate = "left";
            position = "3440x0";
          };
        };
        fingerprint = {
          "eDP-1" = "00ffffffffffff0006af8b0600000000001d0104a51f117803ee95a3544c99260f5054000000010101010101010101010101010143780b87038244010103e0035ae1000018b82480b87038244010103e0035ae100001800000000000000000000000000000000000000000002000c2dff103cc80a0614c82020202000eb";
          "DP-1" = ""; # FIXME
          "DP-2" = ""; # FIXME
        };
      };
      office = {
        config = {
          eDP-1 = {
            enable = true;
            mode = "1920x1080";
            primary = false;
            rate = "60.00";
            position = "0x0";
          };
          DP-2-2 = {
            enable = true;
            mode = "2560x1440";
            primary = true;
            rate = "69.92";
            position = "1920x0";
          };
          DP-2-3 = {
            enable = true;
            mode = "2560x1440";
            primary = false;
            rate = "69.92";
            position = "4480x0";
          };
        };
        fingerprint = {
          "eDP-1" = "00ffffffffffff0006af8b0600000000001d0104a51f117803ee95a3544c99260f5054000000010101010101010101010101010143780b87038244010103e0035ae1000018b82480b87038244010103e0035ae100001800000000000000000000000000000000000000000002000c2dff103cc80a0614c82020202000eb";
          "DP-2-2" = "00ffffffffffff0026cd3766a3090000211e0104b53c2278fb0c95ab554ca0240d50542108009500a9c0a940b300d1c0d1cae1008180565e00a0a0a029503020350055502100001a000000ff0031313532313033333032343637000000fd00304678781e010a2020202020000000fc00504c32373932510a20202020200115";
          "DP-2-3" = "00ffffffffffff0026cd376660080000211e0104b53c2278fb0c95ab554ca0240d50542108009500a9c0a940b300d1c0d1cae1008180565e00a0a0a029503020350055502100001a000000ff0031313532313033333032313434000000fd00304678781e010a2020202020000000fc00504c32373932510a20202020200161";
        };
      };
    };
  };
}
