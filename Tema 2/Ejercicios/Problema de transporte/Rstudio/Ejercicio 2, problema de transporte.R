# Datos
costos <- matrix(c(2,3,1,5,4,8), nrow=2, byrow=TRUE)
oferta <- c(30,20)
demanda <- c(10,25,15)
sol <- matrix(0, nrow=2, ncol=3)

# Método de costo mínimo
while(sum(oferta) > 0 && sum(demanda) > 0){
  costos_temp <- costos
  costos_temp[oferta==0, ] <- Inf
  costos_temp[, demanda==0] <- Inf
  pos <- which(costos_temp == min(costos_temp), arr.ind=TRUE)[1,]
  i <- pos[1]; j <- pos[2]
  asignar <- min(oferta[i], demanda[j])
  sol[i,j] <- asignar
  oferta[i] <- oferta[i] - asignar
  demanda[j] <- demanda[j] - asignar
}

# Mostrar resultados en consola
print("Ejercicio 2 - Matriz de asignación óptima:")
print(sol)
costo_total <- sum(sol*costos)
print(paste("Costo mínimo =", costo_total))

# Gráfico seguro tipo tabla
n_filas <- nrow(sol)
n_col <- ncol(sol)

# Crear plano vacío
plot(c(0.5, n_col+0.5), c(0.5, n_filas+0.5), type="n", xlab="Almacenes", ylab="Fábricas",
     xaxt='n', yaxt='n', bty='n')

# Etiquetas de ejes
axis(1, at=1:n_col, labels=paste0("A",1:n_col))
axis(2, at=1:n_filas, labels=paste0("F",1:n_filas))

# Dibujar valores x y costos
for(i in 1:n_filas){
  for(j in 1:n_col){
    text(j, n_filas+1-i, paste("x=", sol[i,j], "\nc=", costos[i,j]))
  }
}

