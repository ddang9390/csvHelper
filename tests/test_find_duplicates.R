library(testthat)
source("../R/find_duplicates.R")

test_that("able to read dataframe", {
  expect_equal(find_duplicates(airquality), 0)
})

test_that("able to read csv file", {
  expect_equal(find_duplicates("dirty_data.csv"), 0)
})