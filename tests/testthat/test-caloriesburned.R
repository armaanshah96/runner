library(runner)

context("Calories Burned Measurement")

# metric/english, capitalization, defaults, and wrong input type tested in BMI

# test male
test_that("male", {
  expect_equal(calories_burned(19, 130, 152, 60, "male", "english"), 244)
})

# test female
test_that("female", {
  expect_equal(calories_burned(19, 130, 152, 60, "female", "metric"), 285.4)
})
