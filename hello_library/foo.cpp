#include "foo.h"

Foo::Foo(int foo):
    foo_(foo)
{

}

int Foo::bar(int a) {
    return foo_ + a;
}

void Foo::setFoo(int foo) {
    foo_ = foo;
}

int Foo::getFoo() const {
    return foo_;
}
