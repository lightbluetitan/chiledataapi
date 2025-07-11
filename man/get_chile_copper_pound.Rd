% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_chile_copper_pound.R
\name{get_chile_copper_pound}
\alias{get_chile_copper_pound}
\title{Get Observed Copper Price per Pound from the findic.cl API}
\usage{
get_chile_copper_pound()
}
\value{
A tibble (data frame) with the following columns:
\itemize{
  \item \code{fecha}: Fecha del valor observado (in format "YYYY-MM-DD").
  \item \code{valor}: Valor de la libra de cobre en dólares estadounidenses (numeric).
}
}
\description{
This function retrieves the observed daily value of the copper price per pound ("Libra de Cobre")
in U.S. Dollars from the API endpoint: \url{https://findic.cl/api/libra_cobre}.
The data is provided by the Chilean website \href{https://findic.cl}{findic.cl}.
}
\details{
The values returned by the API include metadata and a time series of daily prices.
The names of the variables and the values are in Spanish, exactly as provided by the API.
For example, the result includes columns named \code{fecha} (date) and \code{valor} (value).


The function sends a GET request to the \code{/api/libra_cobre} endpoint. If the request is successful (HTTP 200),
it parses the JSON response and extracts the time series data under the key \code{serie}.

All names and values are kept in Spanish as provided by the API and no translation or modification is applied.
}
\note{
Requires internet connection. The function returns the values exactly as provided in Spanish.
}
\examples{
\dontrun{
copper_data <- get_chile_copper_pound()
head(copper_data)
}

}
\seealso{
\code{\link[httr]{GET}}, \code{\link[jsonlite]{fromJSON}}, \code{\link[dplyr]{as_tibble}}
}
