# ChileDataAPI - Access Chilean Data via APIs and Curated Datasets
# Version 0.2.0
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

# get_chile_holidays

library(testthat)

test_that("get_chile_holidays() returns tibble with correct structure and types", {
  skip_on_cran()
  result <- get_chile_holidays(2025)
  expect_s3_class(result, "tbl_df")
  expect_named(result, c("date", "local_name", "name"))
  expect_equal(ncol(result), 3)
  expect_s3_class(result$date, "Date")
  expect_type(result$local_name, "character")
  expect_type(result$name, "character")
  expect_gt(nrow(result), 0) # should return some holidays
})

test_that("get_chile_holidays() dates belong to the requested year", {
  skip_on_cran()
  year <- 2025
  result <- get_chile_holidays(year)
  expect_true(all(format(result$date, "%Y") == as.character(year)))
})

test_that("get_chile_holidays() errors on invalid year inputs", {
  expect_error(get_chile_holidays("not_a_year"))
  expect_error(get_chile_holidays(999))   # Likely invalid year (too far past)
  expect_error(get_chile_holidays(3000))  # Future year, possibly no data
})

test_that("get_chile_holidays() returns consistent columns across calls", {
  skip_on_cran()
  res1 <- get_chile_holidays(2024)
  res2 <- get_chile_holidays(2025)
  expect_named(res1, c("date", "local_name", "name"))
  expect_named(res2, c("date", "local_name", "name"))
})

test_that("get_chile_holidays() returns a reasonable number of holidays", {
  skip_on_cran()
  result <- get_chile_holidays(2025)
  # Chile typically has 15-20 official holidays
  expect_true(nrow(result) >= 15)
  expect_true(nrow(result) <= 25)
})

test_that("get_chile_holidays() returns no missing values in required columns", {
  skip_on_cran()
  result <- get_chile_holidays(2025)
  expect_false(any(is.na(result$date)))
  expect_false(any(is.na(result$local_name)))
  expect_false(any(is.na(result$name)))
})

test_that("get_chile_holidays() local_name and name are non-empty strings", {
  skip_on_cran()
  result <- get_chile_holidays(2025)
  expect_true(all(nchar(result$local_name) > 0))
  expect_true(all(nchar(result$name) > 0))
})

test_that("get_chile_holidays() dates are properly formatted and valid", {
  skip_on_cran()
  result <- get_chile_holidays(2025)
  expect_true(all(!is.na(result$date)))
  expect_true(all(is(result$date, "Date")))
})

test_that("get_chile_holidays() includes expected major holidays", {
  skip_on_cran()
  result <- get_chile_holidays(2025)
  # Check for some major Chilean holidays that should be present
  expect_true(any(grepl("Año Nuevo|New Year", result$local_name) | grepl("New Year", result$name)))
  expect_true(any(grepl("Navidad|Christmas", result$local_name) | grepl("Christmas", result$name)))
  expect_true(any(grepl("Fiestas Patrias|National", result$local_name) | grepl("National", result$name)))
})

test_that("get_chile_holidays() dates are ordered chronologically within the year", {
  skip_on_cran()
  result <- get_chile_holidays(2025)
  expect_true(all(result$date == sort(result$date)))
})

test_that("get_chile_holidays() returns unique dates (no duplicates)", {
  skip_on_cran()
  result <- get_chile_holidays(2025)
  expect_equal(length(result$date), length(unique(result$date)))
})

test_that("get_chile_holidays() works for different years", {
  skip_on_cran()
  result_2024 <- get_chile_holidays(2024)
  result_2025 <- get_chile_holidays(2025)

  expect_s3_class(result_2024, "tbl_df")
  expect_s3_class(result_2025, "tbl_df")

  expect_true(all(format(result_2024$date, "%Y") == "2024"))
  expect_true(all(format(result_2025$date, "%Y") == "2025"))

  expect_named(result_2024, c("date", "local_name", "name"))
  expect_named(result_2025, c("date", "local_name", "name"))
})
