library(testthat)
source("../R/find_duplicates.R")

test_that("able to read dataframe", {
  # Found 0 duplicates
  expect_equal(find_duplicates(airquality), 0)
  
  # Found non-zero duplicates
  expect_equal(find_duplicates(iris), 2)
})

test_that("able to read csv file", {
  expect_equal(find_duplicates("dirty_data.csv"), 10)
})

test_that("able to handle errors", {
  expect_error(find_duplicates(1), "data must be a csv file or a data frame")
})