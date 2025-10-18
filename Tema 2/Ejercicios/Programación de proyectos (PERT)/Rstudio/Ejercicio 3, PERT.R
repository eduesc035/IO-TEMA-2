# Ejercicio 3 - PERT evento escolar
actividad <- c("A","B","C","D","E","F")
predecesora <- c("-","A","A","B","C,D","E")
a <- c(1,2,2,1,2,1)
m <- c(2,3,3,2,3,2)
b <- c(3,4,5,3,4,3)

Te <- (a + 4*m + b)/6
PERT <- data.frame(actividad, predecesora, a, m, b, Te)
print(PERT)

r1 <- Te[1]+Te[2]+Te[4]+Te[5]+Te[6]  # A-B-D-E-F
r2 <- Te[1]+Te[3]+Te[5]+Te[6]        # A-C-E-F
cat("\nRuta 1 (A-B-D-E-F):", r1, "\nRuta 2 (A-C-E-F):", r2, "\n")
if (r1 > r2) cat("Ruta crítica: A-B-D-E-F\nDuración:", r1,"días\n") else cat("Ruta crítica: A-C-E-F\nDuración:", r2,"días\n")

plot(0,0,type="n",xlim=c(0,12),ylim=c(0,10),xaxt='n',yaxt='n',main="PERT - Evento Escolar")
points(c(2,4,4,6,8,10), c(8,9,6,8,8,8),pch=21,bg="lightblue",cex=2)
text(c(2,4,4,6,8,10), c(8,9,6,8,8,8), labels=actividad, font=2)
arrows(2.5,8,3.5,9,length=0.1)
arrows(2.5,8,3.5,6,length=0.1)
arrows(4.5,9,5.5,8,length=0.1)
arrows(4.5,6,5.5,8,length=0.1)
arrows(6.5,8,7.5,8,length=0.1)
arrows(8.5,8,9.5,8,length=0.1)
