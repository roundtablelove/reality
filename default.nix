{ stdenv, ghc, lean4 }:

stdenv.mkDerivation {
  pname = "reality-hs";
  # reality has no version, but the tooling demands it
  version = "1";
  src = ./.;
  dontUnpack = true;
  dontConfigure = true;
  dontBuild = true;
  doCheck = true;
  nativeCheckInputs = [ ghc lean4 ];
  checkPhase = ''
    set -eu -o pipefail

    export HOME=$(mktemp -d)

    echo "*** LEAN PROOF ***"
    wrk=./lean-work
    cp -r $src/tests/lean $wrk
    chmod -R u+w $wrk
    pushd $wrk
    lake build --verbose
    popd

    echo "*** HASKELL TEST ***"
    cp $src/Reality.hs .
    cp $src/tests/Test.hs .
    ghc --make -o reality-test Test.hs
    ./reality-test
  '';
  installPhase = ''
    mkdir -p $out
    cp ${./Reality.hs} $out/Reality.hs
  '';
}
