#!/bin/bash
#---------------Script SBATCH - NLHPC ----------------
#SBATCH -J remodel
#SBATCH -p general
#SBATCH --nodes=1
#SBATCH --ntasks=44
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=4090
#SBATCH --mail-user=jfgonzalezh@uc.cl
#SBATCH --mail-type=ALL
#SBATCH -o remodel_%j.out
#SBATCH -e remodel_%j.err

#-----------------Toolchain---------------------------
ml purge
ml intel
# ----------------Modulos----------------------------
ml Rosetta/3.10

# ----------------Comando----------------------------
mpiexec -np 44 remodel.mpi.linuxiccrelease \
    -s input.pdb \
    -remodel:blueprint blueprint.txt \
    -remodel:num_poses 1000 \
    -out:path:all closed_out \
    -overwrite
