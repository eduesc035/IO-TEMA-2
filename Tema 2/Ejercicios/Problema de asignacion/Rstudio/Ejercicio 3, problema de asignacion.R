# Matriz de costos (tiempo en horas)
cost <- matrix(c(4, 7, 5,
                 6, 5, 8,
                 7, 6, 4),
               nrow = 3, byrow = TRUE)

library(lpSolve)
resultado <- lp.assign(cost)

cat("Matriz solución:\n")
print(resultado$solution)
cat("Tiempo total mínimo:", resultado$objval, "horas\n")

tecnicos <- c("T1", "T2", "T3")
maquinas <- c("M1", "M2", "M3")
mat <- resultado$solution

image(t(mat[nrow(mat):1, ]), axes = FALSE, col = c("white", "lightblue"))
axis(1, at = seq(0, 1, length.out = 3), labels = tecnicos)
axis(2, at = seq(0, 1, length.out = 3), labels = rev(maquinas))
for (i in 1:3) {
  for (j in 1:3) {
    if (mat[i, j] == 1) {
      text((j - 1)/2, (3 - i)/2, labels = "✔", col = "red", cex = 2)
    }
  }
}
title(main = paste("Ejercicio 3 - Tiempo mínimo:", resultado$objval, "horas"))
