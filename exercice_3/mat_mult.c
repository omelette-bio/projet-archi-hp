#define N 3000
#define M 3000
#define P 3000
#include <stdio.h>

float A[N][P], B[P][M], C[N][M];

void mat_mult()
{
    for (int i=0; i< N; i++){
        for (int j=0; j< M; j++){
            for (int k=0; k< P; k++){
                C[i][j] = C[i][j] + A[i][k] * B[k][j];
            }
        }
    }
}

int main()
{
    for ( int i = 0; i < N; i++ )
    {
        for ( int j = 0; j < P; j++ )
        {
            A[i][j] = 1.5f;
        }
    }

    for ( int i = 0; i < P; i++ )
    {
        for ( int j = 0; j < M; j++ )
        {
            B[i][j] = 1.4f;
        }
    }

    mat_mult();

    printf("%f", A[500][500]);
    printf("%f", B[500][500]);
    printf("%f", C[500][500]);
    return 0;
}
