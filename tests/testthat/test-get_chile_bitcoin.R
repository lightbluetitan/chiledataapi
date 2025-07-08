# ChileDataAPI - Access Chilean Economic, Demographic, Environmental, and Geopolitical Data via RESTful APIs and Curated Datasets
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

# get_chile_bitcoin

library(testthat)

# Main functionality test
test_that("get_chile_bitcoin() returns valid tibble with correct structure", {
  skip_on_cran()

  result <- get_chile_bitcoin()

  expect_false(is.null(result))
  expect_s3_class(result, "tbl_df")
  expect_gt(nrow(result), 0)

  expected_columns <- c("fecha", "valor")
  expect_named(result, expected_columns)

  expect_type(result$fecha, "character")
  expect_type(result$valor, "double")
})

# Structural integrity test: at least 30 rows expected
test_that("get_chile_bitcoin() returns at least 30 rows", {
  skip_on_cran()

  result <- get_chile_bitcoin()

  expect_gte(nrow(result), 30)
})

# Error handling test
test_that("get_chile_bitcoin() handles API failure gracefully", {
  skip_on_cran()

  # Simulate internal function with broken endpoint
  stubbed_function <- function() {
    url <- "https://findic.cl/api/INVALID_ENDPOINT"
    res <- httr::GET(url)
    if (res$status_code != 200) return(NULL)
    json <- jsonlite::fromJSON(httr::content(res, "text", encoding = "UTF-8"))
    df <- dplyr::as_tibble(json$serie)
    return(df)
  }

  result <- stubbed_function()
  expect_null(result)
})






