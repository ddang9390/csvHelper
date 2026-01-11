library(testthat)
source("../R/find_outliers.R")

test_that("able to read dataframe", {
  expect_equal(find_outliers(airquality), 0)
})

test_that("able to read csv file", {
  expect_equal(find_outliers("dirty_data.csv"), 0)
})