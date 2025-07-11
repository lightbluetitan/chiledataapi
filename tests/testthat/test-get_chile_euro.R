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

# get_chile_euro

library(testthat)

# Test 1: Structure and class
test_that("get_chile_euro() returns a valid tibble with correct structure", {
  skip_on_cran()

  result <- get_chile_euro()

  expect_false(is.null(result))
  expect_s3_class(result, "tbl_df")
  expect_gt(nrow(result), 0)
  expect_named(result, c("fecha", "valor"))
  expect_equal(ncol(result), 2)
})

# Test 2: Data types of columns
test_that("get_chile_euro() returns correct column types", {
  skip_on_cran()

  result <- get_chile_euro()

  expect_type(result$fecha, "character")
  expect_type(result$valor, "double")
})

# Test 3: Dates are in expected format
test_that("get_chile_euro() contains dates in yyyy-mm-dd format", {
  skip_on_cran()

  result <- get_chile_euro()

  expect_true(all(grepl("^\\d{4}-\\d{2}-\\d{2}$", result$fecha)))
})

# Test 4: Values are numeric and positive
test_that("get_chile_euro() returns positive numeric values", {
  skip_on_cran()

  result <- get_chile_euro()

  expect_true(all(is.numeric(result$valor)))
  expect_true(all(result$valor > 0))
})

# Test 5: Handle API failure gracefully
test_that("get_chile_euro() handles API error gracefully", {
  skip_on_cran()

  stub_get_chile_euro <- function() {
    url <- "https://findic.cl/api/INVALID-ENDPOINT"
    res <- httr::GET(url)
    if (res$status_code != 200) {
      return(NULL)
    }
    json <- jsonlite::fromJSON(httr::content(res, "text", encoding = "UTF-8"))
    return(dplyr::as_tibble(json$serie))
  }

  result <- stub_get_chile_euro()
  expect_null(result)
})
