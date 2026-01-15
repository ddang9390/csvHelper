library(testthat)
source("../R/find_nulls.R")

test_that("able to read dataframe and return correct count of na values", {
  result <- find_nulls(airquality)
  expect_equal(sum(result$count), 44)
  
  # Able to handle data with no missing values
  result <- find_nulls(cars)
  expect_equal(sum(result$count), 0)
  expect_equal(sum(result$percent), 0)
})

test_that("able to read csv file", {
  result <- find_nulls("dirty_data.csv")
  expect_equal(sum(result$count), 46)
})

test_that("able to handle errors", {
  expect_error(find_nulls(1), "data must be a csv file or a data frame")
})