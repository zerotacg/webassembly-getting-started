FROM ubuntu:16.04

RUN apt-get update \
 && apt-get install --yes \
    build-essential \
    clang \
    cmake \
    git \
    python

RUN git clone https://github.com/juj/emsdk.git /webassembly/emsdk \
 && /webassembly/emsdk/emsdk install latest \
 && /webassembly/emsdk/emsdk activate latest

RUN git clone --recursive https://github.com/WebAssembly/wabt /webassembly/wabt \
 && (cd /webassembly/wabt && make && make install)

ENV PATH=${PATH}:/webassembly/emsdk \
    PATH=${PATH}:/webassembly/emsdk/clang/e1.37.21_64bit \
    PATH=${PATH}:/webassembly/emsdk/node/4.1.1_64bit/bin \
    PATH=${PATH}:/webassembly/emsdk/emscripten/1.37.21 \
    EMSDK=/webassembly/emsdk \
    EM_CONFIG=/root/.emscripten \
    BINARYEN_ROOT=/webassembly/emsdk/clang/e1.37.21_64bit/binaryen \
    EMSCRIPTEN=/webassembly/emsdk/emscripten/1.37.21 \
    CC=emcc \
    CXX=em++ \
    CFLAGS="${CFLAGS} -s WASM=1" \
    CXXFLAGS="${CXXFLAGS} -s WASM=1"

RUN emcc --version

WORKDIR /webassembly/code