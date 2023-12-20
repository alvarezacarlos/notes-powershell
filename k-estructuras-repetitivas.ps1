# While
$veces = 0
while ($veces -lt 100) {
  Write-Host "Hola"
  $veces++
}


# Do While
$i = 0
do {
  Write-Host $i
  $i++
} while ($i -lt 5)


# Foreach
$colores = @("azul", "verde", "rojo")
foreach ($c in $colores) {
  Write-Host $c
}

$numeros = 1..10
foreach ($n in $numeros) {
  Write-Host $n
}


# For
for ($i = 0; $i -lt 10; $i++) {
  Write-Host $i
}

[int]$fin = Read-Host "Introduce un número"
for ($i = 0; $i -lt $fin; $i++) {
  Write-Host $i
}

$nombres = @("Motril", "Salobreña", "Lobres", "Itrabo")
for ($i = 0; $i -lt $nombres.Length; $i++) {
  Write-Host $nombres[$i]
}