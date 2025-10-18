# Resolver el problema de asignación SIN librerías externas
# Usando lpSolve solo porque es indispensable para el método

install.packages("lpSolve")  # Solo si no lo tienes
library(lpSolve)

# Matriz de costos
cost <- matrix(c(10,15,20,
                 5,9,10,
                 8,7,9),
               nrow = 3, byrow = TRUE)

# Resolver asignación
resultado <- lp.assign(cost)

# Mostrar solución
cat("Matriz solución:\n")
print(resultado$solution)
cat("Costo mínimo total:", resultado$objval, "\n")

# Obtener asignaciones
trabajadores <- c("A", "B", "C")
tareas <- c("T1", "T2", "T3")

# Crear gráfico tipo mapa en base R
mat <- resultado$solution
image(t(mat[nrow(mat):1, ]), axes = FALSE, col = c("white", "skyblue"))
axis(1, at = seq(0, 1, length.out = 3), labels = trabajadores)
axis(2, at = seq(0, 1, length.out = 3), labels = rev(tareas))

# Añadir texto ✔ donde hay asignación
for (i in 1:3) {
  for (j in 1:3) {
    if (mat[i, j] == 1) {
      text((j - 1) / 2, (3 - i) / 2, labels = "✔", col = "red", cex = 2)
    }
  }
}

title(main = paste("Asignación Óptima - Costo total:", resultado$objval))

