cmake_minimum_required(VERSION 3.5)
project(getting_started)

set(CMAKE_CXX_STANDARD 11)
if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Release)
endif()

set(CMAKE_CXX_FLAGS_RELEASE  "${CMAKE_CXX_FLAGS_RELEASE} -O3")
set(CMAKE_SHARED_LINKER_FLAGS_RELEASE "${CMAKE_SHARED_LINKER_FLAGS_RELEASE} -O3")

set(CMAKE_EXECUTABLE_SUFFIX .html)
set(CMAKE_SHARED_LIBRARY_SUFFIX .html)

add_subdirectory(hello_world)
add_subdirectory(hello_library)
