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

# chile_health_survey_df

library(testthat)

# Test 1: Confirm the object is a data frame
test_that("chile_health_survey_df is a data frame", {
  expect_s3_class(chile_health_survey_df, "data.frame")
})

# Test 2: Confirm it has exactly 12 columns
test_that("chile_health_survey_df has 12 columns", {
  expect_equal(length(chile_health_survey_df), 12)
})

# Test 3: Confirm it has exactly 3211 rows
test_that("chile_health_survey_df has 3211 rows", {
  expect_equal(nrow(chile_health_survey_df), 3211)
})

# Test 4: Confirm column names are correct
test_that("chile_health_survey_df has correct column names", {
  expect_named(chile_health_survey_df, c(
    "pas", "pad", "age", "waist", "bmi", "sedentary", "smoker",
    "diabetes", "depression", "male", "scholar2", "scholar3"
  ))
})

# Test 5: Confirm column types are as expected
test_that("chile_health_survey_df columns have correct types", {
  expect_type(chile_health_survey_df$pas, "double")
  expect_type(chile_health_survey_df$pad, "double")
  expect_type(chile_health_survey_df$age, "integer")
  expect_type(chile_health_survey_df$waist, "double")
  expect_type(chile_health_survey_df$bmi, "double")
  expect_type(chile_health_survey_df$sedentary, "integer")
  expect_type(chile_health_survey_df$smoker, "integer")
  expect_type(chile_health_survey_df$diabetes, "integer")
  expect_type(chile_health_survey_df$depression, "integer")
  expect_type(chile_health_survey_df$male, "integer")
  expect_type(chile_health_survey_df$scholar2, "integer")
  expect_type(chile_health_survey_df$scholar3, "integer")
})
