
# Find duplicate rows for a csv file
find_duplicates <- function(data) {
  if (is.character(data)){
    data <- read.csv(data)
  }
  if (!is.data.frame(data)){
    stop("data must be a csv file or a data frame")
  }
  # Add column for tracking original positions of the rows
  data$original_row_id <- 1:nrow(data)

  is_duplicate <- duplicated(data[,-ncol(data)], fromLast = TRUE) | duplicated(data[,-ncol(data)])
  duplicates <- data[is_duplicate,]
  
  total_duplicates <- nrow(duplicates)
  if (nrow(duplicates) > 0){
    print(paste("Found", total_duplicates, "duplicate rows"))
    print(duplicates)
  }
  else{
    print("No duplicates found")
  }

  
  return(total_duplicates)
}

find_duplicates(iris)
find_duplicates(airquality)