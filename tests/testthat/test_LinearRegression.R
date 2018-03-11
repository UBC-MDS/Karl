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
  expect_equal(names(model), c('weights', 'fitted', 'residuals'))

  expect_equal(round(model$weights$X1, 5), round(beta, 5))
  expect_equal(round(model$weights$intercept, 5), round(alpha, 5))
  expect_equal(round(model$fitted, 5), round(fitted, 5))
  expect_equal(round(model$residuals, 5), round, 5)(res, 5))
})

### Test simple linear regression with duplicate observation
# Create a duplicate observation
X$X1[5] <- X$X1[1]

# Fit a linear regression on the data
model <- LinearRegression(X, y)

# True value of the coefficients
beta <- cov(X$X1, y)/var(X$X1)
alpha <- mean(y) - beta*mean(X$X1)
fit <- alpha + beta*X$X1
res <- y - fit

test_that("Testing LinearRegression for duplicate observations", {
  expect_match(typeof(model), 'list')
  expect_equal(names(model), c('weights', 'fitted', 'residuals'))

  expect_equal(length(model$weights), 2)
  expect_equal(length(model$fitted), 10)
  expect_equal(length(model$residuals), 10)

  expect_equal(round(model$weights$X1, 5), round(beta, 5))
  expect_equal(round(model$weights$intercept, 5), round(alpha, 5))
  expect_equal(round(model$fitted, 5), round(fitted, 5))
  expect_equal(round(model$residuals, 5), round(res, 5))
})


### Test multi-linear regression for continuous features
## also test that the non numeric feature is unused
# Generate small data to test our function
set.seed(4)
X <- data.frame('X1' = rnorm(10), 'X2' = rnorm(10), 'X3' = rnorm(10),
                'char' = rep('a', 10))
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
  expect_equal(names(model), c('weights', 'fitted', 'residuals'))

  expect_equal(length(model$weights), 4)
  expect_equal(length(model$fitted), 10)
  expect_equal(length(model$residuals), 10)

  expect_equal(round(model$weights, 5), round(beta, 5))
  expect_equal(round(model$fitted, 5), round(fit, 5))
  expect_equal(round(model$residuals, 5), round(res, 5))
})


### Test error when there is no numeric feature
# Generate small data to test our function
X <- data.frame('char' = rep('a', 10))

test_that("No numeric feature should return an error", {
  expect_error(LinearRegression(X, y))
})
