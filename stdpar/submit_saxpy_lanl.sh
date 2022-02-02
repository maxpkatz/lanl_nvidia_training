#!/bin/bash
#SBATCH -p gpu
#SBATCH -t 5

module load cuda

srun ./saxpy_gpu
