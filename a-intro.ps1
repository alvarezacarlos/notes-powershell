# cmdlet
# powershell ISE

# Saber el numero de comandos en powershell
  #Get-Command -CommandType cmdlet | Measure-Object

# Help: para saber la sintaxis completa de un comando:
  # Get-Help comando

# Help: podemos actualizar el modulo de ayuda:
  # Update-Help -Module Microsoft.PowerShell*

# Help: obtener ejemplos de uso del comando
  # Get-Help comando -Examples

# Help: obtener la informacion detallada de cada argumento del comando
  # Get-Help Get-ChildItem -Full

# Debido a la potencia de power shell debe ser controlado. Seguridad de los scripts.Controles de permisividad.
# Niveles de Permisividad:
  # Restricted  --> no se permite la ejecucion de script. Power Shell solo se utiliza en modo interactivo. es el default mode.
  # AllSigned --> todos los script deben estar autenticados.
  # RemoteSigned  --> solo los remote script deben ser autenticados. (scripts descargados).
  # Unrestricted --> ningun script debe estar autenticado.

# Status de permisividad y cambio
  # Get-ExecutionPolicy --> para saber que politicas tenemos actualment. Code: Get-ExecutionPolicy
  # Set-ExecutionPolicy --> para cambiar la politica. --> Code: Set-ExecutionPolicy RemoteSigned

# Estructura de comandos: verbo guion nombre en singular
  # Get-ExecutionPolicy, Get-Help, Get-ChildItem

  # Operandos y Argumentos
    # Operadores
      # cp
        # este comando es utilizado para mover archivos. y necesita 2 operandos: el origen y el destino al momento de copear el archivo.
        # algunos comandos tendran operandos obligatorios y otro operandos seran opcionales
    # Argumentos
      # Nos permiten modificar el comportamiento por defecto del comando
      # Ejemplo: si queremos copear un archivo recursivamente, es decir que queremos copear los subfolder y y archivos dentro de esos folders
      # cp -R 