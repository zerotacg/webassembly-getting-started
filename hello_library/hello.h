#ifndef GETTING_STARTED_HELLO_H
#define GETTING_STARTED_HELLO_H

#ifdef _WIN32
#  define EXPORT __declspec(dllexport)
#  define IMPORT __declspec(dllimport)
#else
#  define EXPORT __attribute__ ((visibility ("default")))
#  define IMPORT __attribute__ ((visibility ("default")))
#endif

EXPORT int hello();

#endif //GETTING_STARTED_HELLO_H
