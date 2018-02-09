# Karl
This R package is a Linear Regression tool.

## Group Members:
Maud Boucherit:  [Personal Github](https://github.com/MaudBoucherit)  
Ted Haley: [Personal Github](https://github.com/TedHaley)  
Cem Sinan Ozturk:  [Personal Github](https://github.com/cemsinano)  

## Description:
This package will take a dataset with a continuous reponse variable and various explanatory variables (either continuous, discrete, or categorical), and provide the user with several functions to bulid a linear regression model. 

## Functions:  
#### Summary of Data: (input: X, y)    
This function will return a table containing various statistics from the provided dataset. These statistics include the mean, variance, quantile for continuous variables, mode, number of levels (for categorical data), etc. 

#### Model Fit: (input: X, y)  
This function will return the model object containing the coefficients for the linear model, corresponding p-value, and confidence interval.

#### Residual Plot: (input: Model Object) 
This function takes the calculated residuals from the model object and will display both the residuals by fitted values, and the QQ plot for the residuals.

## Ecosystem:
Our package runs similarly to functions that already exist in R, however they are different in how they output the results to the user. 

The statistics from summary of data function are returned to the user as a list of dataframes, as oppose to string that is returned by the base R summary function. 

The model fit function works similarly to lm of the stats R package as they both return a model object containing various model parameters.

The residual plot function is a method for the model class that returns two plots specific to the residual. There are functions that exist to plot both the residual-fitted plot and the QQ-plot, however the function from the Karl package combines these two plots in one function, displaying both plots in tandem. 

