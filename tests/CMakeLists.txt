

add_library(catch_main STATIC catch_main.cpp)
add_dependencies(catch_main ep_catch2)

add_executable(test_matrix test_matrix.cpp)
add_dependencies(catch_main ep_catch2)

target_link_libraries(test_matrix catch_main ${PROJECT_NAME}_core)
add_test(NAME run_test_matrix COMMAND ./test_matrix)
