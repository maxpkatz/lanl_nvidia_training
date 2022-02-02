# CUDA

We will look at a couple of basic CUDA C/C++ examples.

To set up the environment, make sure you have the NVIDIA HPC SDK loaded.

```
# LANL Chicoma
module swap PrgEnv-cray PrgEnv-nvidia
module load cuda
```

## Resources
CUDA Training Series (recorded talks)
https://www.olcf.ornl.gov/cuda-training-series/

## Exercise 1 (Hello World)

Your first task is to create a simple hello world application in CUDA.
The code skeleton is already given to you in `hello.cu`. Edit that file,
paying attention to the FIXME locations, so that the output when run is like this:

```
Hello from block: 0, thread: 0
Hello from block: 0, thread: 1
Hello from block: 1, thread: 0
Hello from block: 1, thread: 1
```

(The ordering of the above lines may vary; ordering differences do not indicate an incorrect result.)

Note the use of `cudaDeviceSynchronize()` after the kernel launch. In CUDA,
kernel launches are *asynchronous* with respect to the host thread. The host
thread will launch a kernel but not wait for it to finish, before proceeding
with the next line of host code. Therefore, to prevent application termination
before the kernel gets to print out its message, we must use this synchronization
function.

After editing the code, compile it using the following:

```
nvcc -o hello hello.cu
```

If you have trouble, you can look at `hello_solution.cu` for a complete example.

After compiling the code, submit the job and make sure the output of the test
passes. Which script you use will depend on the site you're running at.

```
# LANL Chicoma
sbatch submit_hello_lanl.sh
```

Verify using `nsys profile --stats=true` that the kernel actually ran on the GPU.

## Exercise 2 (Vector Addition)

There is a skeleton vector addition code given to you in `vector_add.cu`.
Edit the code to build a complete vector_add program. Compile it and run it
similar to the method given in exercise 1. You can refer to `vector_add_solution.cu` for a complete example.

```
nvcc -o vector_add vector_add.cu
```

Note that this skeleton code includes something we didn't cover in the lecture: CUDA error checking.
Every CUDA runtime API call returns an error code. It's good practice (especially if you're having trouble)
to rigorously check these error codes. A macro is given that will make this job easier. Note the special
error checking method after a kernel call.

This code includes built-in error checking, so a correct result is indicated by the program.

```
# LANL Chicoma
sbatch submit_vector_add_lanl.sh
```

Verify using `nsys profile --stats=true` that the kernel actually ran on the GPU.
