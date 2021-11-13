#include <random>

#include "core/matrix.hpp"


namespace matmul{
    std::vector<double> generateEmptyMatrix(int matrix_size){
        return std::vector<double>(matrix_size*matrix_size);
    }

    std::vector<double> generateRandomMatrix(int matrix_size){
        std::vector<double> ret(matrix_size*matrix_size);
        std::mt19937_64 rnd;
        std::uniform_real_distribution<double> gen(0, 1);
        for( auto& x: ret){
            x = gen(rnd);
        }
        return ret;
    }
}