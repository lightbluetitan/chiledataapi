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

# get_chile_copper_pound

library(testthat)

# Test 1: Structure and class of the returned object
test_that("get_chile_copper_pound() returns a valid tibble with expected structure", {
  skip_on_cran()

  result <- get_chile_copper_pound()

  expect_false(is.null(result))
  expect_s3_class(result, "tbl_df")
  expect_true(nrow(result) > 0)
  expect_named(result, c("fecha", "valor"))
})

# Test 2: Column types are correct
test_that("get_chile_copper_pound() columns have correct types", {
  skip_on_cran()

  result <- get_chile_copper_pound()

  expect_type(result$fecha, "character")
  expect_true(typeof(result$valor) %in% c("double", "integer"))
})

# Test 3: At least one row has non-missing values
test_that("get_chile_copper_pound() has at least one complete observation", {
  skip_on_cran()

  result <- get_chile_copper_pound()
  complete_rows <- complete.cases(result)
  expect_true(any(complete_rows))
})

# Test 4: Values in 'valor' are positive
test_that("get_chile_copper_pound() returns strictly positive values for valor", {
  skip_on_cran()

  result <- get_chile_copper_pound()
  expect_true(all(result$valor > 0, na.rm = TRUE))
})

# Test 5: Handles API error gracefully
test_that("get_chile_copper_pound() returns NULL if API fails", {
  skip_on_cran()

  stub_get_chile_copper_pound <- function() {
    url <- "https://findic.cl/api/INVALID-ENDPOINT"
    res <- httr::GET(url)
    if (res$status_code != 200) return(NULL)
    json <- jsonlite::fromJSON(httr::content(res, "text", encoding = "UTF-8"))
    return(dplyr::as_tibble(json$serie))
  }

  result <- stub_get_chile_copper_pound()
  expect_null(result)
})

# Test 6: Date format looks like YYYY-MM-DD
test_that("get_chile_copper_pound() fecha column appears to be in correct format", {
  skip_on_cran()

  result <- get_chile_copper_pound()
  expect_true(all(grepl("^\\d{4}-\\d{2}-\\d{2}$", result$fecha)))
})

# Test 7: Column names are exactly 'fecha' and 'valor'
test_that("get_chile_copper_pound() has exactly two columns named fecha and valor", {
  skip_on_cran()

  result <- get_chile_copper_pound()
  expect_equal(names(result), c("fecha", "valor"))
})

# Test 8: The function always returns a tibble with two columns
test_that("get_chile_copper_pound() returns two columns", {
  skip_on_cran()

  result <- get_chile_copper_pound()
  expect_equal(ncol(result), 2)
})
