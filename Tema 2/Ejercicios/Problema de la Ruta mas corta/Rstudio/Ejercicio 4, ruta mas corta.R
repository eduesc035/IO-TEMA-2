# Ejemplo 4
library(igraph)
m <- matrix(c(0,2,5,0,0,
              2,0,3,4,0,
              5,3,0,2,6,
              0,4,2,0,3,
              0,0,6,3,0), nrow=5, byrow=TRUE)
g <- graph_from_adjacency_matrix(m, mode="undirected", weighted=TRUE)
V(g)$name <- c("S","A","B","C","L")

ruta <- shortest_paths(g, from="S", to="L")$vpath
distancia <- distances(g)["S","L"]
print(ruta)
cat("Distancia total:", distancia, "\n")

plot(g,
     edge.label = E(g)$weight,
     vertex.size = 30,
     vertex.color = "lightpink",
     vertex.label.color = "black",
     main = "Ruta más corta: S → A → C → L")
