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

# get_chile_child_mortality

library(testthat)

test_that("get_chile_child_mortality() returns a tibble with correct structure and types", {
  skip_on_cran()
  result <- get_chile_child_mortality()
  expect_s3_class(result, "tbl_df")
  expect_named(result, c("indicator", "country", "year", "value"))
  expect_equal(ncol(result), 4)
  expect_type(result$indicator, "character")
  expect_type(result$country, "character")
  expect_type(result$year, "integer")
  expect_type(result$value, "double")
})

test_that("get_chile_child_mortality() returns data only for Chile", {
  skip_on_cran()
  result <- get_chile_child_mortality()
  expect_true(all(result$country == "Chile"))
})

test_that("get_chile_child_mortality() returns correct indicator label", {
  skip_on_cran()
  result <- get_chile_child_mortality()
  expect_true(all(result$indicator == "Mortality rate, under-5 (per 1,000 live births)"))
})

test_that("get_chile_child_mortality() returns data for years 2010 to 2022", {
  skip_on_cran()
  result <- get_chile_child_mortality()
  expect_true(all(result$year %in% 2010:2022))
  expect_equal(sort(unique(result$year)), 2010:2022)
})

test_that("get_chile_child_mortality() returns exactly 13 rows (one per year 2010-2022)", {
  skip_on_cran()
  result <- get_chile_child_mortality()
  expect_equal(nrow(result), 13)
})

test_that("get_chile_child_mortality() year column has no missing values", {
  skip_on_cran()
  result <- get_chile_child_mortality()
  expect_false(any(is.na(result$year)))
})

test_that("get_chile_child_mortality() value column has no missing values and is numeric", {
  skip_on_cran()
  result <- get_chile_child_mortality()
  expect_false(any(is.na(result$value)))
  expect_true(is.numeric(result$value))
})

test_that("get_chile_child_mortality() years are sorted in descending order", {
  skip_on_cran()
  result <- get_chile_child_mortality()
  expect_equal(result$year, sort(result$year, decreasing = TRUE))
})

test_that("get_chile_child_mortality() indicator and country columns have consistent values", {
  skip_on_cran()
  result <- get_chile_child_mortality()
  expect_equal(length(unique(result$indicator)), 1)
  expect_equal(length(unique(result$country)), 1)
})

test_that("get_chile_child_mortality() mortality values are positive and reasonable", {
  skip_on_cran()
  result <- get_chile_child_mortality()
  expect_true(all(result$value > 0))
  expect_true(all(result$value < 50)) # Reasonable upper bound for developed countries
})

test_that("get_chile_child_mortality() returns consistent structure", {
  skip_on_cran()
  result <- get_chile_child_mortality()
  expect_false(is.null(result))
  expect_s3_class(result, "data.frame")
  expect_equal(length(names(result)), 4)
})

test_that("get_chile_child_mortality() values show expected trend (generally decreasing)", {
  skip_on_cran()
  result <- get_chile_child_mortality()
  # Sort by year ascending to check trend
  result_sorted <- result[order(result$year), ]
  # Check that the most recent value is lower than the earliest value
  expect_true(result_sorted$value[nrow(result_sorted)] <= result_sorted$value[1])
})

test_that("get_chile_child_mortality() contains no empty strings in text columns", {
  skip_on_cran()
  result <- get_chile_child_mortality()
  expect_true(all(nchar(result$indicator) > 0))
  expect_true(all(nchar(result$country) > 0))
})
