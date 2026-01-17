
# Find outliers for each numerical column for a csv file
find_outliers <- function(data) {
  if (is.character(data)){
    data <- read.csv(data)
  }
  if (!is.data.frame(data)){
    stop("data must be a csv file or a data frame")
  }
  # Keep track of what columns are numeric
  number_cols <- sapply(data, is.numeric)

  outlier_report <- list()
  # Going through each numerical column
  for(col in names(data[number_cols])){
    vals <- data[[col]]
    
    q1 <- quantile(vals, 0.25, na.rm = TRUE)
    q3 <- quantile(vals, 0.75, na.rm = TRUE)
    iqr <- q3 - q1
    
    lower_limit <- q1 - (1.5 * iqr)
    upper_limit <- q3 + (1.5 * iqr)
    
    outliers <- which(vals < lower_limit | vals > upper_limit)
    
    if (length(outliers) > 0){
      report <- data.frame(
        rows = outliers,
        vals = vals[outliers],
        lower_limit = lower_limit,
        upper_limit = upper_limit
      )
      
      outlier_report[[col]] <- report
    }
    
  }
  return(outlier_report)
}

find_outliers(airquality)