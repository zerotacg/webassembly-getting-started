#include "hello.h"
#include "foo.h"


int add(int a, int b) {
    return a + b;
}

int add2(int a, int b) {
    Foo foo(a);

    return foo.bar(b);
}