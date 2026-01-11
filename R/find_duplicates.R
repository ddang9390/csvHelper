
# Find duplicate rows for a csv file
find_duplicates <- function() {
  if (is.character(data)){
    data <- read.csv(data)
  }
  if (!is.data.frame(data)){
    stop("data must be a csv file or a data frame")
  }
  
  View(data)
  
  return(0)
}