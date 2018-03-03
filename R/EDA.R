# EDA.R
# March 2018
#
# This script contains a function producing an EDA (explanatory data analysis) summary of the data.
#
# The dataset with a continuous response variable and
# various continuous explanatory variables 
# 
# 
# Dependencies: tidyr (package)
#
# Usage:
# 
# library(Karl)
#
# EDA(X,y)
#

## Packages
require(tidyr)

## EDA
# This function returns a dataframe containing mean,
# variance and quantiles for each variables in the dataset
#
# Arguments:
#   X: a dataframe containing continuous features
#   y: a numeric vector of same length containing the response
#
# Values: a dataframe containing 
#   mean: the mean for response (y) and features (X)
#   variance: the variance for response (y) and features (X)
#   quantiles: the 25-50-75 quantiles for response (y) and features (X)
#   min: the minimum value for response (y) and features (X)
#   max: the maximum value for response (y) and features (X)
##
#   

EDA <- function(X, y) {
  return(NULL)
}