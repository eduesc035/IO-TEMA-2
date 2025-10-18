# Ejemplo 1
library(igraph)

# Matriz de distancias
m <- matrix(c(0,5,2,0,
              5,0,3,6,
              2,3,0,4,
              0,6,4,0), nrow=4, byrow=TRUE)

# Crear grafo
g <- graph_from_adjacency_matrix(m, mode="undirected", weighted=TRUE)

# Etiquetas de vértices
V(g)$name <- c("A","B","C","D")

# Calcular ruta más corta de A a D
ruta <- shortest_paths(g, from="A", to="D")$vpath
distancia <- distances(g)["A","D"]

print(ruta)
cat("Distancia total:", distancia, "\n")

# Graficar
plot(g,
     edge.label = E(g)$weight,
     vertex.size = 30,
     vertex.color = "lightblue",
     vertex.label.color = "black",
     main = "Ruta más corta: A → C → D")
