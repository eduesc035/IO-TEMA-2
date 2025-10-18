# Ejemplo 2
library(igraph)
m <- matrix(c(0,4,2,0,0,
              4,0,1,7,0,
              2,1,0,3,5,
              0,7,3,0,2,
              0,0,5,2,0), nrow=5, byrow=TRUE)
g <- graph_from_adjacency_matrix(m, mode="undirected", weighted=TRUE)
V(g)$name <- c("1","2","3","4","5")

ruta <- shortest_paths(g, from="1", to="5")$vpath
distancia <- distances(g)["1","5"]
print(ruta)
cat("Distancia total:", distancia, "\n")

plot(g,
     edge.label = E(g)$weight,
     vertex.size = 30,
     vertex.color = "lightgreen",
     vertex.label.color = "black",
     main = "Ruta más corta: 1 → 3 → 4 → 5")
