# ChileDataAPI - Access Chilean Data via APIs and Curated Datasets
# Version 0.3.0
# Copyright (C) 2025-2026 Renzo Caceres Rossi
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

# utils.R


utils::globalVariables(c(


  # Variables of the get_chile_bitcoin function

  "fecha","valor",

  # Variables of the get_chile_copper_pound function

  "fecha","valor",

  # Variables of the get_chile_dollar function

  "fecha","valor",

  # Variables of the get_chile_euro function
  "fecha","valor",

  # Variables of the get_chile_ipsa function
  "fecha","valor",

  # Variables of the get_chile_uf function
  "fecha","valor",

  # Variables of the get_chile_utm function
  "fecha","valor",

  # Variables of the get_chile_yen function
  "fecha","valor",

  # Variables of the get_country_info_cl function
  "name_common", "name_official", "region", "subregion", "capital", "area", "population", "languages",

  # Variables of the get_chile_holidays function
  "date","local_name","name",

  # Variables of the get_chile_child_mortality function
  "indicator","country","year","value",

  # Variables of the get_chile_cpi function
  "indicator","country","year","value",

  # Variables of the get_chile_energy_use function
  "indicator","country","year","value",

  # Variables of the get_chile_gdp function
  "indicator","country","year","value","value_label",

  # Variables of the get_chile_hospital_beds function
  "indicator","country","year","value",

  # Variables of the get_chile_life_expectancy function
  "indicator","country","year","value",

  # Variables of the get_chile_literacy_rate function
  "indicator","country","year","value",

  # Variables of the get_chile_population function
  "indicator","country","year","value","value_label",

  # Variables of the get_chile_unemployment function
  "indicator","country","year","value"



))

utils::globalVariables(c("data"))
