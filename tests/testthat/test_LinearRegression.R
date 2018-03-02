# LinearRegression_test.R
# March 2018
#
# This script test the methods from the LinearRegression.R script.

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
  expect_match
  expect_equal(model$weights$X1, beta)
  expect_equal(model$weights$intercept, alpha)
  expect_equal(model$fitted, fitted)
  expect_equal(model$residuals, res)
})

