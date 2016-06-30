library(runner)

context("BMI Measurement")

# test english
test_that("measuring BMI in hidden english units", {
  expect_equal(bmi(66,140), 22.59)
})

test_that("measuring BMI in english units", {
  expect_equal(bmi(66,140,"english"), 22.59)
})


# test metric
test_that("measuring BMI in metric units", {
  expect_equal(bmi(1.7,72,"metric"), 24.91)

})

# # test wrong height type
# test_that("wrong height type is provided", {
#   expect_equal(bmi("1",72,"metric"), "height must be a numeric!")
#
# })
#
# # test wrong weight type
# test_that("wrong weight type is provided", {
#   expect_equal(bmi(1.7,"72","metric"), "weight must be a numeric!")
#
# })
#
# # test wrong units type
# test_that("wrong unitts type is provided", {
#   expect_equal(bmi(1.7,72,11), "Error in bmi(1.7, 72, 11) : units must be a character!")
#
# })
#
# # test wrong units option selected, not metric or english
# test_that("neither english or metric units are provided", {
#   expect_equal(bmi(1.7,72,"SI units"), stop("units must be either 'english' or 'metric'"))
#
# })
