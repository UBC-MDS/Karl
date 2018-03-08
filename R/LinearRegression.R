# LinearRegression.R
# March 2018
#
# This script builds a Linear regression method to analyse data.
# It supports a continuous response and several continuous features.
#
# Dependencies: 
#
# Usage: 

## Packages
library(matlib)

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
  # Convert the data frame in a matrix
  X_mat <- as.matrix(X)
  
  # Compute the OLS estimator
  beta <- inv(t(X_mat)%*%X_mat)%*%t(X_mat)%*%y
  
  # Calculate the fitted values
  fit <- X_mat%*%beta
  
  # Calculate the residuals
  res <- y - fit
  
  return(list("weights"=beta, "fitted"=fit, "residuals"=res))
}
