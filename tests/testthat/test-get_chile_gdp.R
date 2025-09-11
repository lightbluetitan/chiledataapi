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

# get_chile_gdp

library(testthat)

test_that("get_chile_gdp() returns a tibble with the correct structure and content", {
  skip_on_cran()
  result <- get_chile_gdp()
  # Check that the result is not NULL
  expect_false(is.null(result))
  # Check that the result is a data.frame/tibble
  expect_s3_class(result, "data.frame")
  # Check that the column names are exactly as expected
  expect_named(result, c("indicator", "country", "year", "value", "value_label"))
  # Check data types of each column
  expect_type(result$indicator, "character")
  expect_type(result$country, "character")
  expect_type(result$year, "integer")
  expect_type(result$value, "double")
  expect_type(result$value_label, "character")
})

test_that("get_chile_gdp() returns data only for Chile", {
  skip_on_cran()
  result <- get_chile_gdp()
  expect_true(all(result$country == "Chile"))
})

test_that("get_chile_gdp() returns correct indicator label", {
  skip_on_cran()
  result <- get_chile_gdp()
  expect_true(all(result$indicator == "GDP (current US$)"))
})

test_that("get_chile_gdp() returns data for years 2010 to 2022", {
  skip_on_cran()
  result <- get_chile_gdp()
  expect_true(all(result$year %in% 2010:2022))
  expect_equal(sort(unique(result$year)), 2010:2022)
})

test_that("get_chile_gdp() returns exactly 13 rows (one per year 2010-2022)", {
  skip_on_cran()
  result <- get_chile_gdp()
  expect_equal(nrow(result), 13)
})

test_that("get_chile_gdp() year column has no missing values", {
  skip_on_cran()
  result <- get_chile_gdp()
  expect_false(any(is.na(result$year)))
})

test_that("get_chile_gdp() value column has no missing values and is numeric", {
  skip_on_cran()
  result <- get_chile_gdp()
  expect_false(any(is.na(result$value)))
  expect_true(is.numeric(result$value))
})

test_that("get_chile_gdp() value_label is formatted with commas", {
  skip_on_cran()
  result <- get_chile_gdp()
  expect_true(all(grepl(",", result$value_label)))
})

test_that("get_chile_gdp() years are sorted in descending order", {
  skip_on_cran()
  result <- get_chile_gdp()
  expect_equal(result$year, sort(result$year, decreasing = TRUE))
})

test_that("get_chile_gdp() indicator and country columns have consistent values", {
  skip_on_cran()
  result <- get_chile_gdp()
  expect_equal(length(unique(result$indicator)), 1)
  expect_equal(length(unique(result$country)), 1)
})

test_that("get_chile_gdp() GDP values are positive and reasonable for Chile", {
  skip_on_cran()
  result <- get_chile_gdp()
  expect_true(all(result$value > 0))
  expect_true(all(result$value >= 200000000000))  # At least 200 billion USD
  expect_true(all(result$value <= 400000000000))  # At most 400 billion USD
})

test_that("get_chile_gdp() returns consistent structure", {
  skip_on_cran()
  result <- get_chile_gdp()
  expect_false(is.null(result))
  expect_s3_class(result, "data.frame")
  expect_equal(length(names(result)), 5)
})

test_that("get_chile_gdp() value_label matches formatted value column", {
  skip_on_cran()
  result <- get_chile_gdp()
  # Remove commas and convert to numeric to compare
  numeric_label <- as.numeric(gsub(",", "", result$value_label))
  expect_equal(numeric_label, result$value, tolerance = 1)
})

test_that("get_chile_gdp() contains no empty strings in text columns", {
  skip_on_cran()
  result <- get_chile_gdp()
  expect_true(all(nchar(result$indicator) > 0))
  expect_true(all(nchar(result$country) > 0))
  expect_true(all(nchar(result$value_label) > 0))
})

test_that("get_chile_gdp() GDP values show reasonable growth pattern", {
  skip_on_cran()
  result <- get_chile_gdp()
  # Sort by year ascending to check trend
  result_sorted <- result[order(result$year), ]
  # Check that GDP generally increased from 2010 to 2022
  first_year_gdp <- result_sorted$value[1]   # 2010
  last_year_gdp <- result_sorted$value[nrow(result_sorted)]  # 2022
  expect_true(last_year_gdp > first_year_gdp * 0.8)  # Allow for some fluctuation
})

test_that("get_chile_gdp() all values are finite and realistic", {
  skip_on_cran()
  result <- get_chile_gdp()
  expect_true(all(is.finite(result$value)))
  expect_true(all(result$value > 100000000000))  # At least 100 billion (very conservative)
  expect_true(all(result$value < 1000000000000)) # Less than 1 trillion (reasonable upper bound)
})
