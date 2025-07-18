% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_chile_ipsa.R
\name{get_chile_ipsa}
\alias{get_chile_ipsa}
\title{Get IPSA (Índice de Precios Selectivo de Acciones) from the findic.cl API}
\usage{
get_chile_ipsa()
}
\value{
A tibble (data frame) with the following columns:
\itemize{
  \item \code{fecha}: Fecha de la observación (in "YYYY-MM-DD" format).
  \item \code{valor}: Valor del índice IPSA en puntos (numeric).
}
}
\description{
This function retrieves the historical values of the IPSA index ("Índice de Precios Selectivo de Acciones")
from the API endpoint: \url{https://findic.cl/api/ipsa}. The data is provided by the
Chilean website \href{https://findic.cl}{findic.cl}.
}
\details{
The values returned by the API include metadata and a time series of daily IPSA index values.
The names of the variables and the values are in Spanish, exactly as provided by the API.
For example, the result includes columns named \code{fecha} (date) and \code{valor} (value).


The function sends a GET request to the \code{/api/ipsa} endpoint. If the request is successful (HTTP 200),
it parses the JSON response and extracts the time series data under the key \code{serie}.

All names and values are kept in Spanish as provided by the API and no translation or modification is applied.
}
\note{
Requires internet connection. The function returns the values exactly as provided in Spanish.
}
\examples{
\dontrun{
ipsa_data <- get_chile_ipsa()
head(ipsa_data)
}

}
\seealso{
\code{\link[httr]{GET}}, \code{\link[jsonlite]{fromJSON}}, \code{\link[dplyr]{as_tibble}}
}
