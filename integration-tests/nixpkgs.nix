let
  flake = (import ../flake-compat.nix).defaultNix;
in import flake.inputs.nixpkgs.outPath {
  overlays = [
    flake._evalJobsOverlay
    flake.overlay

    # Pass through original flake inputs
    (final: prev: {
      _inputs = flake.inputs;
    })
  ];
}
