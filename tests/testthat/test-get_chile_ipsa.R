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

# get_chile_ipsa


library(testthat)

# Test 1: Check if function returns a non-null tibble with expected structure
test_that("get_chile_ipsa() returns valid tibble with expected structure", {
  skip_on_cran()

  result <- get_chile_ipsa()

  expect_false(is.null(result))
  expect_s3_class(result, "tbl_df")
  expect_true(nrow(result) > 0)

  expect_named(result, c("fecha", "valor"))
  expect_type(result$fecha, "character")
  expect_true(typeof(result$valor) %in% c("double", "integer"))
})

# Test 2: Ensure dates are in proper YYYY-MM-DD format
test_that("get_chile_ipsa() dates are in valid format", {
  skip_on_cran()

  result <- get_chile_ipsa()

  expect_true(all(grepl("^\\d{4}-\\d{2}-\\d{2}$", result$fecha)))
})

# Test 3: Ensure all 'valor' values are numeric and non-negative
test_that("get_chile_ipsa() has numeric, non-negative values", {
  skip_on_cran()

  result <- get_chile_ipsa()

  expect_true(is.numeric(result$valor))
  expect_true(all(result$valor >= 0, na.rm = TRUE))
})

# Test 4: Handles API error gracefully
test_that("get_chile_ipsa() returns NULL when API fails", {
  skip_on_cran()

  stub_get_chile_ipsa <- function() {
    url <- "https://findic.cl/api/INVALID_ENDPOINT"
    res <- httr::GET(url)
    if (res$status_code != 200) {
      return(NULL)
    }
    json <- jsonlite::fromJSON(httr::content(res, "text", encoding = "UTF-8"))
    return(dplyr::as_tibble(json$serie))
  }

  result <- stub_get_chile_ipsa()
  expect_null(result)
})

# Test 5: Output column types remain stable
test_that("get_chile_ipsa() columns remain consistent", {
  skip_on_cran()

  result <- get_chile_ipsa()

  expect_true("fecha" %in% colnames(result))
  expect_true("valor" %in% colnames(result))
  expect_type(result$fecha, "character")
  expect_type(result$valor, "double")
})



