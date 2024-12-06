#!/bin/bash

# Script para ejecutar las simulaciones en los directorios de 100 a 116
#---------------Script SBATCH - NLHPC ----------------
#SBATCH -J Simulaciones_GROMACS
#SBATCH -p general
#SBATCH -n 1
#SBATCH -c 8
#SBATCH --mem-per-cpu=1000
#SBATCH --mail-user=jfgonzalez5@usm.cl
#SBATCH --mail-type=ALL
#SBATCH -o Simulaciones_GROMACS_%j.out
#SBATCH -e Simulaciones_GROMACS_%j.err


# Cargar el módulo de GROMACS
module load gromacs/4.5.4-zen4-jdem0r4 > /dev/null 2>&1

# Ejecutar las simulaciones para cada temperatura explícitamente

# Nodo mn024 - Trabajo con 8 núcleos
cd /home/jgonzalezh/Mad2/SBM/AA/run_100
grompp -f mdrun_AA_100.mdp -c dualMAD_box.gro -p dual_Final_O.top -o run_100.tpr -maxwarn 5 && mdrun -s run_100.tpr -nt 8 -rdd 1.2 -noddcheck > /dev/null 2>&1

# Nodo mn024 - Trabajo con 8 núcleos
cd /home/jgonzalezh/Mad2/SBM/AA/run_102
grompp -f mdrun_AA_102.mdp -c dualMAD_box.gro -p dual_Final_O.top -o run_102.tpr -maxwarn 5 && mdrun -s run_102.tpr -nt 8 -rdd 1.2 -noddcheck > /dev/null 2>&1

# Nodo mn024 - Trabajo con 8 núcleos
cd /home/jgonzalezh/Mad2/SBM/AA/run_105
grompp -f mdrun_AA_105.mdp -c dualMAD_box.gro -p dual_Final_O.top -o run_105.tpr -maxwarn 5 && mdrun -s run_105.tpr -nt 8 -rdd 1.2 -noddcheck > /dev/null 2>&1

# Nodo mn024 - Trabajo con 8 núcleos
cd /home/jgonzalezh/Mad2/SBM/AA/run_108
grompp -f mdrun_AA_108.mdp -c dualMAD_box.gro -p dual_Final_O.top -o run_108.tpr -maxwarn 5 && mdrun -s run_108.tpr -nt 8 -rdd 1.2 -noddcheck > /dev/null 2>&1

# Nodo mn024 - Trabajo con 8 núcleos
cd /home/jgonzalezh/Mad2/SBM/AA/run_110
grompp -f mdrun_AA_108.mdp -c dualMAD_box.gro -p dual_Final_O.top -o run_110.tpr -maxwarn 5 && mdrun -s run_110.tpr -nt 8 -rdd 1.2 -noddcheck > /dev/null 2>&1

# Nodo mn024 - Trabajo con 4 núcleos
cd /home/jgonzalezh/Mad2/SBM/AA/run_116
grompp -f mdrun_AA_116.mdp -c dualMAD_box.gro -p dual_Final_O.top -o run_116.tpr -maxwarn 5 && mdrun -s run_116.tpr -nt 4 -rdd 1.2 -noddcheck > /dev/null 2>&1
