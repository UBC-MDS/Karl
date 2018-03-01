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
#

## Packages
require(ggplot2)

## plot_karl
# This function returns a list object containing the weights,
# fitted values, and residuals from fitting a linear regression
# of y on X.
#
# Arguments:
#   -lm: a list of lists containing:
#     -weights: the estimates of the parameters of the linear regression
#     -fitted: the fitted values
#     -residuals: the residuals.
#
# Output:
#   -Residuals vs Fitted Plot
#   -Normal Q-Q Plot
#   -Fitted vs True Value Plot(s)

plot_karl <- function(lm) {
  return(NULL)
}
