
find_package(Catch2 QUIET)
if (${Catch2_FOUND})       
else ()
    message(STATUS "downloading Catch2")
    include(ExternalProject)
    set( THIRD_PARTY_BUILD_DIR "${PROJECT_SOURCE_DIR}/third_party_build" CACHE PATH "Superbuild build dir")
    set( THIRD_PARTY_INSTALL_DIR "${PROJECT_SOURCE_DIR}/third_party" CACHE PATH "Superbuild install dir")
    
    set( CATCH2_BUILD_PATH "${THIRD_PARTY_BUILD_DIR}/catch2" )
    set( CATCH2_INSTALL_PATH "${THIRD_PARTY_INSTALL_DIR}/catch2" )


    ExternalProject_Add(
            ep_catch2
            PREFIX ${CATCH2_BUILD_PATH}
            GIT_REPOSITORY https://github.com/catchorg/Catch2.git
            GIT_TAG "v2.13.7"
            TIMEOUT 10
            CMAKE_ARGS ${thirdparties_forward_options} -DCMAKE_INSTALL_PREFIX=${CATCH2_INSTALL_PATH}
            LOG_DOWNLOAD ON
            LOG_DOWNLOAD  ON
            LOG_UPDATE    ON
            LOG_CONFIGURE ON
            LOG_BUILD     ON
            LOG_INSTALL   ON
    )

    # Expose required variable (CATCH_INCLUDE_DIR) to parent scope
    #ExternalProject_Get_Property(catch2 source_dir)
    #set(CATCH_INCLUDE_DIR ${source_dir}/include CACHE INTERNAL "Path to include folder for Catch2")
    #add_subdirectory(${PROJECT_SOURCE_DIR}/lib/catch2)
    #include_directories(${CATCH_INCLUDE_DIR})
    include_directories(${CATCH2_INSTALL_PATH}/include)
endif ()

include(CTest)
enable_testing()
