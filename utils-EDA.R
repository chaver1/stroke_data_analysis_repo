library(readr)

#Data Cleaning Utilities-------------------------------------------------------
load_data <- function(filename, wd_path, na_vector = c(),
                      print_path = FALSE) {
  setwd(wd_path)
  if (print_path == TRUE) {
    getwd()}

  if (length(na_vector) != 0){
    return(read_csv(filename, na = na_vector,
                    show_col_types = FALSE))}
  else {
    return(read_csv(filename, show_col_types = FALSE))}
  }

check_missing_data <- function(dataframe) {
  check_null <- FALSE
  if (TRUE == is.null(dataframe)) {
    check_null <- TRUE}

  check_na <- FALSE
  if (TRUE %in% is.na(dataframe)) {
    check_na <- TRUE}

  return(c(check_null, check_na))
}

factorize_char_cols <- function(dataframe, exclude = c()) {
  dataframe <- dataframe |>
    mutate_if(is.character, factor)

  return(dataframe)
}

#parameterized index in case id-col is not at first index
remove_id_col <- function(dataframe, index = 1) {
  dataframe <- dataframe[-c(index)]

  return(dataframe)
}

#REDUNDANT---------------------------------------------------------------------
#Likely unnecessary since na parameter coerced loaded bmi column into
#numeric data; maintain for now just in case
convert_char_col_to_numeric <- function(column) {
  as.numeric(as.character(column))
}
