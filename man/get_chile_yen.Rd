% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_chile_yen.R
\name{get_chile_yen}
\alias{get_chile_yen}
\title{Get Observed Yen Exchange Rate from the findic.cl API}
\usage{
get_chile_yen()
}
\value{
A tibble (data frame) with the following columns:
\itemize{
  \item \code{fecha}: Fecha del valor observado (en formato "YYYY-MM-DD").
  \item \code{valor}: Valor del yen observado en pesos chilenos (numérico).
}
}
\description{
This function retrieves the observed exchange rate ("Yen (pesos por yen)") in Chilean Pesos
from the API endpoint: \url{https://findic.cl/api/yen}. The data is provided by the
Chilean website \href{https://findic.cl}{findic.cl}.
}
\details{
The values returned by the API include metadata and a time series of daily exchange rates.
The names of the variables and the values are in Spanish, exactly as provided by the API.
For example, the result includes columns named \code{fecha} (date) and \code{valor} (value).


The function sends a GET request to the \code{/api/yen} endpoint. If the request is successful (HTTP 200),
it parses the JSON response and extracts the time series data under the key \code{serie}.

All names and values are kept in Spanish as provided by the API and no translation or modification is applied.
}
\note{
Requires internet connection. The function returns the values exactly as provided in Spanish.
}
\examples{
\dontrun{
yen_data <- get_chile_yen()
head(yen_data)
}

}
\seealso{
\code{\link[httr]{GET}}, \code{\link[jsonlite]{fromJSON}}, \code{\link[dplyr]{as_tibble}}
}
