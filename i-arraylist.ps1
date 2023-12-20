# ArrayList es como un array pero sin ser fijos
[System.Collections.ArrayList] $caps = "A", "B", "C", "D"

$caps.Remove("B")

Write-Host $caps


# Eliminar todas las ocurrencias
# Si queremos eliminar todas las ocurrencias, usaremos Remove acompañado de un while (lo veremos más tarde) y el método -contains
[System.Collections.ArrayList] $caps1 = "A", "B", "C", "D", "C", "E"
while ($caps1 -contains "C") {
  $caps1.Remove("C")
}
Write-Host $caps1