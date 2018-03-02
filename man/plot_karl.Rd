\name{plot_karl}
\title{plot_karl}
\description{
Plots various diagnostic plots for the linear model object from the `Karl::LinearRegression` function.}
\usage{
## `lm` is the linear model object
## from the LinearRegression function

plot_karl(lm)}
\arguments{
linear model object: a list of lists containing:

     -weights: the estimates of the parameters of the linear regression

     -fitted: the fitted values

     -residuals: the residuals.}
\details{
This function is used to plot the linear model object from the LinearRegression function.
The linear model object is a list of lists that includes weights, fitted values, and residuals.
This function will return 3 types of plots, which include:

   -Residuals vs Fitted Plot

   -Normal Q-Q Plot

   -Fitted vs True Value Plot(s)}
\value{
-Residuals vs Fitted Plot

-Normal Q-Q Plot

-Fitted vs True Value Plot(s)
}
\author{Teddy Haley}
\seealso{LinearRegression, EDA}
\examples{
library(Karl)

X <- iris$Sepal.Length
y <- iris$Petal.Width

lm <- LinearRegression(X, y)

plot_karl(lm)
}
\keyword{plot}

# To fill the documentation,
# See link https://cran.r-project.org/doc/manuals/r-release/R-exts.html#Writing-R-documentation-files
