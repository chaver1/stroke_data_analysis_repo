library(tidyverse)
library(conflicted)

#Due to sourcing utils-EDA requires the path
#to be properly pointed to this directory. This function
#must not be moved to another file.
set_wd_to_project <- function() {
  proj_directory <-
    dirname(rstudioapi::getSourceEditorContext()$path)
  setwd(proj_directory)
}

set_wd_to_project()
source("utils-EDA.R")

#INITIAL-CLEANING--------------------------------------------------------------
dataset_path <- "C:/Users/grant/OneDrive/Documents/Personal/Coding Projects/Data Science Projects"
filename <- "Datasets/stroke-data.csv"
stroke_data <- load_data(filename, dataset_path, na_vector = c("N/A"))
rm(filename, dataset_path)
set_wd_to_project()
# spec(stroke_data)
# summary(stroke_data)

stroke_data <- stroke_data |>
  factorize_char_cols() |>
  remove_id_col()

y <- stroke_data$stroke
X <- stroke_data[-(stroke_data$stroke)]
