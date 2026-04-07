{
  fetchurl,
  lib,
  stdenvNoCC,
}:
let
  version = "1.0.4";
  system = stdenvNoCC.hostPlatform.system;
  releases = {
    aarch64-darwin = {
      platform = "darwin";
      arch = "arm64";
      hash = "sha256-mqCmPk6E8t84yNoPIhyHigxclp4U9hGFJJ9a5hBUKH4=";
    };
    x86_64-darwin = {
      platform = "darwin";
      arch = "amd64";
      hash = "sha256-odERNA1hh5RMZnconN3gpjj64wjpa65chLoExwIInEs=";
    };
    aarch64-linux = {
      platform = "linux";
      arch = "arm64";
      hash = "sha256-6eS0Z1uCvUL3n4k3ur6Bkaok6gXKIGuLIhgQ3ZmQdes=";
    };
    x86_64-linux = {
      platform = "linux";
      arch = "amd64";
      hash = "sha256-7LdulP+OYvMERkFANzdDLSAmsd7jxELGNX4ziDjd28I=";
    };
  };
  release = releases.${system} or (throw "Unsupported system for lark-cli: ${system}");
  archiveName = "lark-cli-${version}-${release.platform}-${release.arch}.tar.gz";
in
stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "lark-cli";
  inherit version;

  src = fetchurl {
    urls = [
      "https://github.com/larksuite/cli/releases/download/v${version}/${archiveName}"
      "https://registry.npmmirror.com/-/binary/lark-cli/v${version}/${archiveName}"
    ];
    hash = release.hash;
  };

  dontUnpack = true;
  dontConfigure = true;
  dontBuild = true;

  installPhase = ''
    runHook preInstall

    mkdir -p "$out/bin" "$out/share/doc/${finalAttrs.pname}"
    tar -xzf "$src"
    install -Dm755 lark-cli "$out/bin/lark-cli"
    install -Dm644 README.md "$out/share/doc/${finalAttrs.pname}/README.md"
    install -Dm644 CHANGELOG.md "$out/share/doc/${finalAttrs.pname}/CHANGELOG.md"
    install -Dm644 LICENSE "$out/share/doc/${finalAttrs.pname}/LICENSE"

    runHook postInstall
  '';

  meta = {
    description = "Official CLI for the Lark/Feishu open platform";
    homepage = "https://github.com/larksuite/cli";
    changelog = "https://github.com/larksuite/cli/blob/v${version}/CHANGELOG.md";
    license = lib.licenses.mit;
    mainProgram = "lark-cli";
    platforms = builtins.attrNames releases;
    sourceProvenance = with lib.sourceTypes; [ binaryNativeCode ];
  };
})
