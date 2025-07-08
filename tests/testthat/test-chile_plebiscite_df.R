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

# chile_plebiscite_df


library(testthat)

# Test 1: Confirm the object is a data frame
test_that("chile_plebiscite_df is a data frame", {
  expect_s3_class(chile_plebiscite_df, "data.frame")
})

# Test 2: Confirm it has exactly 8 columns
test_that("chile_plebiscite_df has 8 columns", {
  expect_equal(length(chile_plebiscite_df), 8)
})

# Test 3: Confirm it has exactly 2700 rows
test_that("chile_plebiscite_df has 2700 rows", {
  expect_equal(nrow(chile_plebiscite_df), 2700)
})

# Test 4: Confirm column names are correct
test_that("chile_plebiscite_df has correct column names", {
  expect_named(chile_plebiscite_df, c(
    "region", "population", "sex", "age",
    "education", "income", "statusquo", "vote"
  ))
})

# Test 5: Confirm column types are as expected
test_that("chile_plebiscite_df columns have correct types", {
  expect_type(chile_plebiscite_df$population, "integer")
  expect_type(chile_plebiscite_df$age, "integer")
  expect_type(chile_plebiscite_df$income, "integer")
  expect_type(chile_plebiscite_df$statusquo, "double")
  expect_s3_class(chile_plebiscite_df$region, "factor")
  expect_s3_class(chile_plebiscite_df$sex, "factor")
  expect_s3_class(chile_plebiscite_df$education, "factor")
  expect_s3_class(chile_plebiscite_df$vote, "factor")
})
