#!/bin/bash

#SBATCH -p gpu
#SBATCH -t 5

module load cuda

srun ./vector_add

