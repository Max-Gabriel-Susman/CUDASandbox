#include <stdio.h> 

// a kernel is defined using the __global__ declaration specifier   
__global__ void add(int* a, int* b, int* c) {
    // each thread that executes the kernel is given a unique thread ID, 
    // this thread ID is accessible within the kernel through built-in variables(e.g. threadIdx, blockDim, & blockIdx). 
    int i = threadIdx.x + blockDim.x * blockIdx.x;
    c[i] = a[i] + b[i];
}

__managed__ int vector_a[256], vector_b[256], vector_c[256];

int main() {
    for (int i = 0; i < 256; i++) {
        vector_a[i] = i;

        vector_b[i] = 256 - i; 
    }

    // the number of CUDA threads that execute that kernal for a give kernel call, 
    // is specified using a new <<<...>>> execution configuration syntax 
    // in the execution configuration syntax used below the 'add' kernel is executed 
    // 256 times by 256 different CUDA threads as opposed to only once like a 
    // regular c++ function.
    add<<<1, 256>>>(vector_a, vector_b, vector_c);

    cudaDeviceSynchronize();

    int result_sum = 0; 

    for (int i = 0; i < 256; i++) {
        result_sum += vector_c[i];
    }

    printf("Result: sum = % d", result_sum);
    return 0; 
}