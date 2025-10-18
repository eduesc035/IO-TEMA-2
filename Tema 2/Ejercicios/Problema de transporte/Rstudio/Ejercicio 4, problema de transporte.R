costos <- matrix(c(3,1,7,2,6,5,9,8,3), nrow=3, byrow=TRUE)
oferta <- c(20,30,25)
demanda <- c(10,35,30)
sol <- matrix(0, nrow=3, ncol=3)

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

print("Ejercicio 4 - Matriz de asignación óptima:")
print(sol)
costo_total <- sum(sol*costos)
print(paste("Costo mínimo =", costo_total))

# Gráfico seguro
n_filas <- nrow(sol)
n_col <- ncol(sol)
plot(c(0.5, n_col+0.5), c(0.5, n_filas+0.5), type="n", xlab="Almacenes", ylab="Fábricas", xaxt='n', yaxt='n', bty='n')
axis(1, at=1:n_col, labels=paste0("A",1:n_col))
axis(2, at=1:n_filas, labels=paste0("F",1:n_filas))
for(i in 1:n_filas){
  for(j in 1:n_col){
    text(j, n_filas+1-i, paste("x=", sol[i,j], "\nc=", costos[i,j]))
  }
}
