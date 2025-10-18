# Ejercicio 2 - PERT construcción casa

actividad <- c("A","B","C","D","E","F")
predecesora <- c("-","A","B","C","C","D,E")
a <- c(2,3,4,2,3,2)
m <- c(3,5,6,3,4,3)
b <- c(5,7,8,5,6,4)

Te <- (a + 4*m + b)/6
PERT <- data.frame(actividad, predecesora, a, m, b, Te)
print(PERT)

# Posibles rutas
r1 <- Te[1]+Te[2]+Te[3]+Te[4]+Te[6]   # A-B-C-D-F
r2 <- Te[1]+Te[2]+Te[3]+Te[5]+Te[6]   # A-B-C-E-F

cat("\nRuta 1 (A-B-C-D-F):", r1, "\nRuta 2 (A-B-C-E-F):", r2, "\n")
if (r1 > r2) cat("Ruta crítica: A-B-C-D-F\nDuración:", r1,"días\n") else cat("Ruta crítica: A-B-C-E-F\nDuración:", r2,"días\n")

# Graficar
plot(0,0,type="n",xlim=c(0,12),ylim=c(0,10),xaxt='n',yaxt='n',main="PERT - Construcción de Casa")
points(c(2,4,6,8,8,10), c(8,8,8,9,6,7),pch=21,bg="lightblue",cex=2)
text(c(2,4,6,8,8,10), c(8,8,8,9,6,7), labels=actividad, cex=1.2,font=2)
arrows(2.5,8,3.5,8,length=0.1)
arrows(4.5,8,5.5,8,length=0.1)
arrows(6.5,8,7.5,9,length=0.1)
arrows(6.5,8,7.5,6,length=0.1)
arrows(8.5,9,9.5,7,length=0.1)
arrows(8.5,6,9.5,7,length=0.1)
