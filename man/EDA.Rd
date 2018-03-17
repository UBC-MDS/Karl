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
