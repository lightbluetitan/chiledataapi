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

# get_chile_life_expectancy

library(testthat)

test_that("get_chile_life_expectancy() returns a tibble with correct structure and types", {
  skip_on_cran()
  result <- get_chile_life_expectancy()
  expect_s3_class(result, "tbl_df")
  expect_named(result, c("indicator", "country", "year", "value"))
  expect_equal(ncol(result), 4)
  expect_type(result$indicator, "character")
  expect_type(result$country, "character")
  expect_type(result$year, "integer")
  expect_type(result$value, "double")
})

test_that("get_chile_life_expectancy() returns data only for Chile", {
  skip_on_cran()
  result <- get_chile_life_expectancy()
  expect_true(all(result$country == "Chile"))
})

test_that("get_chile_life_expectancy() returns correct indicator label", {
  skip_on_cran()
  result <- get_chile_life_expectancy()
  expect_true(all(result$indicator == "Life expectancy at birth, total (years)"))
})

test_that("get_chile_life_expectancy() returns data for years 2010 to 2022", {
  skip_on_cran()
  result <- get_chile_life_expectancy()
  expect_true(all(result$year %in% 2010:2022))
  expect_equal(sort(unique(result$year)), 2010:2022)
})

test_that("get_chile_life_expectancy() returns exactly 13 rows (one per year 2010-2022)", {
  skip_on_cran()
  result <- get_chile_life_expectancy()
  expect_equal(nrow(result), 13)
})

test_that("get_chile_life_expectancy() year column has no missing values", {
  skip_on_cran()
  result <- get_chile_life_expectancy()
  expect_false(any(is.na(result$year)))
})

test_that("get_chile_life_expectancy() value column has no missing values and is numeric", {
  skip_on_cran()
  result <- get_chile_life_expectancy()
  expect_false(any(is.na(result$value)))
  expect_true(is.numeric(result$value))
})

test_that("get_chile_life_expectancy() years are sorted in descending order", {
  skip_on_cran()
  result <- get_chile_life_expectancy()
  expect_equal(result$year, sort(result$year, decreasing = TRUE))
})

test_that("get_chile_life_expectancy() indicator and country columns have consistent values", {
  skip_on_cran()
  result <- get_chile_life_expectancy()
  expect_equal(length(unique(result$indicator)), 1)
  expect_equal(length(unique(result$country)), 1)
})

test_that("get_chile_life_expectancy() life expectancy values are positive and reasonable", {
  skip_on_cran()
  result <- get_chile_life_expectancy()
  expect_true(all(result$value > 0))
  expect_true(all(result$value >= 70))   # Reasonable lower bound for developed countries
  expect_true(all(result$value <= 90))   # Reasonable upper bound globally
})

test_that("get_chile_life_expectancy() returns consistent structure", {
  skip_on_cran()
  result <- get_chile_life_expectancy()
  expect_false(is.null(result))
  expect_s3_class(result, "data.frame")
  expect_equal(length(names(result)), 4)
})

test_that("get_chile_life_expectancy() values are within expected range for Chile", {
  skip_on_cran()
  result <- get_chile_life_expectancy()
  # Chile's life expectancy should be in the range typical for developed countries
  expect_true(all(result$value >= 75))   # Lower bound based on Chile's development
  expect_true(all(result$value <= 85))   # Upper bound based on global standards
})

test_that("get_chile_life_expectancy() contains no empty strings in text columns", {
  skip_on_cran()
  result <- get_chile_life_expectancy()
  expect_true(all(nchar(result$indicator) > 0))
  expect_true(all(nchar(result$country) > 0))
})

test_that("get_chile_life_expectancy() values show reasonable stability over time", {
  skip_on_cran()
  result <- get_chile_life_expectancy()
  # Life expectancy should be relatively stable, with gradual changes
  range_difference <- max(result$value) - min(result$value)
  expect_true(range_difference <= 5)  # Should not vary by more than 5 years over the period
})

test_that("get_chile_life_expectancy() all values are realistic for human life expectancy", {
  skip_on_cran()
  result <- get_chile_life_expectancy()
  expect_true(all(is.finite(result$value)))
  expect_true(all(result$value >= 50))   # Conservative lower bound
  expect_true(all(result$value <= 100))  # Conservative upper bound
})

test_that("get_chile_life_expectancy() values reflect developed country standards", {
  skip_on_cran()
  result <- get_chile_life_expectancy()
  # Chile should have life expectancy typical of upper-middle income countries
  expect_true(all(result$value >= 78))   # Based on Chile's development level
  expect_true(all(result$value <= 82))   # Reasonable upper bound for Chile's profile
})
