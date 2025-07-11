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

# pinochet_regime_df

library(testthat)

# Test 1: Confirm the object is a data frame
test_that("pinochet_regime_df is a data frame", {
  expect_s3_class(pinochet_regime_df, "data.frame")
})

# Test 2: Confirm the data frame has 59 columns
test_that("pinochet_regime_df has 59 columns", {
  expect_equal(length(pinochet_regime_df), 59)
})

# Test 3: Confirm the data frame has 2,398 rows
test_that("pinochet_regime_df has 2,398 rows", {
  expect_equal(nrow(pinochet_regime_df), 2398)
})

# Test 4: Confirm the column names are correct
test_that("pinochet_regime_df has the expected column names", {
  expect_named(pinochet_regime_df, c(
    "individual_id", "group_id", "start_date_daily", "end_date_daily",
    "start_date_monthly", "end_date_monthly", "last_name", "first_name",
    "minor", "age", "male", "occupation", "occupation_detail",
    "victim_affiliation", "victim_affiliation_detail", "violence", "method",
    "interrogation", "torture", "mistreatment", "targeted", "press",
    "war_tribunal", "number_previous_arrests", "perpetrator_affiliation",
    "perpetrator_affiliation_detail", "nationality",
    "place_1", "location_1", "latitude_1", "longitude_1", "exact_coordinates_1",
    "place_2", "location_2", "latitude_2", "longitude_2", "exact_coordinates_2",
    "place_3", "location_3", "latitude_3", "longitude_3", "exact_coordinates_3",
    "place_4", "location_4", "latitude_4", "longitude_4", "exact_coordinates_4",
    "place_5", "location_5", "latitude_5", "longitude_5", "exact_coordinates_5",
    "place_6", "location_6", "latitude_6", "longitude_6", "exact_coordinates_6",
    "page", "additional_comments"
  ))
})

# Test 5: Confirm expected data types per column
test_that("pinochet_regime_df has expected column types", {
  expect_type(pinochet_regime_df$individual_id, "double")
  expect_type(pinochet_regime_df$group_id, "double")
  expect_s3_class(pinochet_regime_df$start_date_daily, "Date")
  expect_s3_class(pinochet_regime_df$end_date_daily, "Date")
  expect_s3_class(pinochet_regime_df$start_date_monthly, "Date")
  expect_s3_class(pinochet_regime_df$end_date_monthly, "Date")
  expect_type(pinochet_regime_df$last_name, "character")
  expect_type(pinochet_regime_df$first_name, "character")
  expect_type(pinochet_regime_df$minor, "double")
  expect_type(pinochet_regime_df$age, "double")
  expect_type(pinochet_regime_df$male, "double")
  expect_type(pinochet_regime_df$occupation, "character")
  expect_type(pinochet_regime_df$occupation_detail, "character")
  expect_type(pinochet_regime_df$victim_affiliation, "character")
  expect_type(pinochet_regime_df$victim_affiliation_detail, "character")
  expect_type(pinochet_regime_df$violence, "character")
  expect_type(pinochet_regime_df$method, "character")
  expect_type(pinochet_regime_df$interrogation, "double")
  expect_type(pinochet_regime_df$torture, "double")
  expect_type(pinochet_regime_df$mistreatment, "double")
  expect_type(pinochet_regime_df$targeted, "character")
  expect_type(pinochet_regime_df$press, "double")
  expect_type(pinochet_regime_df$war_tribunal, "double")
  expect_type(pinochet_regime_df$number_previous_arrests, "double")
  expect_type(pinochet_regime_df$perpetrator_affiliation, "character")
  expect_type(pinochet_regime_df$perpetrator_affiliation_detail, "character")
  expect_type(pinochet_regime_df$nationality, "character")

  # Repeat this structure for all location and coordinate columns
  for (i in 1:6) {
    expect_type(pinochet_regime_df[[paste0("place_", i)]], "character")
    expect_type(pinochet_regime_df[[paste0("location_", i)]], "character")
    expect_type(pinochet_regime_df[[paste0("latitude_", i)]], "double")
    expect_type(pinochet_regime_df[[paste0("longitude_", i)]], "double")
    expect_type(pinochet_regime_df[[paste0("exact_coordinates_", i)]], "double")
  }

  expect_type(pinochet_regime_df$page, "character")
  expect_type(pinochet_regime_df$additional_comments, "character")
})

