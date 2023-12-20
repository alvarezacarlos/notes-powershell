# Instrucción IF
# Instrucción IF - ELSE
# Instrucción IF - ELSEIF - ELSE

[int]$edad = Read-Host "Introduce tu edad:"
if ($edad -ge 18) {
  Write-Host "Es mayor de edad"
}
elseif (($edad -lt 18) -And ($edad -gt 13)) {
  Write-Host "Es adolescente"
}
else {
  Write-Host "Todavía es pequeño"
}
Write-Host "Fin del programa"


# Switch
# Switch - Break
# Switch - Default
# Switch con condicionales

$color = Read-Host "Introduce el color del semáforo (rojo, verde o amarillo):"
switch ($color) {
  'rojo' {
    Write-Host "No puedes pasar"
    Break
  }
  'amarillo' {
    Write-Host "Precaución"
    Break
  }
  'verde' {
    Write-Host "Puedes pasar"
    Break
  }
  default {
    Write-Host "Color no válido"
  }
}
Write-Host "Fin del programa"



# Switch con condiciones y el operador $_
# Hay que tener en cuenta, que en las condiciones el valor $_ será sustituido por el valor de la variable que estamos evaluando
[int]$edad = Read-Host "Introduce tu edad"
switch ($edad) {
  { $_ -gt 18 } {
    Write-Host "Eres mayor de edad"
    Break
  }
  { $_ -lt 18 -And $_ -ge 13 } {
    Write-Host "Eres adolescente"
    Break
  }
  default {
    Write-Host "Eres todavía pequeño"
  }
}
Write-Host "Fin del programa"


# Switch con el operador -in y .. para intervalos
[int]$nota = Read-Host "Introduce tu nota"
switch ($nota) {
  { $_ -in 5..10 } {
    Write-Host "Aprobado"
    Break
  }
  { $_ -in 0..4 } {
    Write-Host "Suspenso"
    Break
  }
  default {
    Write-Host "Nota no válida"
  }
}
Write-Host "Fin del programa"