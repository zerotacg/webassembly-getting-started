cmake_minimum_required(VERSION 3.5)
project(getting_started)

set(CMAKE_CXX_STANDARD 11)

set(CMAKE_EXECUTABLE_SUFFIX .html)
set(CMAKE_SHARED_LIBRARY_SUFFIX .js)

add_subdirectory(hello_world)
add_subdirectory(hello_library)
