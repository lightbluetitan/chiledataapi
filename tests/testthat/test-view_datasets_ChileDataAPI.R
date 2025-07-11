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

# view_datasets_ChileDataAPI

library(testthat)
library(ChileDataAPI)

test_that("view_datasets_ChileDataAPI works when package is loaded", {
  result <- view_datasets_ChileDataAPI()
  expect_type(result, "character")
  expect_true(length(result) > 0)
})

test_that("view_datasets_ChileDataAPI prints correct message", {
  output <- capture_messages(view_datasets_ChileDataAPI())
  expect_match(
    output[1],
    "Datasets available in the 'ChileDataAPI' package:",
    fixed = TRUE
  )
})

test_that("view_datasets_ChileDataAPI returns expected datasets", {
  datasets <- view_datasets_ChileDataAPI()
  expected_datasets <- c(
    "census_chile_2017_df",
    "chile_earthquakes_tbl_df",
    "chile_election_2021_df",
    "chile_health_survey_df",
    "chile_plebiscite_df",
    "malleco_tree_rings_ts",
    "pinochet_regime_df",
    "territorial_codes_tbl_df"


  )
  # Check if all expected datasets are present
  missing_datasets <- setdiff(expected_datasets, datasets)
  expect_true(
    length(missing_datasets) == 0,
    info = paste("Missing datasets:", paste(missing_datasets, collapse = ", "))
  )
})
