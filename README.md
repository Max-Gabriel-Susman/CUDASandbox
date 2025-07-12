# CUDA Sandbox

This repository contains exercises and experiments from my ongoing exploratino of the CUDA platform. It's licensed as Apache 2.0 so have at it.

## Environment

At this point the work here has been done exclusively in Ubuntu 24 on WSL 2 using an NVIDIA RTX 3500 Ada GPU. Looking to containerize and extend some of the solutions to leverage cloud resources as well. Would also like to work with NVIDIA Jetson if I get the chance. 

## Usage

Usage of these solutions is currently pretty straight forward: 

Just compile using the NVCC compiler: 
```
nvcc kernels.cu
```

Then execute the resulting executable: 
```
./a.out
```