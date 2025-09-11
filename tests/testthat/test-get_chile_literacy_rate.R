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

# get_chile_literacy_rate

library(testthat)

test_that("get_chile_literacy_rate() returns a tibble with correct structure and types", {
  skip_on_cran()
  result <- get_chile_literacy_rate()
  expect_s3_class(result, "tbl_df")
  expect_named(result, c("indicator", "country", "year", "value"))
  expect_equal(ncol(result), 4)
  expect_type(result$indicator, "character")
  expect_type(result$country, "character")
  expect_type(result$year, "integer")
  expect_type(result$value, "double")
})

test_that("get_chile_literacy_rate() returns data only for Chile", {
  skip_on_cran()
  result <- get_chile_literacy_rate()
  expect_true(all(result$country == "Chile"))
})

test_that("get_chile_literacy_rate() returns correct indicator label", {
  skip_on_cran()
  result <- get_chile_literacy_rate()
  expect_true(all(result$indicator == "Literacy rate, adult total (% of people ages 15 and above)"))
})

test_that("get_chile_literacy_rate() returns data for years 2010 to 2022", {
  skip_on_cran()
  result <- get_chile_literacy_rate()
  expect_true(all(result$year %in% 2010:2022))
  expect_equal(sort(unique(result$year)), 2010:2022)
})

test_that("get_chile_literacy_rate() returns exactly 13 rows (one per year 2010-2022)", {
  skip_on_cran()
  result <- get_chile_literacy_rate()
  expect_equal(nrow(result), 13)
})

test_that("get_chile_literacy_rate() year column has no missing values", {
  skip_on_cran()
  result <- get_chile_literacy_rate()
  expect_false(any(is.na(result$year)))
})

test_that("get_chile_literacy_rate() value column is numeric and may contain NA values", {
  skip_on_cran()
  result <- get_chile_literacy_rate()
  expect_true(is.numeric(result$value))
  # NA values are valid and expected from the API
})

test_that("get_chile_literacy_rate() years are sorted in descending order", {
  skip_on_cran()
  result <- get_chile_literacy_rate()
  expect_equal(result$year, sort(result$year, decreasing = TRUE))
})

test_that("get_chile_literacy_rate() indicator and country columns have consistent values", {
  skip_on_cran()
  result <- get_chile_literacy_rate()
  expect_equal(length(unique(result$indicator)), 1)
  expect_equal(length(unique(result$country)), 1)
})

test_that("get_chile_literacy_rate() non-NA values are reasonable percentages", {
  skip_on_cran()
  result <- get_chile_literacy_rate()
  non_na_values <- result$value[!is.na(result$value)]
  if (length(non_na_values) > 0) {
    expect_true(all(non_na_values >= 0))
    expect_true(all(non_na_values <= 100))  # Percentages should be 0-100
    expect_true(all(non_na_values >= 80))   # Chile should have high literacy rate
  }
})

test_that("get_chile_literacy_rate() returns consistent structure", {
  skip_on_cran()
  result <- get_chile_literacy_rate()
  expect_false(is.null(result))
  expect_s3_class(result, "data.frame")
  expect_equal(length(names(result)), 4)
})

test_that("get_chile_literacy_rate() non-NA values are within expected range for Chile", {
  skip_on_cran()
  result <- get_chile_literacy_rate()
  non_na_values <- result$value[!is.na(result$value)]
  if (length(non_na_values) > 0) {
    # Chile should have very high literacy rates (developed country)
    expect_true(all(non_na_values >= 95))   # Lower bound for developed countries
    expect_true(all(non_na_values <= 100))  # Upper bound (100%)
  }
})

test_that("get_chile_literacy_rate() contains no empty strings in text columns", {
  skip_on_cran()
  result <- get_chile_literacy_rate()
  expect_true(all(nchar(result$indicator) > 0))
  expect_true(all(nchar(result$country) > 0))
})

test_that("get_chile_literacy_rate() handles NA values correctly", {
  skip_on_cran()
  result <- get_chile_literacy_rate()
  # NA values are valid from the API and should be preserved
  expect_true(is.logical(is.na(result$value)))
  # Check that we have some data (not all NA)
  expect_true(sum(!is.na(result$value)) > 0)
})

test_that("get_chile_literacy_rate() non-NA values show reasonable stability", {
  skip_on_cran()
  result <- get_chile_literacy_rate()
  non_na_values <- result$value[!is.na(result$value)]
  if (length(non_na_values) > 1) {
    # Literacy rates should be relatively stable for developed countries
    range_difference <- max(non_na_values) - min(non_na_values)
    expect_true(range_difference <= 5)  # Should not vary by more than 5 percentage points
  }
})

test_that("get_chile_literacy_rate() all finite values are realistic literacy percentages", {
  skip_on_cran()
  result <- get_chile_literacy_rate()
  finite_values <- result$value[is.finite(result$value)]
  if (length(finite_values) > 0) {
    expect_true(all(finite_values >= 90))   # Very high literacy expected for Chile
    expect_true(all(finite_values <= 100)) # Cannot exceed 100%
    expect_true(all(finite_values > 0))    # Must be positive
  }
})

test_that("get_chile_literacy_rate() reflects developed country literacy standards", {
  skip_on_cran()
  result <- get_chile_literacy_rate()
  non_na_values <- result$value[!is.na(result$value)]
  if (length(non_na_values) > 0) {
    # All available values should reflect very high literacy
    expect_true(all(non_na_values >= 96))   # Based on Chile's development level
    expect_true(all(non_na_values <= 98))   # Reasonable upper bound considering measurement
  }
})
