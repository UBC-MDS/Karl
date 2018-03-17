# Integration Test

require(ggplot2)
require(gridExtra)
require(testthat)

# Generate small data to test our function
set.seed(4)
X <- data.frame('X1' = rnorm(10))
y <- X$X1 + rnorm(10)

# EDA Function: This function is independent of LinearRegression() function and plot_karl()
summary <- EDA(X,y)

# Linear Regression Function
lm <- LinearRegression(X,y)

# Plot Linear Model Function: plot_karl() is dependent on the output from LinearRegression()
plots <- plot_karl(lm)

test_that("plot_karl(): returns various plots using the linear model object", {
  # expected outputs:
  expect_match(typeof(plots), "list") # Checks to see if the plotting type is correct
  expect_equal(length(plots), 2) # Checks to see if the number of outputs is correct.
  expect_false(plots$respect) # Respective to eachother the outputs.
})

