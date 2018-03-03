\name{EDA}
\alias{EDA}
\title{EDA}
\description{This function returns a dataframe containing mean, variance and quantiles for each variables in the dataset.

It only supports a continuous response and several continuous features.
}
\usage{EDA(X, y)}
\arguments{
\item{X}{a dataframe containing continuous features,}
\item{y}{a numeric vector of same length containing the response.}
}
\value{
A dataframe containing:
\item{mean}{the mean for response(y) and features(X)}
\item{variance}{the variance for response(y) and features(X)}
\item{quantiles}{25-50-75 quantiles for response(y) and features(X)}
\item{min}{ the minimum value for response (y) and features (X)}
\item{max}{ the maximum value for response (y) and features (X)}

}
\author{Cem Sinan Ozturk}
\seealso{Karl::LinearRegression, Karl::plot_karl}
\examples{
library(Karl)

set.seed(4)

a mock data.frame to exemplify the usage and results

X <- data.frame('ones' = rep.int(1, times = length(y)), 
                'X1' = rnorm(10), 
                'X2' = rnorm(10),
                'X3' = rnorm(10))
y <- X$X1 + X$X2 + X$X3 + rnorm(10)

get EDA summary for the data:

EDA(X, y)

results will be presented in a dataframe: 

|       | mean  | variance | min | quantile25 | quantile50 | quantile75 | max |
|-------|-------|----------|-----|------------|------------|------------|-----|
|   y   |   ... |  ...     | ... |    ...     |     ...    |     ...    | ... | 
|   X1  |   ... |  ...     | ... |    ...     |     ...    |     ...    | ... |
|   X2  |   ... |  ...     | ... |    ...     |     ...    |     ...    | ... |
|   X3  |   ... |  ...     | ... |    ...     |     ...    |     ...    | ... |

}