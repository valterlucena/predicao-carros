library(tidyverse)
library(here)
library(caret)

carros <- read.csv(here("data/true_car_listings.csv"))
carros <- carros %>% select(-Vin)

particao <- createDataPartition(y = carros$Price, p = 0.8, list = FALSE)

set.seed(397)

treino <- carros[particao, ]
write.csv(x = treino,
          file = here("data/treino.csv"),
          row.names = FALSE)

validacao <- carros[-particao, ]
write.csv(x = validacao,
          file = here("data/validacao.csv"),
          row.names = FALSE)

