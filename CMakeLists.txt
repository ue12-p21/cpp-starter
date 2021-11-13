cmake_minimum_required(VERSION 3.13 FATAL_ERROR)

project(
  matmul
  VERSION 0.1
  LANGUAGES CXX
)

set(BUILD_SHARED_LIBS ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_CXX_STANDARD 20)
if(PROJECT_SOURCE_DIR STREQUAL PROJECT_BINARY_DIR)
  message(
    FATAL_ERROR
      "In-source builds not allowed. Please make a new directory (called a build directory) and run CMake from there."
  )
endif()

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/include )

subdirs(src)

