#!/bin/bash
export EMCC_CFLAGS="-fpic"
nim c -d:emscripten -d:release reverse.nim


