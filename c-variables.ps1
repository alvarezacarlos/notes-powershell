$nombre = "ADD Costa Tropical"
$nombre

# utilizando el modo explicito con el cmdlet  New-Variable
New-Variable message "Hello There"
New-Variable message1 -Value "Hello There 1"
New-Variable -Name message2 -Value "Hello There 2"

$message
$message1
$message2


# obetner las variables de entorno y las variables definidas
  # Get-Variable