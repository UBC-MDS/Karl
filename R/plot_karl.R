# plot_karl.R
# March 2018
#
# This script makes various dianostic plots for linear regression analysis.
# It supports a continuous response and several continuous features.
# The plots to be outputted include:
# -Residuals vs Fitted
# -Q-Q Plot
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
require(gridExtra)

## plot_karl
# This function is used to plot the linear model object from the LinearRegression function.
# The linear model object is a list of lists that includes weights, fitted values, and residuals.
# This function will return 2 types of plots, which include:
#   -Residuals vs Fitted Plot
#   -Q-Q Plot
#
# Arguments:
#   -lm object: a list of lists containing:
#     -weights: the estimates of the parameters of the linear regression
#     -fitted: the fitted values
#     -residuals: the residuals.
#
# Value:
#   -Residuals vs Fitted Plot
#   -Q-Q Plot


plot_karl <- function(lm) {

  # Error Handling:
  # lm object can't be null
  if (is.null(lm)){
    stop("Linear Model Object should contain numbers and should not be null")
  }

  # lm object must be type list
  if (typeof(lm) != "list"){
    stop("Linear Model Object must be type list")
  }

  # lm object names
  if (("fitted" %in% names(lm)) == FALSE ){
    stop("'fitted' not found in Linear Model Object")
  }

  # lm object names
  if (("residuals" %in% names(lm)) == FALSE ){
    stop("'residuals' not found in Linear Model Object")
  }

  # Number of residuals and fitted values must match
  if (length(lm$fitted) != length(lm$residuals)){
    stop("Number of residuals and fitted values do not match")
  }

  # Number of residuals and fitted values must be greater than 1
  if (length(lm$fitted) < 1){
    stop("Number of residuals and fitted values must be greater than 1.")
  }

  if (length(lm$residuals) < 1){
    stop("Number of residuals and fitted values must be greater than 1.")
  }

  # breakdown the input
  fit <- lm$fitted
  res <- lm$residuals
  lm <- as.data.frame(cbind(fit, res))
  names(lm) <- c("fitted", "residuals")

  # Calculate the quantiles for the line in Normal QQ Plot
  x_qqline <- qnorm(c(0.25, 0.75))
  y_qqline <- quantile(lm$residuals[!is.na(lm$residuals)], c(0.25, 0.75))

  # Slope and Intercept for the Quantile Normal Line
  slope_qqline <- diff(y_qqline) / diff(x_qqline) # rise over run
  int_qqline <- y_qqline[1] - slope_qqline * x_qqline[1]

  # Residual vs Fitted Plot
  resfit <- ggplot(data = lm, aes(x = fitted, y = residuals)) +
    geom_point(alpha = 0.5) +
    geom_hline(yintercept = 0, colour = "red") +
    ggtitle("Residual vs Fitted Values Plot")+
    xlab("Fitted Values") +
    ylab("Residuals") +
    theme_minimal() +
    theme(plot.title = element_text(hjust = 0.5))

  # Normal QQ Plot
  qqplot <- ggplot(data = lm, aes(sample = residuals)) +
    stat_qq(alpha = 0.5) +
    geom_abline(slope = slope_qqline, intercept = int_qqline, color = "red") +
    ggtitle("Normal QQ Plot") +
    xlab("Theoretical Quantiles") +
    ylab("Experimental Quantiles") +
    theme_minimal() +
    theme(plot.title = element_text(hjust = 0.5))

  plots <- grid.arrange(resfit, qqplot, newpage = T)

  return(plots)
}


