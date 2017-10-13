#ifndef GETTING_STARTED_HELLO_H
#define GETTING_STARTED_HELLO_H

#ifdef _WIN32
#  define EXPORT __declspec(dllexport)
#  define IMPORT __declspec(dllimport)
#elif __EMSCRIPTEN__
#   include <emscripten.h>
#   define EXPORT EMSCRIPTEN_KEEPALIVE
#else
#  define EXPORT __attribute__ ((visibility ("default")))
#  define IMPORT __attribute__ ((visibility ("default")))
#endif

extern "C" {

EXPORT int add(int a, int b);

EXPORT int add2(int a, int b);

}
#endif //GETTING_STARTED_HELLO_H
