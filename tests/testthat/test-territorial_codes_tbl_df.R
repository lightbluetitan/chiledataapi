# ChileDataAPI - Access Chilean Data via APIs and Curated Datasets
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

# territorial_codes_tbl_df

library(testthat)

# Test 1: Check if the object is a tibble (inherits from tbl_df)
test_that("territorial_codes_tbl_df is a tibble", {
  expect_s3_class(territorial_codes_tbl_df, "tbl_df")
})

# Test 2: Confirm number of columns is exactly 6
test_that("territorial_codes_tbl_df has 6 columns", {
  expect_equal(length(territorial_codes_tbl_df), 6)
})

# Test 3: Confirm number of rows is exactly 346
test_that("territorial_codes_tbl_df has 346 rows", {
  expect_equal(nrow(territorial_codes_tbl_df), 346)
})

# Test 4: Confirm column names are as expected
test_that("territorial_codes_tbl_df has correct column names", {
  expect_named(territorial_codes_tbl_df, c(
    "codigo_comuna", "nombre_comuna",
    "codigo_provincia", "nombre_provincia",
    "codigo_region", "nombre_region"
  ))
})

# Test 5: Confirm all columns are character vectors
test_that("territorial_codes_tbl_df columns have correct types", {
  expect_type(territorial_codes_tbl_df$codigo_comuna, "character")
  expect_type(territorial_codes_tbl_df$nombre_comuna, "character")
  expect_type(territorial_codes_tbl_df$codigo_provincia, "character")
  expect_type(territorial_codes_tbl_df$nombre_provincia, "character")
  expect_type(territorial_codes_tbl_df$codigo_region, "character")
  expect_type(territorial_codes_tbl_df$nombre_region, "character")
})




