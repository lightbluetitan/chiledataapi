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

# get_chile_unemployment

library(testthat)

test_that("get_chile_unemployment() returns a tibble with correct structure and types", {
  skip_on_cran()
  result <- get_chile_unemployment()
  expect_s3_class(result, "tbl_df")
  expect_named(result, c("indicator", "country", "year", "value"))
  expect_equal(ncol(result), 4)
  expect_type(result$indicator, "character")
  expect_type(result$country, "character")
  expect_type(result$year, "integer")
  expect_type(result$value, "double")
})

test_that("get_chile_unemployment() returns data only for Chile", {
  skip_on_cran()
  result <- get_chile_unemployment()
  expect_true(all(result$country == "Chile"))
})

test_that("get_chile_unemployment() returns correct indicator label", {
  skip_on_cran()
  result <- get_chile_unemployment()
  expect_true(all(result$indicator == "Unemployment, total (% of total labor force) (modeled ILO estimate)"))
})

test_that("get_chile_unemployment() returns data for years 2010 to 2022", {
  skip_on_cran()
  result <- get_chile_unemployment()
  expect_true(all(result$year %in% 2010:2022))
  expect_equal(sort(unique(result$year)), 2010:2022)
})

test_that("get_chile_unemployment() returns exactly 13 rows (one per year 2010-2022)", {
  skip_on_cran()
  result <- get_chile_unemployment()
  expect_equal(nrow(result), 13)
})

test_that("get_chile_unemployment() year column has no missing values", {
  skip_on_cran()
  result <- get_chile_unemployment()
  expect_false(any(is.na(result$year)))
})

test_that("get_chile_unemployment() value column has no missing values and is numeric", {
  skip_on_cran()
  result <- get_chile_unemployment()
  expect_false(any(is.na(result$value)))
  expect_true(is.numeric(result$value))
})

test_that("get_chile_unemployment() years are sorted in descending order", {
  skip_on_cran()
  result <- get_chile_unemployment()
  expect_equal(result$year, sort(result$year, decreasing = TRUE))
})

test_that("get_chile_unemployment() indicator and country columns have consistent values", {
  skip_on_cran()
  result <- get_chile_unemployment()
  expect_equal(length(unique(result$indicator)), 1)
  expect_equal(length(unique(result$country)), 1)
})

test_that("get_chile_unemployment() unemployment values are positive and reasonable percentages", {
  skip_on_cran()
  result <- get_chile_unemployment()
  expect_true(all(result$value >= 0))
  expect_true(all(result$value <= 100))   # Should be percentage values (0-100)
  expect_true(all(result$value <= 25))    # Reasonable upper bound for unemployment
})

test_that("get_chile_unemployment() returns consistent structure", {
  skip_on_cran()
  result <- get_chile_unemployment()
  expect_false(is.null(result))
  expect_s3_class(result, "data.frame")
  expect_equal(length(names(result)), 4)
})

test_that("get_chile_unemployment() values are within expected range for Chile", {
  skip_on_cran()
  result <- get_chile_unemployment()
  # Chile's unemployment typically ranges from 5-15% in normal conditions
  expect_true(all(result$value >= 3))     # Lower bound considering economic cycles
  expect_true(all(result$value <= 20))    # Upper bound allowing for crisis periods
})

test_that("get_chile_unemployment() contains no empty strings in text columns", {
  skip_on_cran()
  result <- get_chile_unemployment()
  expect_true(all(nchar(result$indicator) > 0))
  expect_true(all(nchar(result$country) > 0))
})

test_that("get_chile_unemployment() values show reasonable economic variation", {
  skip_on_cran()
  result <- get_chile_unemployment()
  # Unemployment should show some variation due to economic cycles
  expect_true(max(result$value) > min(result$value))
  # But variation should not be extreme
  range_ratio <- max(result$value) / min(result$value)
  expect_true(range_ratio <= 3)  # Should not vary by more than 3x
})

test_that("get_chile_unemployment() all values are realistic unemployment rates", {
  skip_on_cran()
  result <- get_chile_unemployment()
  expect_true(all(is.finite(result$value)))
  expect_true(all(result$value > 0))      # Unemployment cannot be negative
  expect_true(all(result$value < 30))     # Even in severe crises, unlikely to exceed 30%
})

test_that("get_chile_unemployment() reflects expected patterns around economic events", {
  skip_on_cran()
  result <- get_chile_unemployment()
  # Check that 2020 (COVID-19 year) has higher unemployment than surrounding years
  covid_year <- result$value[result$year == 2020]
  pre_covid <- result$value[result$year == 2019]
  if (length(covid_year) > 0 && length(pre_covid) > 0) {
    expect_true(covid_year > pre_covid)  # 2020 should be higher than 2019
  }
})

test_that("get_chile_unemployment() values are within typical range for developed economies", {
  skip_on_cran()
  result <- get_chile_unemployment()
  # Most values should be in the typical range for developed countries
  typical_range_values <- sum(result$value >= 4 & result$value <= 15)
  expect_true(typical_range_values >= nrow(result) * 0.7)  # At least 70% in typical range
})
