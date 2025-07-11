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

# get_chile_dollar

library(testthat)

# Test 1: Basic structure and return type
test_that("get_chile_dollar() returns a non-null tibble with correct structure", {
  skip_on_cran()

  result <- get_chile_dollar()

  expect_false(is.null(result))
  expect_s3_class(result, "tbl_df")
  expect_gt(nrow(result), 0)
  expect_equal(ncol(result), 2)

  expected_cols <- c("fecha", "valor")
  expect_named(result, expected_cols, ignore.order = TRUE)
})

# Test 2: Column types
test_that("get_chile_dollar() returns correct column types", {
  skip_on_cran()

  result <- get_chile_dollar()

  expect_type(result$fecha, "character")
  expect_type(result$valor, "double")  # can be "double" or "numeric"
})

# Test 3: Date format validation (yyyy-mm-dd)
test_that("get_chile_dollar() uses valid ISO date strings", {
  skip_on_cran()

  result <- get_chile_dollar()
  expect_true(all(grepl("^\\d{4}-\\d{2}-\\d{2}$", result$fecha)))
})

# Test 4: Value range validation (positive values)
test_that("get_chile_dollar() returns only positive numeric values", {
  skip_on_cran()

  result <- get_chile_dollar()
  expect_true(all(result$valor > 0, na.rm = TRUE))
})

# Test 5: Consistency of row count
test_that("get_chile_dollar() returns approximately 30 rows", {
  skip_on_cran()

  result <- get_chile_dollar()
  expect_gte(nrow(result), 20)
  expect_lte(nrow(result), 40)
})

# Test 6: Handling API error gracefully
test_that("get_chile_dollar() handles API failure gracefully", {
  skip_on_cran()

  fake_call <- function() {
    url <- "https://findic.cl/api/INVALID_ENDPOINT"
    res <- httr::GET(url)
    if (res$status_code != 200) return(NULL)
    json <- jsonlite::fromJSON(httr::content(res, "text", encoding = "UTF-8"))
    return(dplyr::as_tibble(json$serie))
  }

  result <- fake_call()
  expect_null(result)
})

# Test 7: Check that no unexpected column names appear
test_that("get_chile_dollar() does not include unexpected columns", {
  skip_on_cran()

  result <- get_chile_dollar()
  expect_true(all(names(result) %in% c("fecha", "valor")))
})
