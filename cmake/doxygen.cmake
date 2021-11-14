find_package(Doxygen 1.8.0)
if(DOXYGEN_FOUND)
    # Search for plantUML for creating UML diagrams from doxygen
    find_program(PLANT_UML_PATH plantuml.jar PATH_SUFFIXES PlantUML plantuml Plantuml 
        PATHS /usr/share /usr/local/share/ /usr/local/bin )
    if(NOT PLANT_UML_PATH)
        message(WARNING "PlantUML - not found, UML diagrams will not be generated via doxygen.")
    else()
        message(STATUS "  + PlantUML - found")
    endif()

    #Search for DOT for autogenerated UML diagrams from doxygen
    find_program(DOT_PATH dot PATH_SUFFIXES graphviz2.38/bin graphviz/bin)
    if(NOT DOT_PATH)
        message(WARNING "DOT - not found, UML diagrams will not be generated via doxygen.")
    else()
        message(STATUS "  + Dot - found ")
    endif()

    # configure doxygen configuration file
    set(doxyfile_in ${CMAKE_CURRENT_SOURCE_DIR}/doc/doxygen/Doxyfile.in)
    set(doxyfile ${CMAKE_CURRENT_BINARY_DIR}/Doxyfile)
    configure_file(${doxyfile_in} ${doxyfile} @ONLY)

    # doc build only target, target is not in default build, so it must be
    # triggered explicitly
    add_custom_target(doc ALL
        COMMAND ${DOXYGEN_EXECUTABLE} ${doxyfile}
        WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}
        COMMENT "Generating API documentation with Doxygen"
        VERBATIM)
endif()
