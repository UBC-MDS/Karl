# Karl

[![Build Status](https://travis-ci.org/UBC-MDS/Karl.svg?branch=master)](https://travis-ci.org/UBC-MDS/Karl)

This R package is a Linear Regression tool.

## Group Members:
Maud Boucherit:  [Personal Github](https://github.com/MaudBoucherit)  
Ted Haley: [Personal Github](https://github.com/TedHaley)  
Cem Sinan Ozturk:  [Personal Github](https://github.com/cemsinano)  

## Description:
This package will take a dataset with a continuous reponse variable and various continous explanatory variables, and provide the user with several functions to bulid a linear regression model. The fit of the regression can be tested using the diagnosis (residual) plots returned by the plotting function.

## Functions:  
#### Summary of Data: (input: X, y)    
This function will return a table containing various statistics from the provided dataset. These statistics include the mean, variance, minimum, maximum and quantile (25, 50 and 75) values for continuous variables.

#### Model Fit: (input: X, y)  
This function will return the model object containing the coefficients for the linear model, fitted values, and residuals.

#### Residual Plot: (input: Model Object)
This function takes the linear model object as an input and returns the QQ Plot and the Residual vs. Fitted Values plot.

## Ecosystem:
Our package runs similarly to functions that already exist in R and Python, however they are different in how they output the results to the user. The purpose of this package is to have an easier transition between working with Linear Models between R and Python.

The statistics from summary of data function are returned to the user as a list of dataframes, as oppose to string that is returned by the base R summary function.

The model fit function works similarly to the 'lm' function of the stats R package as they both return a model object containing various model parameters. The Linear Model function in included in Karl returns a list of lists including the coefficients for the linear model, fitted values, and residuals.

The residual plot function is a method for the model class that returns two plots specific to the residual. There are functions that exist to plot both the residual-fitted plot and the QQ-plot, however the function from the Karl package combines these two plots in one function, displaying both plots in tandem.

## Installation:
To install Karl, follow these instructions:  
1. Ensure `devtools` is installed. If not, open the console and input the following: `install.packages("devtools")` to install devtools from CRAN.  
2. Next, to install the `Karl` package, input the following into the console: `devtools::install_github("UBC-MDS/Karl")`
3. You're ready to start using `Karl`!

## Usage:
#### Summary of Data: `EDA(X, y)`   
This function will return a table containing various statistics from the provided dataset. These statistics include the mean, variance, minimum, maximum and quantile (25, 50 and 75) values for continuous variables.

Arguments:

  - X: a dataframe containing continuous features
  - y: a numeric vector of same length containing the response

Values: a dataframe containing

  - mean: the mean for response (y) and features (X)
  - variance: the variance for response (y) and features (X)
  - quantiles: the 25-50-75 quantiles for response (y) and features (X)
  - min: the minimum value for response (y) and features (X)
  - max: the maximum value for response (y) and features (X)

Usage:

```
library(Karl)
EDA(X,y)
```

#### Model Fit: `LinearRegression(X, y)`

 This function returns a list object containing the weights, fitted values, and residuals from fitting a linear regression  of y on X.

Arguments:

   - X: a dataframe containing continuous features
   - y: a numeric vector of same length containing the response

Values: a list containing

  - weights: the estimates of the parameters of the linear regression
  - fitted: the fitted values
  - residuals: the residuals

Usage:

```
library(Karl)
X <- iris$Sepal.Length
y <– iris$Sepal.Width
LinearRegression(X, y)
```

#### Residual Plot: `plot_karl((input: Model Object))`

This function is used to plot the linear model object from the LinearRegression function. The linear model object is a list of lists that includes weights, fitted values, and residuals. This function will return 2 types of plots, which include:

  - Residuals vs Fitted Plot
  - Normal Q-Q Plot

Arguments:

  - lm object: a list of lists containing:
  	- weights: the estimates of the parameters of the linear regression
  	- fitted: the fitted values
  	- residuals: the residuals.

Value:

  - Residuals vs Fitted Plot
  - Normal Q-Q Plot

Usage:

```
library(Karl)
lm <- LinearRegression(X, y)
plot_karl(lm)
```
