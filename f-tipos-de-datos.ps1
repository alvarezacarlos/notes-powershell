# tipos de datos
  # string
  # char
  # int --> entero con 32 bits (numeros negativos y posivitos)
  # long --> entero con 64 bits (numeros negativos y posivitos) 
  # single --> numeros flotantes 32 bits
  # double --> numeros flotantes 64 bits

  # datetime
  # bool
  # array
  # hashtable --> objeto que representa una tabla hash

# get the type of a vaiable
  # GetType().name  --> Example: $nombre.GetType().name

#declaracion implicita
$name = "Carlos"
Write-Host $name.GetType().name


$age = 15
Write-Host $age.GetType().name

$age = "cinco"
Write-Host $age.GetType().name


# declaracion explicita
[string] $name = "Carlos"
Write-Host $name.GetType().name

[Int32] $age = 15
Write-Host $age.GetType().name

#this will throw an error, because $age has been defined with an Int32 type, and not with a dynamic or implicite type
$age = "cinco"
Write-Host $age.GetType().name


# date 
# this will remain as text
$fecha1 = "2023-11-11"
Write-Host $fecha1
Write-Host $fecha1.GetType().name

# casting
$fecha = [datetime] "2023-11-11"
Write-Host $fecha
Write-Host $fecha.GetType().name

# declaracion explicita da la variable de tipo datetime , no need to do the casting then
[datetime] $fecha =  "2023-11-11"
Write-Host $fecha
Write-Host $fecha.GetType().name