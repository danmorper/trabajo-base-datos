import os

# Ruta al directorio donde se encuentran los archivos
directorio = '.'  # Reemplaza esto con la ruta adecuada

# Itera sobre los archivos en el directorio
for archivo in os.listdir(directorio):
    # Verifica si el nombre del archivo comienza con "Aspose.Words."
    if archivo.startswith("Aspose.Words."):
        # Crea la ruta completa al archivo
        ruta_completa = os.path.join(directorio, archivo)

        # Verifica si es un archivo (no un directorio) antes de eliminarlo
        if os.path.isfile(ruta_completa):
            try:
                # Borra el archivo
                os.remove(ruta_completa)
                print(f"Archivo eliminado: {ruta_completa}")
            except Exception as e:
                print(f"Error al eliminar {ruta_completa}: {str(e)}")
