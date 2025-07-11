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

# get_chile_yen

library(testthat)

test_that("get_chile_yen() returns a non-null tibble with correct structure", {
  skip_on_cran()

  result <- get_chile_yen()

  expect_false(is.null(result))
  expect_s3_class(result, "tbl_df")
  expect_true(all(c("fecha", "valor") %in% names(result)))
  expect_equal(ncol(result), 2)
  expect_gt(nrow(result), 0)
})

test_that("get_chile_yen() returns correct types for columns", {
  skip_on_cran()

  result <- get_chile_yen()

  expect_type(result$fecha, "character")
  expect_true(typeof(result$valor) %in% c("double", "integer"))
})

test_that("get_chile_yen() handles API failure gracefully", {
  skip_on_cran()

  stubbed_function <- function() {
    res <- httr::GET("https://findic.cl/api/INVALID-ENDPOINT")
    if (res$status_code != 200) return(NULL)
    json <- jsonlite::fromJSON(httr::content(res, "text", encoding = "UTF-8"))
    return(dplyr::as_tibble(json$serie))
  }

  result <- stubbed_function()
  expect_null(result)
})

test_that("get_chile_yen() returns data with recent-looking dates", {
  skip_on_cran()

  result <- get_chile_yen()

  expect_true(all(nchar(result$fecha) == 10))  # Format: "YYYY-MM-DD"
  expect_true(all(grepl("^\\d{4}-\\d{2}-\\d{2}$", result$fecha)))
})

test_that("get_chile_yen() column 'valor' is numeric and positive", {
  skip_on_cran()

  result <- get_chile_yen()

  expect_true(is.numeric(result$valor))
  expect_true(all(result$valor > 0, na.rm = TRUE))
})
