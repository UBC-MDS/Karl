# Test plot_karl function
# March 2018

## Packages
library(testthat)
library(matlib)
library(ggplot2)
library(gridExtra)

# Generate small data to test our function
set.seed(4)
X <- data.frame('X1' = rnorm(10))
y <- X$X1 + rnorm(10)

# True value of the coefficients
beta <- cov(X$X1, y)/var(X$X1)
alpha <- mean(y) - beta*mean(X$X1)
fit <- alpha + beta*X$X1
res <- y - fit

# Fit a linear regression on the data
model <- LinearRegression(X, y)

# Plot Linear Model Diagnostics
plots <- plot_karl(model)

test_that("plot_karl(): returns various plots using the linear model object", {

  # expected inputs:
  expect_equal(is.null(model$residuals), FALSE) # Expect not null input
  expect_match(typeof(model), 'list') # Expect type list
  expect_equal(names(model), c('weights', 'fitted', 'residuals')) # Expect names of inputs
  expect_equal(length(model$fitted), length(model$residuals)) # Length of residuals and fitted values to match
  expect_true(length(model$fitted)>1) # Expect length of fitted values greater than 1
  expect_true(length(model$residuals)>1) # Expect length of residuals values greater than 1

  # expected outputs:
  expect_match(typeof(plots), "list") # Checks to see if the plotting type is correct
  expect_equal(length(plots), 2) # Checks to see if the number of outputs is correct.
  expect_false(plots$respect) # Respective to eachother the outputs.

})
