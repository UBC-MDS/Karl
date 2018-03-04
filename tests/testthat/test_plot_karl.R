# Test plot_karl function
# March 2018

context("Testing plot_karl")

test_that("plot_karl(): returns various plots using the linear model object", {

  # Sample linear model
  model <- lm(Petal.Width ~ Sepal.Length, data = iris)
  lm <- list(model$coefficients, model$fitted.values, model$residuals)

  # Sample plot
  base_plot <- ggplot(data=iris, aes(x = Sepal.Length, y = Sepal.Width))
  scatter <- base_plot + geom_point(aes(color=Species, shape=Species)) +
    xlab("Sepal Length") +  ylab("Sepal Width") +
    ggtitle("Sepal Length-Width")

  # expected inputs:
  expect_match(typeof(lm), "list") # checks to see if the linear model is the right type
  expect_match(names(lm), c("coefficients", "fitted", "residuals")) # checks to see if all the right content are in the linear model object.

  # expected outputs:
  expect_match(typeof(scatter), "list") # Checks to see if the plotting type is correct
  expect_match(class(scatter), c("gg", "ggplot")) # Checks to see if the plot is the right class.

  # expected errors:
  # expect_error(plot_karl("something"), "Error: ggplot2 doesn't know how to deal with data of class character")

})
