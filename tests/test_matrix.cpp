#include <catch2/catch.hpp>
#include "core/matrix.hpp"

TEST_CASE( "initialize matrix", "[matrix]"){
    const int matrix_size {10};
    auto matrix_a = matmul::generateRandomMatrix(matrix_size);

    REQUIRE( matrix_a.size() == matrix_size*matrix_size );

    auto matrix_c = matmul::generateEmptyMatrix(matrix_size);

    REQUIRE( matrix_c.size() == matrix_size*matrix_size);
    double s = 0;
    for( auto x: matrix_c){
        s += x;
    }
    REQUIRE( s == 0 );

}
