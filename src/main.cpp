#include <iostream>
#include <string>

#include "fmt/format.h"

#include "core/computer.hpp"
#include "core/matrix.hpp"



int main(int argc, char** argv) {
  if (argc != 2) {
    std::cerr << "usage : " << argv[0] << " matrix_size" << std::endl;
    return EXIT_FAILURE;
  }

  int matrix_size = std::stoi(argv[1]);

  fmt::print("Compute A*B for matrix {}x{}\n", matrix_size, matrix_size);

  auto matrix_a = matmul::generateRandomMatrix(matrix_size);
  auto matrix_b = matmul::generateRandomMatrix(matrix_size);

  // Compute C = A * B
  auto matrix_c = matmul::matmul(matrix_size, matrix_a, matrix_b);

  return EXIT_SUCCESS;
}