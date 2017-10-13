set(SOURCE_FILES
    hello.cpp
    hello.h
    foo.cpp
    foo.h
)

add_library(hello SHARED
    ${SOURCE_FILES}
)