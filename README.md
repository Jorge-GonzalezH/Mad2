
# Simulaciones de Dinámica Molecular con GROMACS y Análisis Automatizado

Este repositorio contiene scripts y herramientas diseñadas para configurar, ejecutar y analizar simulaciones de dinámica molecular utilizando GROMACS. El enfoque principal es facilitar el manejo de múltiples temperaturas, organizar los archivos necesarios y automatizar procesos de análisis en cada carpeta de simulación.

---

## Tabla de Contenidos

1. [Características del Repositorio](#caracteristicas-del-repositorio)
2. [Estructura del Proyecto](#estructura-del-proyecto)
3. [Requisitos Previos](#requisitos-previos)
4. [Uso](#uso)
5. [Visualización de Ejecuciones](#visualizacion-de-ejecuciones)
6. [Contribuciones](#contribuciones)

---

## Características del Repositorio

- **Configuración Automática:** Crea carpetas organizadas por temperatura y copia los archivos base necesarios.
- **Ejecución de Simulaciones:** Utiliza scripts adaptados para manejar simulaciones en GROMACS desde la línea de comandos.
- **Análisis Automatizado:** Realiza análisis de energía, RMSD, fluctuaciones estructurales y exporta trayectorias PDB.
- **Compatibilidad con SLURM:** Scripts diseñados para entornos de clúster HPC con soporte para configuraciones personalizadas.

---

## Estructura del Proyecto

```
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
```

---

## Requisitos Previos

1. **Software Requerido:**
   - GROMACS (versión >= 4.5 o 5.0).
   - Python (versión >= 3.7).
2. **Bibliotecas de Python:**
   - pathlib
   - os
   - subprocess

3. **Acceso al Sistema de Clúster:** Si se utiliza SLURM, asegúrate de tener los permisos y configuraciones adecuadas.

---

## Uso

1. **Configuración de Simulaciones:**
   Ejecuta el script de configuración para preparar las carpetas y archivos base para cada temperatura:

   ```bash
   python scripts/configuracion.py
   ```

2. **Ejecución de Simulaciones:**
   Lanza las simulaciones en cada carpeta:

   ```bash
   python scripts/simulaciones.py
   ```

   En sistemas SLURM, utiliza:

   ```bash
   sbatch scripts/simulaciones.py
   ```

3. **Análisis de Resultados:**
   Procesa los datos generados con:

   ```bash
   python scripts/analisis.py
   ```

---

## Visualización de Ejecuciones

A continuación, se muestran imágenes representativas del flujo de trabajo:

### 1. Configuración de Carpetas
#![](https://via.placeholder.com/800x400.png?text=Estructura+de+Carpetas+por+Temperatura)

### 2. Simulaciones en Progreso
#![](https://via.placeholder.com/800x400.png?text=Ejecuci%C3%B3n+de+Simulaciones+en+GROMACS)

### 3. Análisis y Resultados
#![](https://via.placeholder.com/800x400.png?text=An%C3%A1lisis+Automatizado+de+Trayectorias)

---

## Contribuciones

Si deseas mejorar este proyecto, ¡eres bienvenido a contribuir! Por favor, sigue los pasos a continuación:

1. Haz un fork de este repositorio.
2. Crea una rama para tu característica o corrección:

   ```bash
   git checkout -b mi-nueva-caracteristica
   ```

3. Realiza tus cambios y haz commit:

   ```bash
   git commit -m "Agrega nueva característica"
   ```

4. Envía un pull request.

---

### Contacto
Para preguntas o sugerencias, por favor abre un issue o contáctame directamente en [tu.email@dominio.com](mailto:simulacra.simulacion@gmail.com).
