% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/reader.R
\name{parse_mcdus}
\alias{parse_mcdus}
\title{Parse downloaded Mortality Multiple Cause Files.}
\usage{
parse_mcdus(years = NULL, read_from_wd = FALSE)
}
\arguments{
\item{years}{(optional) A character vector of years to parse.}

\item{read_from_wd}{(optional) If TRUE, data files are loaded from
the working directory.}
}
\value{
A list of tibbles.
}
\description{
Parse downloaded Mortality Multiple Cause Files from \insertCite{mcd}{mcdus}.
}
\references{
\insertRef{mcd}{mcdus}
}
