let pkgs = import <nixos-unstable> { };
in

pkgs.mkShell {
  packages = with pkgs; [ haskell.packages.ghc942.ghc cabal-install zlib xz ];
}