# ChileDataAPI - Access Chilean Data via APIs and Curated Datasets
# Version 0.1.0
# Copyright (C) 2025 Renzo Caceres Rossi
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

#' Get Unidad de Fomento (UF) from the findic.cl API
#'
#' This function retrieves the Unidad de Fomento (UF) daily values in Chilean Pesos
#' from the API endpoint: \url{https://findic.cl/api/uf}. The data is provided by the
#' Chilean website \href{https://findic.cl}{findic.cl}.
#'
#' The values returned by the API include metadata and a time series of daily UF values.
#' The names of the variables and the values are in Spanish, exactly as provided by the API.
#' For example, the result includes columns named \code{fecha} (date) and \code{valor} (value).
#'
#' @return A tibble (data frame) with the following columns:
#' \itemize{
#'   \item \code{fecha}: Fecha del valor observado (in "YYYY-MM-DD" format).
#'   \item \code{valor}: Valor diario de la UF en pesos chilenos (numeric).
#' }
#'
#' @details
#' The function sends a GET request to the \code{/api/uf} endpoint. If the request is successful (HTTP 200),
#' it parses the JSON response and extracts the time series data under the key \code{serie}.
#'
#' All names and values are kept in Spanish as provided by the API and no translation or modification is applied.
#'
#' @examples
#' \dontrun{
#' uf_data <- get_chile_uf()
#' head(uf_data)
#' }
#'
#' @note Requires internet connection. The function returns the values exactly as provided in Spanish.
#'
#' @seealso \code{\link[httr]{GET}}, \code{\link[jsonlite]{fromJSON}}, \code{\link[dplyr]{as_tibble}}
#'
#' @importFrom httr GET
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble
#'
#' @export
get_chile_uf <- function() {
  url <- "https://findic.cl/api/uf"

  res <- httr::GET(url)

  if (res$status_code != 200) {
    message(paste("Error: Received status code", res$status_code))
    return(NULL)
  }

  json <- jsonlite::fromJSON(httr::content(res, "text", encoding = "UTF-8"))

  serie <- json$serie

  df <- dplyr::as_tibble(serie)

  return(df)
}
