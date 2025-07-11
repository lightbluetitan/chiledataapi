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

  # Variables of the get_country_info function
  "name.common", "name.official", "capital", "region", "subregion", "population", "area", "languages"


))

utils::globalVariables(c("data"))
