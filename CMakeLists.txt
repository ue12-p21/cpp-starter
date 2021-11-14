cmake_minimum_required(VERSION 3.13 FATAL_ERROR)

project(
  matmul
  VERSION 0.1
  LANGUAGES CXX
)

set(BUILD_TESTING ON)
set(BUILD_DOC   ON)
set(USE_SUPERBUILD ON)

include( ${PROJECT_SOURCE_DIR}/cmake/build.cmake)
include( ${PROJECT_SOURCE_DIR}/cmake/compiler.cmake)

include_directories(${PROJECT_SOURCE_DIR}/include )


subdirs(src)


if(${BUILD_TESTING})
  include( ${PROJECT_SOURCE_DIR}/cmake/catch2.cmake )
  subdirs(tests)
endif(${BUILD_TESTING})

if(${BUILD_DOC})
  include( ${PROJECT_SOURCE_DIR}/cmake/doxygen.cmake)
endif(${BUILD_DOC})
