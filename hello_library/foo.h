#ifndef GETTING_STARTED_FOO_H
#define GETTING_STARTED_FOO_H

#include "hello.h"

class EXPORT Foo {
public:
    EXPORT explicit Foo(int foo);

    EXPORT int bar(int a);

    EXPORT void setFoo(int foo);

    EXPORT int getFoo() const;

private:
    int foo_;
};

#endif //GETTING_STARTED_FOO_H
