# plot_karl.R
# March 2018
#
# This script makes various dianostic plots for linear regression analysis.
# It supports a continuous response and several continuous features.
# The plots to be outputted include:
# -Residuals vs Fitted
# -Normal Q-Q
# -Fitted vs True Value Plot(s)
#
# Dependencies:
# linear model object from LinearRegression (function)
# ggplot2 (package)
#
# Usage:
# library(Karl)
# lm <- LinearRegression(X, y)
# plot_karl(lm)

## Packages
require(ggplot2)

## plot_karl
# This function is used to plot the linear model object from the LinearRegression function.
# The linear model object is a list of lists that includes weights, fitted values, and residuals.
# This function will return 3 types of plots, which include:
#   -Residuals vs Fitted Plot
#   -Normal Q-Q Plot
#   -Fitted vs True Value Plot(s)
#
# Arguments:
#   -lm object: a list of lists containing:
#     -weights: the estimates of the parameters of the linear regression
#     -fitted: the fitted values
#     -residuals: the residuals.
#
# Value:
#   -Residuals vs Fitted Plot
#   -Normal Q-Q Plot
#   -Fitted vs True Value Plot(s)

plot_karl <- function(lm) {
  return(NULL)
}
