library(testthat)
source("../R/find_nulls.R")

test_that("able to read dataframe", {
  expect_equal(find_nulls(airquality), 0)
})

test_that("able to read csv file", {
  expect_equal(find_nulls("dirty_data.csv"), 0)
})