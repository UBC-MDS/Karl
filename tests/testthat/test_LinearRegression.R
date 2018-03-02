# LinearRegression_test.R
# March 2018
#
# This script test the methods from the LinearRegression.R script.

## Packages
library(matlib)

### Test simple linear regression for a continuous feature
# Generate small data to test our function
set.seed(4)
X <- data.frame('X1' = rnorm(10))
y <- X$X1 + rnorm(10)

# Fit a linear regression on the data
model <- LinearRegression(X, y)

# True value of the coefficients
beta <- cov(X$X1, y)/var(X$X1)
alpha <- mean(y) - beta*mean(X$X1)
fit <- alpha + beta*X$X1
res <- y - fit

test_that("Testing LinearRegression for one continuous feature", {
  expect_match(typeof(model), 'list')
  expect_match(names(model), c('weights', 'fitted', 'residuals'))
  expect_equal(model$weights$X1, beta)
  expect_equal(model$weights$intercept, alpha)
  expect_equal(model$fitted, fitted)
  expect_equal(model$residuals, res)
})


### Test multi-linear regression for continuous features
# Generate small data to test our function
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

test_that("Testing LinearRegression for multi continuous features", {
  expect_match(typeof(model), 'list')
  expect_match(names(model), c('weights', 'fitted', 'residuals'))
  expect_equal(model$weights, beta)
  expect_equal(model$fitted, fit)
  expect_equal(model$residuals, res)
})
