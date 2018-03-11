# Test plot_karl function
# March 2018

## Packages
library(matlib)
library(ggplot2)
library(gridExtra)

# Sample linear model
set.seed(4)
X <- data.frame('ones' = rep.int(1, times = length(y)), 'X1' = rnorm(10),
                'X2' = rnorm(10), 'X3' = rnorm(10))
y <- X$X1 + X$X2 + X$X3 + rnorm(10)

# Fit a linear regression on the data
model <- LinearRegression(X, y)

# True values
X_mat <- as.matrix(X)
beta <- inv(t(X_mat)%*%X_mat)%*%t(X_mat)%*%y
fit <- X_mat%*%beta
res <- y - fit

# Plot Linear Model Diagnostics
plots <- plot_karl(model)

test_that("plot_karl(): returns various plots using the linear model object", {

  # expected inputs:
  expect_match(typeof(model), 'list')
  expect_match(names(model), c('weights', 'fitted', 'residuals'))
  expect_equal(model$fitted, fit)
  expect_equal(model$residuals, res)

  # expected outputs:
  expect_match(typeof(plots), "list") # Checks to see if the plotting type is correct
  expect_match(length(plots), 2) # Checks to see if the number of outputs is correct.
  expect_match(plots$respect, FALSE) # Respective to eachother the outputs.


})
