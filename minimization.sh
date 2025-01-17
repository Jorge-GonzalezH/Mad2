#%%writefile minimization.sh   to google colab
#!/bin/bash
source /content/gromacs_sbm/bin/GMXRC
# Nombre del archivo dualMAD.gro o dualMAD2.gro
# Nombre del archivo de topologia dual_Final.top

# Definir la caja de simulación con una distancia de 1.5 nm y forma octaédrica
gmx editconf -f dualMAD_open.gro -o dualMAD_new_box.gro -c -d 1.0 -bt cubic

# Verificar si editconf fue exitoso
if [ $? -ne 0 ]; then
    echo "Error en editconf."
    exit 1
fi

#######MINIMIZACION#####
# # Generar el primer archivo .tpr
gmx grompp -f em.mdp -c dualMAD_new_box.gro -p dual_FinalT_aligned.top -o em.tpr -maxwarn 1

# Verificar si grompp para minimización fue exitoso
if [ $? -ne 0 ]; then
    echo "Error en grompp para minimización."
    exit 1
fi

# Crear el archivo de índice para seleccionar átomos de proteína
gmx make_ndx -f dualMAD_new_box.gro -o index.ndx

if [ $? -ne 0 ]; then
    echo "Error en make_ndx."
    exit 1
fi

# Usar trjconv para obtener un .gro cetrado en index
gmx trjconv -s em.tpr -f dualMAD_new_box.gro -o dualMAD_centered.gro -center -pbc mol -ur compact -n index.ndx

#######MINIMIZACION#####
# # Generar el archivo .tpr para la minimización con el gro centrado
gmx grompp -f em.mdp -c dualMAD_centered.gro -p dual_FinalT_aligned.top -o em.tpr -maxwarn 1

# Verificar si trjconv para obtener un .gro cetrado en index fue exitoso
if [ $? -ne 0 ]; then
    echo "Error en trjconv para obtener un .gro cetrado en index."
    exit 1
fi

# Ejecutar la minimización de energía (modo CPU)

gmx mdrun -v -deffnm em -nt 2

# Verificar si mdrun fue exitoso
if [ $? -ne 0 ]; then
    echo "Error en mdrun."
    exit 1
fi

# Revisar el resultado de la minimización
gmx energy -f em.edr -o em_potential.xvg <<EOF
10
EOF

# Usar trjconv para extraer solo átomos de la proteína y eliminar solvente e iones
gmx trjconv -s em.tpr -f em.trr -o em_protein_only.pdb -pbc mol -center -n index.ndx


# Imprimir el contenido de em_potential.xvg
echo "Contenido de em_potential.xvg:"
cat em_potential.xvg

echo "Minimización completada. Revisa el archivo em_potential.xvg para ver la energía potencial y em_protein_only.pdb para la estructura sin solvente e iones."
