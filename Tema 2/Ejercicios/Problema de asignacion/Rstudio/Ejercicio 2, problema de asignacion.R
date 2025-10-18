# Matriz de costos
cost <- matrix(c(8, 6, 10,
                 9, 12, 7,
                 14, 9, 11),
               nrow = 3, byrow = TRUE)

library(lpSolve)
resultado <- lp.assign(cost)

cat("Matriz solución:\n")
print(resultado$solution)
cat("Costo mínimo total:", resultado$objval, "\n")

# Vectores
repartidores <- c("R1", "R2", "R3")
zonas <- c("Z1", "Z2", "Z3")
mat <- resultado$solution

# Gráfico base
image(t(mat[nrow(mat):1, ]), axes = FALSE, col = c("white", "lightgreen"))
axis(1, at = seq(0, 1, length.out = 3), labels = repartidores)
axis(2, at = seq(0, 1, length.out = 3), labels = rev(zonas))
for (i in 1:3) {
  for (j in 1:3) {
    if (mat[i, j] == 1) {
      text((j - 1)/2, (3 - i)/2, labels = "✔", col = "red", cex = 2)
    }
  }
}
title(main = paste("Ejercicio 2 - Asignación Óptima (Costo:", resultado$objval, ")"))
