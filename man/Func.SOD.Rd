% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/HighDimOut.R
\name{Func.SOD}
\alias{Func.SOD}
\title{Subspace outlier detection (SOD) algorithm}
\usage{
Func.SOD(data, k.nn, k.sel, alpha = 0.8)
}
\arguments{
\item{data}{is the data frame containing the observations. Each row represents an observation and each variable is stored in one column.}

\item{k.nn}{specifies the value used for calculating the shared nearest neighbors. Note that k.nn should be greater than k.sel.}

\item{k.sel}{specifies the number shared nearest neighbors. It can be interpreted as the number of reference set for constructing the subspace hyperplane.}

\item{alpha}{specifies the lower limit for selecting subspace. 0.8 is set as default as suggested in the original paper.}
}
\value{
The function returns a vector containing the SOD outlier scores for each observation
}
\description{
This function performs suspace outlier detection algorithm
The implemented method is based on the work of Krigel, H.P., Kroger, P., Schubert, E., Zimek, A., Outlier detection in axis-parallel subspaces of high dimensional data, 2009.
}
\examples{
library(ggplot2)
res.SOD <- Func.SOD(data = TestData[,1:2], k.nn = 10, k.sel = 5, alpha = 0.8)
data.temp <- TestData[,1:2]
data.temp$Ind <- NA
data.temp[order(res.SOD, decreasing = TRUE)[1:10],"Ind"] <- "Outlier"
data.temp[is.na(data.temp$Ind),"Ind"] <- "Inlier"
data.temp$Ind <- factor(data.temp$Ind)
ggplot(data = data.temp) + geom_point(aes(x = x, y = y, color=Ind, shape=Ind))
}

