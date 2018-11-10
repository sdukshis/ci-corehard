cmake_minimum_required(VERSION 3.0.0 FATAL_ERROR)

project(hello C CXX)

# Download automatically, you can also just copy the conan.cmake file
if(NOT EXISTS "${CMAKE_BINARY_DIR}/conan.cmake")
    message(STATUS "Downloading conan.cmake from https://github.com/conan-io/cmake-conan")
    file(DOWNLOAD "https://raw.githubusercontent.com/conan-io/cmake-conan/v0.12/conan.cmake"
                "${CMAKE_BINARY_DIR}/conan.cmake")
endif()

include(${CMAKE_BINARY_DIR}/conan.cmake)

conan_cmake_run(CONANFILE conanfile.py
                BASIC_SETUP CMAKE_TARGETS
                BUILD missing)

set(LIB_SRCS
    src/hello.cpp
)

add_library(${PROJECT_NAME} ${LIB_SRCS})

set_property(TARGET ${PROJECT_NAME} PROPERTY CXX_STANDARD 14)

target_include_directories(${PROJECT_NAME} PUBLIC ${CMAKE_SOURCE_DIR} include)

set(SAMPLE_SRC
    src/main.cpp
)

add_executable(${PROJECT_NAME}_example ${SAMPLE_SRC})

target_link_libraries(${PROJECT_NAME}_example
    ${PROJECT_NAME}
)


set(TEST_SRCS
    tests/test_hello.cpp
)

add_executable(test_${PROJECT_NAME} ${TEST_SRCS})

target_link_libraries(test_${PROJECT_NAME}
    ${PROJECT_NAME}
    CONAN_PKG::gtest
)

enable_testing()

add_test(NAME gtest
         COMMAND $<TARGET_FILE:test_${PROJECT_NAME}>)
