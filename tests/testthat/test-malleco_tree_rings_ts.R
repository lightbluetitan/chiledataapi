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

# malleco_tree_rings_ts

library(testthat)

# Test 1: Confirm the object is a time-series object
test_that("malleco_tree_rings_ts is a time-series object", {
  expect_s3_class(malleco_tree_rings_ts, "ts")
})

# Test 2: Confirm it has 734 observations
test_that("malleco_tree_rings_ts has 734 observations", {
  expect_equal(length(malleco_tree_rings_ts), 734)
})

# Test 3: Confirm the time series starts in 1242 and ends in 1975 (year and subperiod)
test_that("malleco_tree_rings_ts starts in 1242 and ends in 1975", {
  expect_equal(start(malleco_tree_rings_ts), c(1242, 1))
  expect_equal(end(malleco_tree_rings_ts), c(1975, 1))
})

# Test 4: Confirm frequency is yearly
test_that("malleco_tree_rings_ts has yearly frequency", {
  expect_equal(frequency(malleco_tree_rings_ts), 1)
})

# Test 5: Accept NA values as valid
test_that("malleco_tree_rings_ts allows NA values", {
  expect_true(all(is.na(malleco_tree_rings_ts) | is.numeric(malleco_tree_rings_ts)))
})

# Test 6: Confirm all values are numeric or NA
test_that("malleco_tree_rings_ts contains only numeric or NA values", {
  expect_true(is.numeric(malleco_tree_rings_ts))
})
