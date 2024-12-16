Simulaciones de Dinámica Molecular con GROMACS y Análisis Automatizado

Este repositorio contiene scripts y herramientas diseñadas para configurar, ejecutar y analizar simulaciones de dinámica molecular utilizando GROMACS. El enfoque principal es facilitar el manejo de múltiples temperaturas, organizar los archivos necesarios y automatizar procesos de análisis en cada carpeta de simulación.

Tabla de Contenidos

Características del Repositorio

Estructura del Proyecto

Requisitos Previos

Uso

Visualización de Ejecuciones

Contribuciones

Características del Repositorio

Configuración Automática: Crea carpetas organizadas por temperatura y copia los archivos base necesarios.

Ejecución de Simulaciones: Utiliza scripts adaptados para manejar simulaciones en GROMACS desde la línea de comandos.

Análisis Automatizado: Realiza análisis de energía, RMSD, fluctuaciones estructurales y exporta trayectorias PDB.

Compatibilidad con SLURM: Scripts diseñados para entornos de clúster HPC con soporte para configuraciones personalizadas.

Estructura del Proyecto

├── scripts/
│   ├── configuracion.py  # Configura carpetas y archivos para las temperaturas.
│   ├── simulaciones.py   # Ejecuta simulaciones GROMACS en cada carpeta.
│   └── analisis.py       # Realiza análisis de simulaciones y genera datos procesados.
├── data/
│   ├── mdrun_AA_v5.mdp  # Archivo base de parámetros de simulación.
│   ├── dual_Final_O.top  # Archivo de topología.
│   └── em.gro           # Configuración inicial del sistema.
├── README.md            # Documentación del repositorio.
└── resultados/          # Salida generada automáticamente.

Requisitos Previos

Software Requerido:

GROMACS (versión >= 2021).

Python (versión >= 3.7).

Bibliotecas de Python:

pathlib

os

subprocess

Acceso al Sistema de Clúster: Si se utiliza SLURM, asegúrate de tener los permisos y configuraciones adecuadas.

Uso

Configuración de Simulaciones:
Ejecuta el script de configuración para preparar las carpetas y archivos base para cada temperatura:

python scripts/configuracion.py

Ejecución de Simulaciones:
Lanza las simulaciones en cada carpeta:

python scripts/simulaciones.py

En sistemas SLURM, utiliza:

sbatch scripts/simulaciones.py

Análisis de Resultados:
Procesa los datos generados con:

python scripts/analisis.py

Visualización de Ejecuciones

A continuación, se muestran imágenes representativas del flujo de trabajo:

1. Configuración de Carpetas



2. Simulaciones en Progreso



3. Análisis y Resultados



Contribuciones

Si deseas mejorar este proyecto, ¡eres bienvenido a contribuir! Por favor, sigue los pasos a continuación:

Haz un fork de este repositorio.

Crea una rama para tu característica o corrección:

git checkout -b mi-nueva-caracteristica

Realiza tus cambios y haz commit:

git commit -m "Agrega nueva característica"

Envía un pull request.

Contacto

Para preguntas o sugerencias, por favor abre un issue o contáctame directamente en tu.email@dominio.com.
