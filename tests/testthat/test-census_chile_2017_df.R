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

# census_chile_2017_df

library(testthat)

# Test 1: Confirm the object is a data frame
test_that("census_chile_2017_df is a data frame", {
  expect_s3_class(census_chile_2017_df, "data.frame")
})

# Test 2: Confirm it has exactly 60 columns
test_that("census_chile_2017_df has 60 columns", {
  expect_equal(length(census_chile_2017_df), 60)
})

# Test 3: Confirm it has exactly 7512 rows
test_that("census_chile_2017_df has 7512 rows", {
  expect_equal(nrow(census_chile_2017_df), 7512)
})

# Test 4: Confirm column names are correct
test_that("census_chile_2017_df has correct column names", {
  expect_named(census_chile_2017_df, c(
    "region", "provincia", "comuna", "dc", "area", "zc_loc", "id_zona_loc",
    "nviv", "nhogar", "personan", "p07", "p08", "p09", "p10", "p10comuna",
    "p10pais", "p11", "p11comuna", "p11pais", "p12", "p12comuna", "p12pais",
    "p12a_llegada", "p12a_tramo", "p13", "p14", "p15", "p15a", "p16", "p16a",
    "p16a_otro", "p17", "p18", "p19", "p20", "p21m", "p21a", "p10pais_grupo",
    "p11pais_grupo", "p12pais_grupo", "escolaridad", "p16a_grupo", "region_15r",
    "provincia_15r", "comuna_15r", "p10comuna_15r", "p11comuna_15r", "p12comuna_15r",
    "geocode", "p01", "p02", "p03a", "p03b", "p03c", "p04", "p05",
    "cant_hog", "cant_per", "tipo_hogar", "tipo_operativo"
  ))
})

# Test 5: Confirm column types are as expected
test_that("census_chile_2017_df columns have correct types", {
  expect_type(census_chile_2017_df$region, "integer")
  expect_type(census_chile_2017_df$provincia, "integer")
  expect_type(census_chile_2017_df$comuna, "character")
  expect_type(census_chile_2017_df$dc, "character")
  expect_type(census_chile_2017_df$area, "character")
  expect_type(census_chile_2017_df$zc_loc, "character")
  expect_type(census_chile_2017_df$id_zona_loc, "integer")
  expect_type(census_chile_2017_df$nviv, "integer")
  expect_type(census_chile_2017_df$nhogar, "integer")
  expect_type(census_chile_2017_df$personan, "integer")
  expect_type(census_chile_2017_df$p07, "integer")
  expect_type(census_chile_2017_df$p08, "integer")
  expect_type(census_chile_2017_df$p09, "integer")
  expect_type(census_chile_2017_df$p10, "integer")
  expect_type(census_chile_2017_df$p10comuna, "integer")
  expect_type(census_chile_2017_df$p10pais, "integer")
  expect_type(census_chile_2017_df$p11, "integer")
  expect_type(census_chile_2017_df$p11comuna, "integer")
  expect_type(census_chile_2017_df$p11pais, "integer")
  expect_type(census_chile_2017_df$p12, "integer")
  expect_type(census_chile_2017_df$p12comuna, "integer")
  expect_type(census_chile_2017_df$p12pais, "integer")
  expect_type(census_chile_2017_df$p12a_llegada, "integer")
  expect_type(census_chile_2017_df$p12a_tramo, "integer")
  expect_type(census_chile_2017_df$p13, "integer")
  expect_type(census_chile_2017_df$p14, "integer")
  expect_type(census_chile_2017_df$p15, "integer")
  expect_type(census_chile_2017_df$p15a, "integer")
  expect_type(census_chile_2017_df$p16, "integer")
  expect_type(census_chile_2017_df$p16a, "integer")
  expect_type(census_chile_2017_df$p16a_otro, "integer")
  expect_type(census_chile_2017_df$p17, "integer")
  expect_type(census_chile_2017_df$p18, "character")
  expect_type(census_chile_2017_df$p19, "integer")
  expect_type(census_chile_2017_df$p20, "integer")
  expect_type(census_chile_2017_df$p21m, "integer")
  expect_type(census_chile_2017_df$p21a, "integer")
  expect_type(census_chile_2017_df$p10pais_grupo, "integer")
  expect_type(census_chile_2017_df$p11pais_grupo, "integer")
  expect_type(census_chile_2017_df$p12pais_grupo, "integer")
  expect_type(census_chile_2017_df$escolaridad, "integer")
  expect_type(census_chile_2017_df$p16a_grupo, "integer")
  expect_type(census_chile_2017_df$region_15r, "integer")
  expect_type(census_chile_2017_df$provincia_15r, "integer")
  expect_type(census_chile_2017_df$comuna_15r, "integer")
  expect_type(census_chile_2017_df$p10comuna_15r, "integer")
  expect_type(census_chile_2017_df$p11comuna_15r, "integer")
  expect_type(census_chile_2017_df$p12comuna_15r, "integer")
  expect_type(census_chile_2017_df$geocode, "character")
  expect_type(census_chile_2017_df$p01, "integer")
  expect_type(census_chile_2017_df$p02, "integer")
  expect_type(census_chile_2017_df$p03a, "integer")
  expect_type(census_chile_2017_df$p03b, "integer")
  expect_type(census_chile_2017_df$p03c, "integer")
  expect_type(census_chile_2017_df$p04, "integer")
  expect_type(census_chile_2017_df$p05, "integer")
  expect_type(census_chile_2017_df$cant_hog, "integer")
  expect_type(census_chile_2017_df$cant_per, "integer")
  expect_type(census_chile_2017_df$tipo_hogar, "integer")
  expect_type(census_chile_2017_df$tipo_operativo, "integer")
})
