{
  environment.extraInit = ''
    # Command Line Tools
    export DYLD_FALLBACK_LIBRARY_PATH="$(xcode-select --print-path)/usr/lib"
    # XCode
    # export DYLD_FALLBACK_LIBRARY_PATH="$(xcode-select --print-path)/Toolchains/XcodeDefault.xctoolchain/usr/lib"
  '';
}
