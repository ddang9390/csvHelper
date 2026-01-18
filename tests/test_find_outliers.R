library(testthat)
source("../R/find_outliers.R")

test_that("able to read dataframe", {
  expect_no_error(find_outliers(airquality))
  
  report <- find_outliers(airquality)
  expect_equal(nrow(report$Ozone), 2)
  expect_equal(report$Day, NULL)
})

test_that("able to read csv file", {
  expect_no_error(find_outliers("dirty_data.csv"))
  
  report <- find_outliers("dirty_data.csv")
  expect_equal(nrow(report$Ozone), 2)
  expect_equal(report$Day, NULL)
})

test_that("able to handle errors", {
  expect_error(find_outliers(1), "data must be a csv file or a data frame")
})