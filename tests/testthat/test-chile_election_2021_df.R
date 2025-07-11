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

# chile_election_2021_df

library(testthat)

# Test 1: Confirm the object is a data frame
test_that("chile_election_2021_df is a data frame", {
  expect_s3_class(chile_election_2021_df, "data.frame")
})

# Test 2: Confirm it has exactly 21 columns
test_that("chile_election_2021_df has 21 columns", {
  expect_equal(length(chile_election_2021_df), 21)
})

# Test 3: Confirm it has exactly 46,606 rows
test_that("chile_election_2021_df has 46,606 rows", {
  expect_equal(nrow(chile_election_2021_df), 46606)
})

# Test 4: Confirm column names are correct
test_that("chile_election_2021_df has correct column names", {
  expect_named(chile_election_2021_df, c(
    "REGION", "ELECTORAL.DISTRICT", "BALLOT.BOX",
    "C1", "C2", "C3", "C4", "C5", "C6", "C7",
    "BLANK.VOTES", "NULL.VOTES",
    "X18.19", "X20.29", "X30.39", "X40.49",
    "X50.59", "X60.69", "X70.79", "X80.",
    "MISMATCH"
  ))
})

# Test 5: Confirm column types are correct
test_that("chile_election_2021_df columns have correct types", {
  expect_type(chile_election_2021_df$REGION, "character")
  expect_type(chile_election_2021_df$ELECTORAL.DISTRICT, "character")
  expect_type(chile_election_2021_df$BALLOT.BOX, "character")
  expect_type(chile_election_2021_df$C1, "integer")
  expect_type(chile_election_2021_df$C2, "integer")
  expect_type(chile_election_2021_df$C3, "integer")
  expect_type(chile_election_2021_df$C4, "integer")
  expect_type(chile_election_2021_df$C5, "integer")
  expect_type(chile_election_2021_df$C6, "integer")
  expect_type(chile_election_2021_df$C7, "integer")
  expect_type(chile_election_2021_df$BLANK.VOTES, "integer")
  expect_type(chile_election_2021_df$NULL.VOTES, "integer")
  expect_type(chile_election_2021_df$X18.19, "integer")
  expect_type(chile_election_2021_df$X20.29, "integer")
  expect_type(chile_election_2021_df$X30.39, "integer")
  expect_type(chile_election_2021_df$X40.49, "integer")
  expect_type(chile_election_2021_df$X50.59, "integer")
  expect_type(chile_election_2021_df$X60.69, "integer")
  expect_type(chile_election_2021_df$X70.79, "integer")
  expect_type(chile_election_2021_df$`X80.`, "integer")
  expect_type(chile_election_2021_df$MISMATCH, "logical")
})
