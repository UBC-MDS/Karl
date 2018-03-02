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
  expect_match(typeof(lm), "list")
  expect_match(names(lm), c("coefficients", "fitted", "residuals"))

  # expected outputs:
  expect_match(typeof(scatter), "list")
  expect_match(class(scatter), c("gg", "ggplot"))

  # expected errors:
  # expect_error(plot_karl("something"), "Error: ggplot2 doesn't know how to deal with data of class character")

})
