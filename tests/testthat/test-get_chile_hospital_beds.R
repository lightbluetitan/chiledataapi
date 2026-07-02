# ChileDataAPI - Access Chilean Data via APIs and Curated Datasets
# Version 0.3.0
# Copyright (C) 2025-2026 Renzo Caceres Rossi
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

# get_chile_hospital_beds

library(testthat)

test_that("get_chile_hospital_beds() returns a tibble with correct structure and types", {
  skip_on_cran()
  result <- get_chile_hospital_beds()
  expect_s3_class(result, "tbl_df")
  expect_named(result, c("indicator", "country", "year", "value"))
  expect_equal(ncol(result), 4)
  expect_type(result$indicator, "character")
  expect_type(result$country, "character")
  expect_type(result$year, "integer")
  expect_type(result$value, "double")
})

test_that("get_chile_hospital_beds() returns data only for Chile", {
  skip_on_cran()
  result <- get_chile_hospital_beds()
  expect_true(all(result$country == "Chile"))
})

test_that("get_chile_hospital_beds() returns correct indicator label", {
  skip_on_cran()
  result <- get_chile_hospital_beds()
  expect_true(all(result$indicator == "Hospital beds (per 1,000 people)"))
})

test_that("get_chile_hospital_beds() returns data for years 2010 to 2022", {
  skip_on_cran()
  result <- get_chile_hospital_beds()
  expect_true(all(result$year %in% 2010:2022))
  expect_equal(sort(unique(result$year)), 2010:2022)
})

test_that("get_chile_hospital_beds() returns exactly 13 rows (one per year 2010-2022)", {
  skip_on_cran()
  result <- get_chile_hospital_beds()
  expect_equal(nrow(result), 13)
})

test_that("get_chile_hospital_beds() year column has no missing values", {
  skip_on_cran()
  result <- get_chile_hospital_beds()
  expect_false(any(is.na(result$year)))
})

test_that("get_chile_hospital_beds() value column is numeric and may contain NA values", {
  skip_on_cran()
  result <- get_chile_hospital_beds()
  expect_true(is.numeric(result$value))
  # NA values are valid and expected from the API
})

test_that("get_chile_hospital_beds() years are sorted in descending order", {
  skip_on_cran()
  result <- get_chile_hospital_beds()
  expect_equal(result$year, sort(result$year, decreasing = TRUE))
})

test_that("get_chile_hospital_beds() indicator and country columns have consistent values", {
  skip_on_cran()
  result <- get_chile_hospital_beds()
  expect_equal(length(unique(result$indicator)), 1)
  expect_equal(length(unique(result$country)), 1)
})

test_that("get_chile_hospital_beds() non-NA values are positive and reasonable", {
  skip_on_cran()
  result <- get_chile_hospital_beds()
  non_na_values <- result$value[!is.na(result$value)]
  if (length(non_na_values) > 0) {
    expect_true(all(non_na_values > 0))
    expect_true(all(non_na_values <= 10))   # Reasonable upper bound per 1,000 people
    expect_true(all(non_na_values >= 0.5))  # Reasonable lower bound for developed countries
  }
})

test_that("get_chile_hospital_beds() returns consistent structure", {
  skip_on_cran()
  result <- get_chile_hospital_beds()
  expect_false(is.null(result))
  expect_s3_class(result, "data.frame")
  expect_equal(length(names(result)), 4)
})

test_that("get_chile_hospital_beds() values are within expected range for Chile", {
  skip_on_cran()
  result <- get_chile_hospital_beds()
  non_na_values <- result$value[!is.na(result$value)]
  if (length(non_na_values) > 0) {
    # Chile typically has 2-3 hospital beds per 1,000 people
    expect_true(all(non_na_values >= 1.5))  # Lower bound based on Chile's profile
    expect_true(all(non_na_values <= 3.0))  # Upper bound based on Chile's profile
  }
})

test_that("get_chile_hospital_beds() contains no empty strings in text columns", {
  skip_on_cran()
  result <- get_chile_hospital_beds()
  expect_true(all(nchar(result$indicator) > 0))
  expect_true(all(nchar(result$country) > 0))
})

test_that("get_chile_hospital_beds() handles NA values correctly", {
  skip_on_cran()
  result <- get_chile_hospital_beds()
  # NA values are valid from the API and should be preserved
  expect_true(is.logical(is.na(result$value)))
  # Check that we have some data (not all NA)
  expect_true(sum(!is.na(result$value)) > 0)
})

test_that("get_chile_hospital_beds() non-NA values show reasonable stability", {
  skip_on_cran()
  result <- get_chile_hospital_beds()
  non_na_values <- result$value[!is.na(result$value)]
  if (length(non_na_values) > 1) {
    # Hospital bed numbers should be relatively stable over time
    range_ratio <- max(non_na_values) / min(non_na_values)
    expect_true(range_ratio <= 1.5)  # Should not vary by more than 50%
  }
})

test_that("get_chile_hospital_beds() all finite values are realistic", {
  skip_on_cran()
  result <- get_chile_hospital_beds()
  finite_values <- result$value[is.finite(result$value)]
  if (length(finite_values) > 0) {
    expect_true(all(finite_values > 0))
    expect_true(all(finite_values <= 5))    # Conservative upper bound
    expect_true(all(finite_values >= 1))    # Conservative lower bound for Chile
  }
})
