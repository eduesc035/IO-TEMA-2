# Matriz de costos
cost <- matrix(c(10, 12, 18, 14,
                 13, 9, 16, 11,
                 12, 15, 14, 10,
                 14, 11, 13, 12),
               nrow = 4, byrow = TRUE)

library(lpSolve)
resultado <- lp.assign(cost)

cat("Matriz solución:\n")
print(resultado$solution)
cat("Costo total mínimo:", resultado$objval, "\n")

choferes <- c("C1", "C2", "C3", "C4")
rutas <- c("R1", "R2", "R3", "R4")
mat <- resultado$solution

image(t(mat[nrow(mat):1, ]), axes = FALSE, col = c("white", "orange"))
axis(1, at = seq(0, 1, length.out = 4), labels = choferes)
axis(2, at = seq(0, 1, length.out = 4), labels = rev(rutas))
for (i in 1:4) {
  for (j in 1:4) {
    if (mat[i, j] == 1) {
      text((j - 1)/3, (4 - i)/3, labels = "✔", col = "red", cex = 2)
    }
  }
}
title(main = paste("Ejercicio 4 - Asignación Óptima (Costo:", resultado$objval, ")"))
