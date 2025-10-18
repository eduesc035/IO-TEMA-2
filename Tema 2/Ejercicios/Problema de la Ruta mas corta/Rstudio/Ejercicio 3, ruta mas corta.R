# Ejemplo 3
library(igraph)
m <- matrix(c(0,6,2,0,0,
              6,0,3,5,0,
              2,3,0,4,0,
              0,5,4,0,2,
              0,0,0,2,0), nrow=5, byrow=TRUE)
g <- graph_from_adjacency_matrix(m, mode="undirected", weighted=TRUE)
V(g)$name <- c("A","B","C","D","E")

ruta <- shortest_paths(g, from="A", to="E")$vpath
distancia <- distances(g)["A","E"]
print(ruta)
cat("Distancia total:", distancia, "\n")

plot(g,
     edge.label = E(g)$weight,
     vertex.size = 30,
     vertex.color = "orange",
     vertex.label.color = "black",
     main = "Ruta más corta: A → C → D → E")
