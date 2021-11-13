
#include "core/computer.hpp"
#include "core/matrix.hpp"

namespace matmul{

std::vector<double> matmul(int matrix_size, const std::vector<double>& a, const std::vector<double>& b){
    auto ret = generateEmptyMatrix(matrix_size);
    for( int i = 0; i<matrix_size; i++){
        for( int j=0; j<matrix_size; j++){
            ret[i*matrix_size+j] = 0;
            for( int k=0; k<matrix_size; k++){
                ret[i*matrix_size+j] = a[i*matrix_size+k]*b[k*matrix_size+j];
            }
        }
    }
    return ret;
}


}