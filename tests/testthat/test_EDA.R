# EDA_test.R
# March 2018
#
# This script tests the function from EDA.R.

## Packages
library(tidyr)

### Test EDA(explanatory data analysis) 
## for multiple continuous features(X with three features) and a continous response(y)
# Generate small data to test our function

set.seed(4)
X <- data.frame('ones' = rep.int(1, times = length(y)), 
                'X1' = rnorm(10), 
                'X2' = rnorm(10),
                'X3' = rnorm(10))
y <- X$X1 + X$X2 + X$X3 + rnorm(10)

# get EDA summary for the data
summary <- EDA(X, y)

# True value of the mean, variance and quantiles:
# `mean`, `var` and `quantile` are built-in R functions that I will compare results.

# mean values:
X1_mean <- mean(X$X1)
X2_mean <- mean(X$X2)
X3_mean <- mean(X$X3)
y_mean <- mean(y)

# variance values:
X1_var <- var(X$X1)
X2_var <- var(X$X2)
X3_var <- var(X$X3)
y_var <- var(y)

## quantiles 

# 0% (minimum) : 
X1_min <- quantile(X$X1)[1]
X2_min <- quantile(X$X2)[1]
X3_min <- quantile(X$X3)[1]
y_min <- quantile(y)[1]


# 25%
X1_quantile25 <- quantile(X$X1)[2]
X2_quantile25 <- quantile(X$X2)[2]
X3_quantile25 <- quantile(X$X3)[2]
y_quantile25 <- quantile(y)[2]

# 50%
X1_quantile50 <- quantile(X$X1)[3]
X2_quantile50 <- quantile(X$X2)[3]
X3_quantile50 <- quantile(X$X3)[3]
y_quantile50 <- quantile(y)[3]

# 75%
X1_quantile75 <- quantile(X$X1)[4]
X2_quantile75 <- quantile(X$X2)[4]
X3_quantile75 <- quantile(X$X3)[4]
y_quantile75 <- quantile(y)[4]

# 100% (maximum) : 

X1_max <- quantile(X$X1)[5]
X2_max <- quantile(X$X2)[5]
X3_max <- quantile(X$X3)[5]
y_max <- quantile(y)[5]



test_that("Testing EDA for multi continuous feature", {
  expect_match(typeof(summary), 'list') # type of a dataframe is seen as list in R
  expect_match(typeof(summary), 'data.frame') # dataframe's class is 'data.frame'
  expect_match(colnames(summary), c('mean', 'variance', 'min', 'quantile25','quantile50','quantile75', 'max')) 
  
  expect_equal(summary$mean[1], y_mean)
  expect_equal(summary$mean[2], X1_mean)
  expect_equal(summary$mean[3], X2_mean)
  expect_equal(summary$mean[4], X3_mean)
  
  expect_equal(summary$variance[1], y_var)
  expect_equal(summary$variance[2], X1_var)
  expect_equal(summary$variance[3], X2_var)
  expect_equal(summary$variance[4], X3_var)

  expect_equal(summary$min[1], y_min)
  expect_equal(summary$min[2], X1_min)
  expect_equal(summary$min[3], X2_min)
  expect_equal(summary$min[4], X3_min)
    
  expect_equal(summary$quantile25[1], y_quantile25)
  expect_equal(summary$quantile25[2], X1_quantile25)
  expect_equal(summary$quantile25[3], X2_quantile25)
  expect_equal(summary$quantile25[4], X3_quantile25)
  
  
  expect_equal(summary$quantile50[1], y_quantile50)
  expect_equal(summary$quantile50[2], X1_quantile50)
  expect_equal(summary$quantile50[3], X2_quantile50)
  expect_equal(summary$quantile50[4], X3_quantile50)
  
  
  expect_equal(summary$quantile75[1], y_quantile75)
  expect_equal(summary$quantile75[2], X1_quantile75)
  expect_equal(summary$quantile75[3], X2_quantile75)
  expect_equal(summary$quantile75[4], X3_quantile75)
  
  expect_equal(summary$max[1], y_max)
  expect_equal(summary$max[2], X1_max)
  expect_equal(summary$max[3], X2_max)
  expect_equal(summary$max[4], X3_max)
  
})

