# Directives

We will look at an example using directive-based programming (OpenACC and OpenMP).

To set up the environment, make sure you have the NVIDIA HPC SDK loaded.

```
module swap PrgEnv-cray PrgEnv-nvidia 
module load cuda

```

## Exercise 1 (Jacobi Relaxation)

In this exercise, we give you a serial code that implements Jacobi relaxation to
solve the Laplace equation. Your task is to port it to run on a GPU. You may choose
to use either OpenMP or OpenACC to do the offload. You may also choose whether to do
the exercise in C or in Fortran. We recommend using explicit data statements in this
example; however, if you prefer to rely on managed memory, make sure you add the
`-gpu=managed` flag to the compile statements below.

After editing the code, compile it using one of the following:

```
# OpenACC, C
nvc -acc=gpu -Minfo=accel -o laplace laplace.c

# OpenACC, Fortran
nvfortran -acc=gpu -Minfo=accel -o laplace laplace.f90

# OpenMP, C
nvc -mp=gpu -Minfo=mp -o laplace laplace.c

# OpenMP, Fortran
nvfortran -mp=gpu -Minfo=mp -o laplace laplace.f90
```

After compiling the code, submit the job and make sure the output of the test
passes. Which script you use will depend on the site you're running at.

```
# LANL Chicoma
sbatch submit_laplace_lanl.sh

```

Verify using `nsys profile --stats=true` that any kernels you generated
actually ran on the GPU.

You may consult example solutions if you get stuck and need help:

`laplace_acc.c`: OpenACC, C
`laplace_acc.f90`: OpenACC, Fortran
`laplace_omp.c`: OpenMP, C
`laplace_omp.f90`: OpenMP, Fortran
