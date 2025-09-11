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

# get_country_info_cl

library(testthat)

test_that("get_country_info_cl() returns tibble with correct structure", {
  result <- get_country_info_cl()
  expect_s3_class(result, "tbl_df")
  expect_named(result, c("name_common", "name_official", "region", "subregion",
                         "capital", "area", "population", "languages"))
  expect_equal(nrow(result), 1)
  expect_equal(ncol(result), 8)
})

test_that("get_country_info_cl() returns data of correct types", {
  result <- get_country_info_cl()
  expect_type(result$name_common, "character")
  expect_type(result$name_official, "character")
  expect_type(result$region, "character")
  expect_type(result$subregion, "character")
  expect_type(result$capital, "character")
  expect_type(result$area, "double")
  expect_type(result$population, "integer")
  expect_type(result$languages, "character")
})

test_that("get_country_info_cl() returns expected values for Chile", {
  result <- get_country_info_cl()
  expect_equal(result$name_common, "Chile")
  expect_equal(result$name_official, "Republic of Chile")
  expect_equal(result$region, "Americas")
  expect_equal(result$subregion, "South America")
  expect_equal(result$capital, "Santiago")
  expect_true(result$area > 700000)
  expect_true(result$population > 18000000)
  expect_true(grepl("Spanish", result$languages))
})

test_that("get_country_info_cl() returns consistent column structure", {
  result <- get_country_info_cl()
  expect_false(is.null(result))
  expect_s3_class(result, "data.frame")
  expect_equal(length(names(result)), 8)
})

test_that("get_country_info_cl() returns no missing values in key fields", {
  result <- get_country_info_cl()
  expect_false(is.na(result$name_common))
  expect_false(is.na(result$name_official))
  expect_false(is.na(result$region))
  expect_false(is.na(result$subregion))
  expect_false(is.na(result$capital))
  expect_false(is.na(result$area))
  expect_false(is.na(result$population))
  expect_false(is.na(result$languages))
})

test_that("get_country_info_cl() area and population are positive numbers", {
  result <- get_country_info_cl()
  expect_true(result$area > 0)
  expect_true(result$population > 0)
  expect_true(is.numeric(result$area))
  expect_true(is.numeric(result$population))
})

test_that("get_country_info_cl() returns character strings for text fields", {
  result <- get_country_info_cl()
  expect_true(nchar(result$name_common) > 0)
  expect_true(nchar(result$name_official) > 0)
  expect_true(nchar(result$region) > 0)
  expect_true(nchar(result$subregion) > 0)
  expect_true(nchar(result$capital) > 0)
  expect_true(nchar(result$languages) > 0)
})

