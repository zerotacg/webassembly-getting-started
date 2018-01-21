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

ENV EMSCRIPTEN_VERSION=1.37.28 \
    CLANG_VERSION=e1.37.28_64bit \
    NODE_VERSION=8.9.1_64bit

ENV PATH=${PATH}:/webassembly/emsdk:/webassembly/emsdk/clang/${CLANG_VERSION}:/webassembly/emsdk/node/${NODE_VERSION}/bin:/webassembly/emsdk/emscripten/${EMSCRIPTEN_VERSION} \
    EMSDK=/webassembly/emsdk \
    EM_CONFIG=/root/.emscripten \
    BINARYEN_ROOT=/webassembly/emsdk/clang/${CLANG_VERSION}/binaryen \
    EMSCRIPTEN=/webassembly/emsdk/emscripten/${EMSCRIPTEN_VERSION} \
    CC=emcc \
    CXX=em++ \
    CFLAGS="${CFLAGS} -s WASM=1" \
    CXXFLAGS="${CXXFLAGS} -s WASM=1"

RUN emcc --version

WORKDIR /webassembly/code