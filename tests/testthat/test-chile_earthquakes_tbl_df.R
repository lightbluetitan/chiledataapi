# ChileDataAPI - Access Chilean Economic, Demographic, Environmental, and Geopolitical Data via RESTful APIs and Curated Datasets
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

# chile_earthquakes_tbl_df

library(testthat)

# Test 1: Confirm the object is a tibble and data.frame
test_that("chile_earthquakes_tbl_df is a tibble and a data.frame", {
  expect_s3_class(chile_earthquakes_tbl_df, "tbl_df")
  expect_s3_class(chile_earthquakes_tbl_df, "data.frame")
})

# Test 2: Confirm it has exactly 5 columns
test_that("chile_earthquakes_tbl_df has 5 columns", {
  expect_equal(length(chile_earthquakes_tbl_df), 5)
})

# Test 3: Confirm it has exactly 4018 rows
test_that("chile_earthquakes_tbl_df has 4018 rows", {
  expect_equal(nrow(chile_earthquakes_tbl_df), 4018)
})

# Test 4: Confirm column names are correct
test_that("chile_earthquakes_tbl_df has correct column names", {
  expect_named(chile_earthquakes_tbl_df, c(
    "Date(UTC)", "Latitude", "Longitude", "Depth", "Magnitude"
  ))
})

# Test 5: Confirm column types are as expected
test_that("chile_earthquakes_tbl_df columns have correct types", {
  expect_s3_class(chile_earthquakes_tbl_df[["Date(UTC)"]], "POSIXct")
  expect_type(chile_earthquakes_tbl_df$Latitude, "double")
  expect_type(chile_earthquakes_tbl_df$Longitude, "double")
  expect_type(chile_earthquakes_tbl_df$Depth, "double")
  expect_type(chile_earthquakes_tbl_df$Magnitude, "double")
})
