# Ejemplo 5
library(igraph)
m <- matrix(c(0,4,2,0,0,0,
              4,0,1,7,0,0,
              2,1,0,3,5,0,
              0,7,3,0,2,6,
              0,0,5,2,0,4,
              0,0,0,6,4,0), nrow=6, byrow=TRUE)
g <- graph_from_adjacency_matrix(m, mode="undirected", weighted=TRUE)
V(g)$name <- c("1","2","3","4","5","6")

ruta <- shortest_paths(g, from="1", to="6")$vpath
distancia <- distances(g)["1","6"]
print(ruta)
cat("Distancia total:", distancia, "\n")

plot(g,
     edge.label = E(g)$weight,
     vertex.size = 30,
     vertex.color = "lightyellow",
     vertex.label.color = "black",
     main = "Ruta más corta: 1 → 3 → 5 → 6")
