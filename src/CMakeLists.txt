
subdirs(core)

add_executable(${PROJECT_NAME} main.cpp)

target_link_libraries(${PROJECT_NAME} ${PROJECT_NAME}_core)
target_link_libraries(${PROJECT_NAME} ${FMT_INSTALL_PATH}/lib64/libfmt.a)
add_dependencies(${PROJECT_NAME} ep_fmt)