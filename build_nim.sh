#!/bin/bash
export EMCC_CFLAGS="-fpic"
nim c -d:emscripten -d:release --gc:destructors reverse.nim


