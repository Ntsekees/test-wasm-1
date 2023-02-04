if defined(emscripten):
  # This path will only run if -d:emscripten is passed to nim.

  --nimcache:tmp # Store intermediate files close by in the ./tmp dir.

  --os:linux # Emscripten pretends to be linux.
  --cpu:wasm32 # Emscripten is 32bits.
  --cc:clang # Emscripten is very close to clang, so we ill replace it.
  when defined(windows):
    --clang.exe:emcc.bat  # Replace C
    --clang.linkerexe:emcc.bat # Replace C linker
    --clang.cpp.exe:emcc.bat # Replace C++
    --clang.cpp.linkerexe:emcc.bat # Replace C++ linker.
  else:
    --clang.exe:emcc  # Replace C
    --clang.linkerexe:emcc # Replace C linker
    --clang.cpp.exe:emcc # Replace C++
    --clang.cpp.linkerexe:emcc # Replace C++ linker.
  when compileOption("threads"):
    # We can have a pool size to populate and be available on page run
    # --passL:"-sPTHREAD_POOL_SIZE=2"
    discard
  --listCmd # List what commands we are running so that we can debug them.

  --gc:arc # GC:arc is friendlier with crazy platforms.
  --exceptions:goto # Goto exceptions are friendlier with crazy platforms.
  --define:noSignalHandler # Emscripten doesn't support signal handlers.
  --define:danger
  --panics:on

  # Pass this to Emscripten linker to generate html file scaffold for us.
  
  #switch("passL", "-sMAIN_MODULE")
  switch("passL", "-Oz")
  switch("passL", "-fPIC")
  #switch("passL", "-Wl,--export-all")
  switch("passL", "-sSTANDALONE_WASM")
  switch("passL", "-s EXPORTED_FUNCTIONS=_wa_reverse,_js_log,_wa_input_size,_wa_input,_wa_output")
  switch("passL", "-Wl,--no-entry")
  switch("passL", "-sERROR_ON_UNDEFINED_SYMBOLS=0")
  switch("passL", "-Wl,--allow-undefined")
  switch("noMain", "on")
  switch("passL", "-DNDEBUG")
  switch("passL", "-o reverse.wasm")
  

