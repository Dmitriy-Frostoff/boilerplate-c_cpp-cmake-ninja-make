add_subdirectory(math_lib)

# setup CXX target @link{helloworld_cpp}
add_executable(helloworld_cpp ./helloworld_cpp.cpp)
target_compile_options(helloworld_cpp PRIVATE -Wall -Wextra -g)

# executable `main`
add_executable(main main.c)

target_link_libraries(main PRIVATE math_utils_lib)
target_compile_options(main PRIVATE -Wall -Wextra -g)
