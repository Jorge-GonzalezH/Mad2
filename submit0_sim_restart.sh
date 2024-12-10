#!/bin/bash

#---------------Script SBATCH - NLHPC ----------------
#SBATCH -J Simulaciones_GROMACS
#SBATCH -p general
#SBATCH -n 1
#SBATCH -c 44
#SBATCH --mem-per-cpu=1000
#SBATCH --time=72:00:00
#SBATCH --nodelist=sn009
#SBATCH --mail-user=jfgonzalez5@uc.cl
#SBATCH --mail-type=ALL
#SBATCH -o Simulaciones_GROMACS_%j.out
#SBATCH -e Simulaciones_GROMACS_%j.err

# Cargar el módulo de GROMACS
module load gromacs/4.5.4-zen4-jdem0r4 > /dev/null 2>&1

# Directorios y configuraciones de simulación
declare -a runs=("run_78" "run_80" "run_84" "run_87" "run_90")
mdp_prefix="mdrun_AA_"
tpr_prefix="run_"
topology="dual_Final_O.top"
structure="dualMAD_box.gro"

# Número de núcleos por simulación (ajustar según tus necesidades)
cores_per_sim=8  # CPUs por simulación
parallel_sims=$((44 / cores_per_sim))  # Número máximo de simulaciones en paralelo

# Ejecutar simulaciones en paralelo
for ((i=0; i<${#runs[@]}; i+=parallel_sims)); do
    (
        for ((j=0; j<parallel_sims; j++)); do
            dir=${runs[$((i + j))]}
            [ -z "$dir" ] && continue  # Salir si no hay más directorios
            cd /home/jgonzalezh/Mad2/SBM/AA/$dir

            # Verificar si existe un archivo de checkpoint
            if [ -f state.cpt ]; then
                echo "Reiniciando simulación en $dir desde state.cpt"
                mdrun -s ${tpr_prefix}${dir##*_}.tpr -cpi state.cpt -nt $cores_per_sim -rdd 1.2 -noddcheck > /dev/null 2>&1 &
            else
                echo "Iniciando nueva simulación en $dir"
                grompp -f ${mdp_prefix}${dir##*_}.mdp -c $structure -p $topology -o ${tpr_prefix}${dir##*_}.tpr -maxwarn 5
                mdrun -s ${tpr_prefix}${dir##*_}.tpr -nt $cores_per_sim -rdd 1.2 -noddcheck > /dev/null 2>&1 &
            fi
        done
        wait
    )
done
