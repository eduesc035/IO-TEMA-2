duracion <- c(4,3,2,5,3)
predecesores <- list(c(), c(1), c(1), c(2,3), c(4))
n <- length(duracion)

ES <- EF <- numeric(n)
for(i in 1:n){
  ES[i] <- if(length(predecesores[[i]])==0) 0 else max(EF[predecesores[[i]]])
  EF[i] <- ES[i]+duracion[i]
}

LS <- LF <- numeric(n)
LF[n] <- EF[n]
LS[n] <- LF[n]-duracion[n]
for(i in (n-1):1){
  siguientes <- which(sapply(predecesores,function(x)i %in% x))
  LF[i] <- if(length(siguientes)==0) EF[i] else min(LS[siguientes])
  LS[i] <- LF[i]-duracion[i]
}

holgura <- LS-ES
ruta_critica <- which(holgura==0)

print(data.frame(Actividad=1:n,Duracion=duracion,ES=ES,EF=EF,LS=LS,LF=LF,Holgura=holgura))
cat("Ruta Critica:", ruta_critica,"\n")

plot(0,0,type="n",xlim=c(0,max(EF)+1),ylim=c(0,n+1),xlab="Tiempo",ylab="Actividad",main="CPM Ejercicio 5")
for(i in 1:n){
  rect(ES[i], n-i+0.5, EF[i], n-i+1, col=ifelse(i %in% ruta_critica,"red","lightblue"))
  text((ES[i]+EF[i])/2, n-i+0.75, labels=i)
}
