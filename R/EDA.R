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
# Expected Output:  
#
#  |   _    | mean  | variance | min | quantile25 | quantile50 | quantile75 | max |
#  |-------|-------|----------|-----|------------|------------|------------|-----|
#  |   y   |   ... |  ...     | ... |    ...     |     ...    |     ...    | ... | 
#  |   X1  |   ... |  ...     | ... |    ...     |     ...    |     ...    | ... |
#  |   X2  |   ... |  ...     | ... |    ...     |     ...    |     ...    | ... |
#  |   X3  |   ... |  ...     | ... |    ...     |     ...    |     ...    | ... |

EDA <- function(X, y) {
  # Check the type of the features and select the numeric ones: 
  cols <- (sapply(X, typeof) %in% c('double', 'integer', 'numeric'))
  X <- X %>% select(names(X)[cols])
  if (sum(cols) > 0) {stop("You do not have any numerical feature to summarize")}
  
  # bind the numerical features and response variable to summarize: 
  allData <- cbind(y, X)
  
  # make a summary data.frame:
  summary <- do.call(data.frame, 
                     list(mean = apply(allData, 2, mean),
                          variance = apply(allData, 2, var),
                          min = apply(allData, 2, min),
                          quantile25 = apply(allData, 2,FUN = quantile, probs = 0.25),
                          median = apply(allData, 2, median),
                          quantile75 = apply(allData, 2,FUN = quantile, probs = 0.75),
                          max = apply(allData, 2, max)))
 return(summary)
}


### reference for the do.call structure used in function :
### https://stackoverflow.com/questions/20997380/creating-a-summary-statistical-table-from-a-data-frame



