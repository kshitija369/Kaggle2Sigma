# Load packages and data
packages <- c("jsonlite", "dplyr", "purrr")
suppressMessages(library(ggplot2)) 
suppressMessages(library(readr)) 
suppressMessages(library(data.table))
suppressMessages(library(jsonlite))
suppressMessages(library(lubridate))

purrr::walk(packages, library, character.only = TRUE, warn.conflicts = FALSE)

data <- fromJSON(txt = "/Users/kshitijap/Desktop/R projects/DoIt/train.json")

# unlist every variable except `photos` and `features` and convert to tibble
vars <- setdiff(names(data), c("photos", "features"))
data <- map_at(data, vars, unlist) %>% tibble::as_tibble(.)

#write.csv(file = "/Users/kshitijap/Desktop/R projects/DoIt/train.csv", x = data )