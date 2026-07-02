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

# get_chile_population

library(testthat)

test_that("get_chile_population() returns a tibble with correct structure and types", {
  skip_on_cran()
  result <- get_chile_population()
  expect_s3_class(result, "tbl_df")
  expect_named(result, c("indicator", "country", "year", "value", "value_label"))
  expect_equal(ncol(result), 5)
  expect_type(result$indicator, "character")
  expect_type(result$country, "character")
  expect_type(result$year, "integer")
  expect_type(result$value, "integer")
  expect_type(result$value_label, "character")
})

test_that("get_chile_population() returns data only for Chile", {
  skip_on_cran()
  result <- get_chile_population()
  expect_true(all(result$country == "Chile"))
})

test_that("get_chile_population() returns correct indicator label", {
  skip_on_cran()
  result <- get_chile_population()
  expect_true(all(result$indicator == "Population, total"))
})

test_that("get_chile_population() returns data for years 2010 to 2022", {
  skip_on_cran()
  result <- get_chile_population()
  expect_true(all(result$year %in% 2010:2022))
  expect_equal(sort(unique(result$year)), 2010:2022)
})

test_that("get_chile_population() returns exactly 13 rows (one per year 2010-2022)", {
  skip_on_cran()
  result <- get_chile_population()
  expect_equal(nrow(result), 13)
})

test_that("get_chile_population() year column has no missing values", {
  skip_on_cran()
  result <- get_chile_population()
  expect_false(any(is.na(result$year)))
})

test_that("get_chile_population() value column has no missing values and is numeric", {
  skip_on_cran()
  result <- get_chile_population()
  expect_false(any(is.na(result$value)))
  expect_true(is.numeric(result$value))
})

test_that("get_chile_population() value_label is formatted with commas", {
  skip_on_cran()
  result <- get_chile_population()
  expect_true(all(grepl(",", result$value_label)))
})

test_that("get_chile_population() years are sorted in descending order", {
  skip_on_cran()
  result <- get_chile_population()
  expect_equal(result$year, sort(result$year, decreasing = TRUE))
})

test_that("get_chile_population() indicator and country columns have consistent values", {
  skip_on_cran()
  result <- get_chile_population()
  expect_equal(length(unique(result$indicator)), 1)
  expect_equal(length(unique(result$country)), 1)
})

test_that("get_chile_population() population values are positive and reasonable for Chile", {
  skip_on_cran()
  result <- get_chile_population()
  expect_true(all(result$value > 0))
  expect_true(all(result$value >= 15000000))  # At least 15 million
  expect_true(all(result$value <= 25000000))  # At most 25 million
})

test_that("get_chile_population() returns consistent structure", {
  skip_on_cran()
  result <- get_chile_population()
  expect_false(is.null(result))
  expect_s3_class(result, "data.frame")
  expect_equal(length(names(result)), 5)
})

test_that("get_chile_population() value_label matches formatted value column", {
  skip_on_cran()
  result <- get_chile_population()
  # Remove commas and convert to numeric to compare
  numeric_label <- as.numeric(gsub(",", "", result$value_label))
  expect_equal(numeric_label, result$value)
})

test_that("get_chile_population() contains no empty strings in text columns", {
  skip_on_cran()
  result <- get_chile_population()
  expect_true(all(nchar(result$indicator) > 0))
  expect_true(all(nchar(result$country) > 0))
  expect_true(all(nchar(result$value_label) > 0))
})

test_that("get_chile_population() population shows expected growth trend", {
  skip_on_cran()
  result <- get_chile_population()
  # Sort by year ascending to check trend
  result_sorted <- result[order(result$year), ]
  # Check that population generally increased from 2010 to 2022
  first_year_pop <- result_sorted$value[1]   # 2010
  last_year_pop <- result_sorted$value[nrow(result_sorted)]  # 2022
  expect_true(last_year_pop > first_year_pop)
})

test_that("get_chile_population() all values are realistic for Chile's population", {
  skip_on_cran()
  result <- get_chile_population()
  expect_true(all(is.finite(result$value)))
  # Chile's population should be in the 17-20 million range
  expect_true(all(result$value >= 17000000))   # Lower bound based on known range
  expect_true(all(result$value <= 20000000))   # Upper bound based on known range
})

test_that("get_chile_population() population growth rate is reasonable", {
  skip_on_cran()
  result <- get_chile_population()
  result_sorted <- result[order(result$year), ]
  # Check that population growth is reasonable (not extreme changes year-over-year)
  if (nrow(result_sorted) > 1) {
    for (i in 2:nrow(result_sorted)) {
      growth_rate <- (result_sorted$value[i] - result_sorted$value[i-1]) / result_sorted$value[i-1]
      expect_true(abs(growth_rate) <= 0.05)  # Annual growth should not exceed 5%
    }
  }
})
