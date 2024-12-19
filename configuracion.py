import os
import shutil
from pathlib import Path
import time

# Archivos base
base_mdp = "mdrun_AA_v5.mdp"
top_file = "dual_Final_O.top"
gro_file = "dualMAD_box.gro"
indice = "index.ndx"

# Verifica que los archivos base existan
for required_file in [base_mdp, top_file, gro_file]:
    if not os.path.exists(required_file):
        raise FileNotFoundError(f"El archivo requerido '{required_file}' no se encontró en el directorio actual.")

# Define las temperaturas
temps = [78.0, 80.0, 84.0, 87.0, 90.0, 92.0, 96.0, 98.0, 100.0, 102.0, 105.0, 108.0, 110.0, 112.0, 116.0]
 
# Directorio principal para las simulaciones
base_dir = Path.cwd()

# Itera sobre las temperaturas y configura las simulaciones
for temp in temps:
    start_time = time.time()  # Medir tiempo de ejecución por temperatura
    temp_dir = base_dir / f"run_{int(temp)}"
    temp_dir.mkdir(exist_ok=True)

    # Modifica el archivo .mdp para la temperatura específica
    with open(base_mdp, "r") as file:
        lines = file.readlines()

    for idx, line in enumerate(lines):
        if line.startswith("ref_t"):
            lines[idx] = f"ref_t                    = {temp} ; Reference temperature\n"
        elif line.startswith("gen_temp"):
            lines[idx] = f"gen_temp                 = {temp} ; Initial velocity temperature\n"

    modified_mdp = temp_dir / f"mdrun_AA_{int(temp)}.mdp"
    with open(modified_mdp, "w") as file:
        file.writelines(lines)

    # Copia los archivos de topología y estructura
    for file_to_copy in [top_file, gro_file, indice]:
        target_file = temp_dir / Path(file_to_copy).name
        try:
            os.link(file_to_copy, target_file)
        except OSError:
            shutil.copy(file_to_copy, target_file)

    elapsed_time = time.time() - start_time
    print(f"Configuración completada para T={temp} K en {temp_dir} (Tiempo: {elapsed_time:.2f} segundos)")

print("Preparación completada.")
