cmake_minimum_required(VERSION 3.13 FATAL_ERROR)

project(
  matmul
  VERSION 0.1
  LANGUAGES CXX
)
include(ExternalProject)

set(BUILD_TESTING ON)
set(BUILD_DOC   ON)
set(USE_SUPERBUILD ON)

set( THIRD_PARTY_BUILD_DIR "${PROJECT_SOURCE_DIR}/third_party_build" CACHE PATH "Superbuild build dir")
set( THIRD_PARTY_INSTALL_DIR "${PROJECT_SOURCE_DIR}/third_party" CACHE PATH "Superbuild install dir")
    

include( ${PROJECT_SOURCE_DIR}/cmake/build.cmake)
include( ${PROJECT_SOURCE_DIR}/cmake/compiler.cmake)

include_directories(${PROJECT_SOURCE_DIR}/include )


subdirs(src)

include( ${PROJECT_SOURCE_DIR}/cmake/fmt.cmake )


if(${BUILD_TESTING})
  include( ${PROJECT_SOURCE_DIR}/cmake/catch2.cmake )
  subdirs(tests)
endif(${BUILD_TESTING})

if(${BUILD_DOC})
  include( ${PROJECT_SOURCE_DIR}/cmake/doxygen.cmake)
endif(${BUILD_DOC})
