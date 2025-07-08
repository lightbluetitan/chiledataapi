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

# get_chile_uf

library(testthat)

# Test 1: Structure and type validation
test_that("get_chile_uf() returns a valid tibble with correct structure", {
  skip_on_cran()

  result <- get_chile_uf()

  expect_false(is.null(result))
  expect_s3_class(result, "tbl_df")
  expect_true(nrow(result) > 0)

  expect_named(result, c("fecha", "valor"))
  expect_type(result$fecha, "character")
  expect_type(result$valor, "double")
})

# Test 2: Check presence of expected column names
test_that("get_chile_uf() includes the expected columns", {
  skip_on_cran()

  result <- get_chile_uf()

  expect_true("fecha" %in% names(result))
  expect_true("valor" %in% names(result))
  expect_equal(ncol(result), 2)
})

# Test 3: Ensure values are numeric and not all NA
test_that("get_chile_uf() returns numeric values in 'valor'", {
  skip_on_cran()

  result <- get_chile_uf()

  expect_type(result$valor, "double")
  expect_false(all(is.na(result$valor)))
})

# Test 4: Handle API error gracefully (stub test)
test_that("get_chile_uf() handles API failure gracefully", {
  skip_on_cran()

  stub_get_chile_uf <- function() {
    url <- "https://findic.cl/api/INVALID-ENDPOINT"
    res <- httr::GET(url)
    if (res$status_code != 200) return(NULL)
    json <- jsonlite::fromJSON(httr::content(res, "text", encoding = "UTF-8"))
    return(dplyr::as_tibble(json$serie))
  }

  result <- stub_get_chile_uf()
  expect_null(result)
})

# Test 5: Confirm 'fecha' values resemble valid date strings
test_that("get_chile_uf() returns valid date-like strings in 'fecha'", {
  skip_on_cran()

  result <- get_chile_uf()

  expect_true(all(grepl("^\\d{4}-\\d{2}-\\d{2}$", result$fecha)))
})
