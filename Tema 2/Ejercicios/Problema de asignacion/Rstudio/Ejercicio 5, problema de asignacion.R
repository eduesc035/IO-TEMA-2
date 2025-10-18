# Matriz de eficiencia
eficiencia <- matrix(c(9, 7, 6, 8, 5,
                       6, 8, 7, 5, 9,
                       7, 6, 8, 9, 5,
                       5, 9, 6, 7, 8,
                       8, 5, 9, 6, 7),
                     nrow = 5, byrow = TRUE)

# Convertir a matriz de "costo" para minimizar
cost <- max(eficiencia) - eficiencia

library(lpSolve)
resultado <- lp.assign(cost)

cat("Matriz solución:\n")
print(resultado$solution)
cat("Eficiencia total máxima:", sum(eficiencia * resultado$solution), "\n")

empleados <- paste0("E", 1:5)
proyectos <- paste0("P", 1:5)
mat <- resultado$solution

image(t(mat[nrow(mat):1, ]), axes = FALSE, col = c("white", "purple"))
axis(1, at = seq(0, 1, length.out = 5), labels = empleados)
axis(2, at = seq(0, 1, length.out = 5), labels = rev(proyectos))
for (i in 1:5) {
  for (j in 1:5) {
    if (mat[i, j] == 1) {
      text((j - 1)/4, (5 - i)/4, labels = "✔", col = "red", cex = 2)
    }
  }
}
title(main = paste("Ejercicio 5 - Asignación Óptima (Eficiencia total:", sum(eficiencia * resultado$solution), ")"))
