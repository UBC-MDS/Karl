\name{LinearRegression}
\alias{LinearRegression}
\title{Linear Regression}
\description{
This function returns a list object containing the weights,
fitted values, and residuals from fitting a linear regression
of y on X.

It supports a continuous response and several continuous features.
}
\usage{LinearRegression(X, y)}
\arguments{
\item{X}{a dataframe containing continuous features,}
\item{y}{a numeric vector of same length containing the response.}
}
\value{
A list containing:
\item{weights}{the estimates of the parameters of the linear regression,}
\item{fitted}{the fitted values,}
\item{residuals}{the residuals.}
}
\author{Maud Boucherit}
\seealso{Karl::eda, Karl::plot_karl}
\examples{...}
