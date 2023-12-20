$array_vacio = @()
$enteros = @(1,2,3,4,5)
$enteros = 1,2,3,4,5, 9
$consecutivos = 1..10
$caracteres = "a","b","c","d","e"
$multi_tipo = @(1,2,3,'a','b')

Write-Host $enteros.

# Accediendo a los elementos de un array
$array_vacio = @()
$enteros = @(1,2,3,4,5)
$enteros[0]
$enteros[2]
$enteros[5]
$enteros[-1]


# metodos
# Length
$array_nuevo = @(1)
$array_nuevo.Length

# Adding elements to an array
# En PowerShell los arrays son elementos estáticos. PowerShell no añade elementos a arrays, crea una copia del actual más el elemento que se añade
$numeros = @(2,3)
$numeros += 4
$numeros
$numeros += 5,6
$numeros


# Deleting elements from an array
# PowerShell no da forma de eliminar elementos ya que los arrays son estructuras estáticas. Para poder eliminar, deberíamos crear otro array con todos los elementos menos el que queremos eliminar


# Suma de arrays
# Para sumar arrays solo necesitamos utilizar el operador +
$a = @(2,3)
$b = @(6,7)
$c = $a+$b
Write-Host $c


# Funciones Utiles
#  -join
#  Este comando es muy utilizado ya que devuelve una concatenación de todos los elementos del array unidos con el caracter que se pase
$numeros = @(1,2,3)
Write-Host $numeros
Write-Host ($numeros -join '-') # Imprimirá '1-2-3'

# -contains
# Este comando devuelve verdadero si el array contiene el elemento que se pasa como parámetro
$numeros = @(1,2,3)
Write-Host($numeros -contains 1)

# -notcontains
# Devolverá verdadero si el array NO contiene el elemento que se pasa como parámetro o Falso en caso contrario
$numeros = @(1,2,3)
Write-Host ($numeros -notcontains 1)