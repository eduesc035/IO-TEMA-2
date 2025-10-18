# =========================================
# EJERCICIO PERT SIMPLE EN R
# =========================================

# Datos del proyecto
actividad <- c("A", "B", "C", "D", "E")
predecesora <- c("-", "A", "A", "B,C", "D")
a <- c(2, 3, 4, 2, 1)
m <- c(3, 4, 6, 3, 2)
b <- c(5, 6, 8, 5, 3)

# Calcular tiempo esperado
Te <- (a + 4*m + b) / 6

# Crear data frame
PERT <- data.frame(actividad, predecesora, a, m, b, Te)
print("Tabla PERT con tiempos esperados:")
print(PERT)

# Calcular tiempo total suponiendo secuencia A -> (B,C) -> D -> E
# Ruta 1: A - B - D - E
t1 <- Te[1] + Te[2] + Te[4] + Te[5]

# Ruta 2: A - C - D - E
t2 <- Te[1] + Te[3] + Te[4] + Te[5]

# Mostrar resultados
cat("\nTiempo total por ruta 1 (A-B-D-E):", t1, "días\n")
cat("Tiempo total por ruta 2 (A-C-D-E):", t2, "días\n")

if (t1 > t2) {
  cat("Ruta crítica: A-B-D-E\nDuración total:", t1, "días\n")
} else {
  cat("Ruta crítica: A-C-D-E\nDuración total:", t2, "días\n")
}

# -----------------------------------------
# Graficar diagrama PERT simple con plot()
# -----------------------------------------

plot(0, 0, type="n", xlim=c(0,10), ylim=c(0,10), xaxt='n', yaxt='n',
     xlab="", ylab="", main="Diagrama PERT - Desarrollo de App")

# Dibujar nodos (actividades)
points(c(2, 5, 5, 8, 10), c(8, 9, 6, 7, 7), pch=21, bg="lightblue", cex=2)
text(c(2, 5, 5, 8, 10), c(8, 9, 6, 7, 7), labels=actividad, cex=1.2, font=2)

# Dibujar flechas
arrows(2.5, 8, 4.4, 9, length=0.1) # A -> B
arrows(2.5, 8, 4.4, 6, length=0.1) # A -> C
arrows(5.5, 9, 7.6, 7, length=0.1) # B -> D
arrows(5.5, 6, 7.6, 7, length=0.1) # C -> D
arrows(8.5, 7, 9.6, 7, length=0.1) # D -> E

# Etiquetas opcionales de tiempos
text(2, 8.5, "Inicio", pos=4, col="darkgreen", font=3)
text(9.5, 7.5, "Fin", pos=4, col="darkred", font=3)
