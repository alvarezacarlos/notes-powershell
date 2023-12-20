# operadores de asignacion
  # = --> Modifica el valor de una variable. Puede modificar también el tipo si no está establecido

# operadores aritmeticos
  # Operador suma +
  # Operador resta -
  # Operador multiplicación *
  # Operador división /
  # Operador resto %
  # Operador +=
  # Operador ++

# operadores de comparacion 
  # 2 -eq 2 # Igual que (==)
  # 2 -ne 4 # Desigual a (!=)
  # 5 -gt 2 # Mayor que (>)
  # 5 -ge 5 # Mayor o igual que (>=)
  # 5 -lt 10 # Menor que (<)
  # 5 -le 5 # Menor o igual que (<=)
  # "MyString" -like "*String"
  # "MyString" -notlike "Other*"
  # "MyString" -match "$String^"  # comparacion con expresiones regulares
  # "MyString" -notmatch "$Other^" # comparacion con expresiones regulares
  # 1,2,3 -contains 1  # ARRAYS operators
  # 1,2,3 -notcontains 4 # ARRAYS operators

# operadores logicos
  # -And
  # -Or
  # -Xor
  # -Not
  #  Operadores de tipo de dato -is -isnot
    # $a = "Hola"
    # $a -is [int]
    # $a -isnot [int]