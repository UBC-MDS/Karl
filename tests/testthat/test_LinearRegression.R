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

  expect_equal(model$weights['X1',][[1]], beta, tolerance = 1e-5)
  expect_equal(model$weights['intercept',][[1]], alpha, tolerance = 1e-5)
  expect_equal(c(model$fitted), fit, tolerance = 1e-5)
  expect_equal(c(model$residuals), res, tolerance = 1e-5)
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

  expect_equal(model$weights['X1',][[1]], beta, tolerance = 1e-5)
  expect_equal(model$weights['intercept',][[1]], alpha, tolerance = 1e-5)
  expect_equal(c(model$fitted), fit, tolerance = 1e-5)
  expect_equal(c(model$residuals), res, tolerance = 1e-5)
})


### Test multi-linear regression for continuous features
## also test that the non numeric feature is unused
# Generate small data to test our function
set.seed(4)
X <- data.frame('X1' = rnorm(10), 'X2' = rnorm(10), 'X3' = rnorm(10),
                'char' = rep('a', 10))
X$char <- as.character(X$char)
y <- X$X1 + X$X2 + X$X3 + rnorm(10)

# Fit a linear regression on the data
model <- LinearRegression(X, y)

# True values
cols <- (sapply(X, typeof) %in% c('double', 'integer', 'numeric'))
X_mat <- X %>% select(names(X)[cols])
X_mat <- cbind("intercept"=1, X_mat)
X_mat <- as.matrix(X_mat)
beta <- inv(t(X_mat)%*%X_mat)%*%t(X_mat)%*%y
fit <- X_mat%*%beta
res <- y - fit

test_that("Testing LinearRegression for multi continuous features", {
  expect_match(typeof(model), 'list')
  expect_equal(names(model), c('weights', 'fitted', 'residuals'))

  expect_equal(length(model$weights), 4)
  expect_equal(length(model$fitted), 10)
  expect_equal(length(model$residuals), 10)

  expect_equal(c(model$weights), c(beta), tolerance = 1e-5)
  expect_equal(c(model$fitted), c(fit), tolerance = 1e-5)
  expect_equal(c(model$residuals), c(res), tolerance = 1e-5)
})


### Test multi-linear regression with missing values
# Generate small data to test our function
set.seed(4)
X <- data.frame('X1' = rnorm(10), 'X2' = rnorm(10), 'X3' = rnorm(10))
y <- X$X1 + X$X2 + X$X3 + rnorm(10)

# Add some missing values
X$X1[3] <- NaN
X$X3[5] <- NaN

test_that("Missing values should return an error", {
  expect_error(LinearRegression(X, y))
})


### Test error when there is no numeric feature
# Generate small data to test our function
X <- data.frame('char' = rep('a', 10))

test_that("No numeric feature should return an error", {
  expect_error(LinearRegression(X, y))
})
