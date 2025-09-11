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

# get_chile_energy_use

library(testthat)

test_that("get_chile_energy_use() returns a tibble with correct structure and types", {
  skip_on_cran()
  result <- get_chile_energy_use()
  expect_s3_class(result, "tbl_df")
  expect_named(result, c("indicator", "country", "year", "value"))
  expect_equal(ncol(result), 4)
  expect_type(result$indicator, "character")
  expect_type(result$country, "character")
  expect_type(result$year, "integer")
  expect_type(result$value, "double")
})

test_that("get_chile_energy_use() returns data only for Chile", {
  skip_on_cran()
  result <- get_chile_energy_use()
  expect_true(all(result$country == "Chile"))
})

test_that("get_chile_energy_use() returns correct indicator label", {
  skip_on_cran()
  result <- get_chile_energy_use()
  expect_true(all(result$indicator == "Energy use (kg of oil equivalent per capita)"))
})

test_that("get_chile_energy_use() returns data for years 2010 to 2022", {
  skip_on_cran()
  result <- get_chile_energy_use()
  expect_true(all(result$year %in% 2010:2022))
  expect_equal(sort(unique(result$year)), 2010:2022)
})

test_that("get_chile_energy_use() returns exactly 13 rows (one per year 2010-2022)", {
  skip_on_cran()
  result <- get_chile_energy_use()
  expect_equal(nrow(result), 13)
})

test_that("get_chile_energy_use() year column has no missing values", {
  skip_on_cran()
  result <- get_chile_energy_use()
  expect_false(any(is.na(result$year)))
})

test_that("get_chile_energy_use() value column has no missing values and is numeric", {
  skip_on_cran()
  result <- get_chile_energy_use()
  expect_false(any(is.na(result$value)))
  expect_true(is.numeric(result$value))
})

test_that("get_chile_energy_use() years are sorted in descending order", {
  skip_on_cran()
  result <- get_chile_energy_use()
  expect_equal(result$year, sort(result$year, decreasing = TRUE))
})

test_that("get_chile_energy_use() indicator and country columns have consistent values", {
  skip_on_cran()
  result <- get_chile_energy_use()
  expect_equal(length(unique(result$indicator)), 1)
  expect_equal(length(unique(result$country)), 1)
})

test_that("get_chile_energy_use() energy values are positive and reasonable", {
  skip_on_cran()
  result <- get_chile_energy_use()
  expect_true(all(result$value > 0))
  expect_true(all(result$value >= 500))   # Reasonable lower bound for developed countries
  expect_true(all(result$value <= 5000))  # Reasonable upper bound for Chile
})

test_that("get_chile_energy_use() returns consistent structure", {
  skip_on_cran()
  result <- get_chile_energy_use()
  expect_false(is.null(result))
  expect_s3_class(result, "data.frame")
  expect_equal(length(names(result)), 4)
})

test_that("get_chile_energy_use() values are within expected range for Chile", {
  skip_on_cran()
  result <- get_chile_energy_use()
  # Chile's energy use should be in the range typical for upper-middle income countries
  expect_true(all(result$value >= 1500))  # Lower bound based on Chile's development
  expect_true(all(result$value <= 2500))  # Upper bound based on Chile's profile
})

test_that("get_chile_energy_use() contains no empty strings in text columns", {
  skip_on_cran()
  result <- get_chile_energy_use()
  expect_true(all(nchar(result$indicator) > 0))
  expect_true(all(nchar(result$country) > 0))
})

test_that("get_chile_energy_use() values show reasonable variation over time", {
  skip_on_cran()
  result <- get_chile_energy_use()
  # Check that there is some variation in energy use over the years
  expect_true(max(result$value) > min(result$value))
  # Check that variation is not extreme (within 50% range)
  range_ratio <- max(result$value) / min(result$value)
  expect_true(range_ratio <= 1.5)  # Energy use shouldn't vary by more than 50%
})

test_that("get_chile_energy_use() all values are realistic for per capita energy use", {
  skip_on_cran()
  result <- get_chile_energy_use()
  # All values should be positive and within realistic bounds
  expect_true(all(is.finite(result$value)))
  expect_true(all(result$value > 0))
  # Check that values are not unrealistically high or low
  expect_true(all(result$value >= 1000))  # Not too low for a developed country
  expect_true(all(result$value <= 3000))  # Not too high compared to global standards
})
