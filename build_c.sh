#!/bin/bash
emcc -Os -s STANDALONE_WASM -s EXPORTED_FUNCTIONS="['_reverse']" -Wl,--no-entry "reverse.c" -o "reverse.wasm"
 
