
set( FMT_BUILD_PATH "${THIRD_PARTY_BUILD_DIR}/fmt" )
set( FMT_INSTALL_PATH "${THIRD_PARTY_INSTALL_DIR}/fmt" )


ExternalProject_Add(
  ep_fmt
  PREFIX ${FMT_BUILD_PATH}
  GIT_REPOSITORY https://github.com/fmtlib/fmt.git
  CMAKE_ARGS ${thirdparties_forward_options} -DCMAKE_INSTALL_PREFIX=${FMT_INSTALL_PATH}
  LOG_DOWNLOAD ON
  LOG_DOWNLOAD  ON
  LOG_UPDATE    ON
  LOG_CONFIGURE ON
  LOG_BUILD     ON
  LOG_INSTALL   ON
)


include_directories(${FMT_INSTALL_PATH}/include)

