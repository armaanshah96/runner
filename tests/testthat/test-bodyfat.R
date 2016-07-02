library(runner)

context("Body Fat Percentage Measurement")

# metric/english and wrong input type tested in BMI

# test male, capitalization
test_that("male, capitalization, and defaults", {
  expect_equal(body_fat(152, "male", , 30), 22.59)
})

# test female
test_that("male and capitalization", {
  expect_equal(body_fat(152, "female", 6.5, 30, 34, 10), 25.34)
})
