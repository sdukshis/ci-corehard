cmake_minimum_required(VERSION 3.0.0 FATAL_ERROR)

project(hello CXX)

set(SRCS
    src/hello.cpp
)

add_executable(${PROJECT_NAME} ${SRCS})

set_property(TARGET ${PROJECT_NAME} PROPERTY CXX_STANDARD 14)
