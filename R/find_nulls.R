library("tidyverse")
library("ggplot2")

# Find NA values for each column for a csv file
find_nulls <- function(data) {
  if (is.character(data)){
    data <- read.csv(data)
  }
  if (!is.data.frame(data)){
    stop("data must be a csv file or a data frame")
  }
  
  na_counts <- colSums(is.na(data))
  
  # Printing number of na values
  print("Number of NA Values")
  print(na_counts)

  # Printing percentages
  percents <- round((na_counts / nrow(data)) * 100, 2)
  print("Percentage of NA Values")
  print(percents)
  
  # Creating summary
  na_summary <- data.frame(
    columns = names(na_counts),
    count = na_counts,
    percents = percents
  )
  
  # Creating bar chart
  plot <- ggplot(na_summary, aes(x = columns, y = count)) +
            geom_col() +
            labs(
              x = "Columns",
              y = "NA Amount",
              title = "NA Amount Per Column"
            )
            
  print(plot)

  return(na_summary)
}

find_nulls(airquality)