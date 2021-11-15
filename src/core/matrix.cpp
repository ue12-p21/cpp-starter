#include <random>

#include "core/matrix.hpp"


namespace matmul{
    //! \brief generate an empty matrix 
    //! \param matrix_size : the matrix size 
    //! \return a std::vector<double> of size matrix_size^2
    std::vector<double> generateEmptyMatrix(int matrix_size){
        return std::vector<double>(matrix_size*matrix_size);
    }

    //! \brief generate a random value matrix 
    //! \param matrix_size : the matrix size 
    //! \return a std::vector<double> of size matrix_size^2
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