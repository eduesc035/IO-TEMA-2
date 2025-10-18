# Datos
costos <- matrix(c(4,6,5,3), nrow=2, byrow=TRUE)
oferta <- c(20,30)
demanda <- c(25,25)

# Inicializamos matriz de solución
sol <- matrix(0, nrow=2, ncol=2)

# Mientras haya oferta y demanda pendiente
while(sum(oferta) > 0 && sum(demanda) > 0){
  # Encontrar la posición del costo mínimo disponible
  costos_temp <- costos
  costos_temp[oferta==0, ] <- Inf
  costos_temp[, demanda==0] <- Inf
  pos <- which(costos_temp == min(costos_temp), arr.ind=TRUE)[1,]
  
  i <- pos[1] # fila
  j <- pos[2] # columna
  
  asignar <- min(oferta[i], demanda[j])
  sol[i,j] <- asignar
  
  # Actualizar oferta y demanda
  oferta[i] <- oferta[i] - asignar
  demanda[j] <- demanda[j] - asignar
}

print("Matriz de asignación (óptima):")
print(sol)

costo_total <- sum(sol*costos)
print(paste("Costo mínimo =", costo_total))

# Gráfico
plot(c(1,2), c(2,1), type="n", xlab="Almacenes", ylab="Fábricas",
     xlim=c(0.5,2.5), ylim=c(0.5,2.5), axes=FALSE)
axis(1, at=1:2, labels=c("A1","A2"))
axis(2, at=1:2, labels=c("F1","F2"))
for(i in 1:2){
  for(j in 1:2){
    text(j, 3-i, paste("x=", sol[i,j], "\nc=", costos[i,j]))
  }
}

