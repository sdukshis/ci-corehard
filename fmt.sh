#!/bin/bash

find src -name "*.cpp" -print0 | xargs -0 clang-format -i
