library(runner)

context("BMI Measurement")

test_that("measuring BMI in english units", {
  expect_equal(bmi(66,140), 22.59)

})

test_that("measuring BMI in metric units", {
  expect_equal(bmi(1.7,72,"metric"), 24.91)

})
