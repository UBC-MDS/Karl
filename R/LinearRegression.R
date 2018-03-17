# LinearRegression.R
# March 2018
#
# This script builds a Linear regression method to analyse data.
# It supports a continuous response and several continuous features.
#
# Dependencies:
#
# Usage:

## Packages:
require(tidyverse)
require(dplyr)

## Constructor
# This function returns a list object containing the weights,
# fitted values, and residuals from fitting a linear regression
# of y on X.
#
# Arguments:
#   X: a dataframe containing continuous features
#   y: a numeric vector of same length containing the response
#
# Values: a list containing
#   weights: the estimates of the parameters of the linear regression
#   fitted: the fitted values
#   residuals: the residuals.
##
LinearRegression <- function(X, y) {
  # Check the type of the features and select the numeric ones
  cols <- (sapply(X, typeof) %in% c('double', 'integer', 'numeric'))
  X_mat <- X %>% select(names(X)[cols])
  if (sum(cols) == 0) {stop("You need at least one continuous features")}
  
  # Check for missing values
  if (any(is.na(X_mat))) {stop("Some of your numeric features contain missing values. Please deal with them (remove, impute...) before using this function.")}
  
  # Add an intercept column and convert the data frame in a matrix
  X_mat <- cbind("intercept"=1, X_mat)
  X_mat <- as.matrix(X_mat)

  # Set hyperparameters
  alpha <- 0.0001
  n_iter <- 1000000
  n <- nrow(X_mat)
  d <- ncol(X_mat)

  # The gradient of the squared error

  ols_grad <- function(w) {t(X_mat)%*%(X_mat%*%w - y)}
  

  # A norm function for Frobenius
  norm <- function(x) {sum(abs(x))}

  # Update the weights using gradient method
  weights <- rep(0, times = d); i <- 0; grad <- 1
  while(i < n_iter & norm(grad) > 1e-7) {
    grad <- ols_grad(weights); i <- i + 1
    weights <- weights - alpha*grad
  }

  # Calculate the fitted values
  fit <- X_mat%*%weights

  # Calculate the residuals
  res <- y - fit

  return(list("weights"=weights, "fitted"=fit, "residuals"=res))
}

