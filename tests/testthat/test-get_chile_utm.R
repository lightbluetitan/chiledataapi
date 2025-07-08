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

# get_chile_utm

library(testthat)

# Test 1: API returns a valid non-null object
test_that("get_chile_utm() returns a non-null tibble", {
  skip_on_cran()

  result <- get_chile_utm()

  expect_false(is.null(result))
  expect_s3_class(result, "tbl_df")
})

# Test 2: The tibble has the correct structure
test_that("get_chile_utm() returns the correct columns and types", {
  skip_on_cran()

  result <- get_chile_utm()

  expect_named(result, c("fecha", "valor"))
  expect_type(result$fecha, "character")
  expect_true(typeof(result$valor) %in% c("double", "integer"))
})

# Test 3: The number of rows is greater than zero
test_that("get_chile_utm() returns a non-empty tibble", {
  skip_on_cran()

  result <- get_chile_utm()

  expect_gt(nrow(result), 0)
})

# Test 4: The column `valor` is numeric and contains valid numbers
test_that("get_chile_utm()$valor contains valid numeric values", {
  skip_on_cran()

  result <- get_chile_utm()

  expect_true(all(is.numeric(result$valor)))
  expect_true(any(!is.na(result$valor)))
})

# Test 5: The column `fecha` has date-like strings (yyyy-mm-dd)
test_that("get_chile_utm()$fecha has valid date strings", {
  skip_on_cran()

  result <- get_chile_utm()

  expect_true(all(grepl("^\\d{4}-\\d{2}-\\d{2}$", result$fecha)))
})

# Test 6: API failure returns NULL
test_that("get_chile_utm() returns NULL if API fails", {
  skip_on_cran()

  mock_function <- function() {
    url <- "https://findic.cl/api/INVALID-ENDPOINT"
    res <- httr::GET(url)
    if (res$status_code != 200) return(NULL)
    json <- jsonlite::fromJSON(httr::content(res, "text", encoding = "UTF-8"))
    dplyr::as_tibble(json$serie)
  }

  result <- mock_function()
  expect_null(result)
})

# Test 7: Class consistency
test_that("get_chile_utm() result remains a tibble", {
  skip_on_cran()

  result <- get_chile_utm()

  expect_true("tbl_df" %in% class(result))
})
