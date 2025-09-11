# ChileDataAPI 0.2.0

## Breaking Changes

- `get_country_info()` was renamed to `get_country_info_cl()` to avoid naming conflicts with other packages and improve function identification.

The following APIs were added to the `ChileDataAPI` package:

- 'World Bank API' <https://datahelpdesk.worldbank.org/knowledgebase/articles/889392>, 
- 'Nager.Date' <https://date.nager.at/Api>.

The following functions were added to the `ChileDataAPI` package:

- `get_chile_holidays()`: Get official public holidays in chile for a given year. 

- `get_chile_child_mortality()`: Get Chile’s Under-5 Mortality Rate data from the World Bank.

- `get_chile_cpi()`: Get Chile’s Consumer Price Index (2010 = 100) data from the World Bank.

- `get_chile_energy_use()`: Get Chile’s Energy Use (kg of oil equivalent per capita) data from the World Bank. 

- `get_chile_gdp()`: Get Chile’s GDP (current US$) data from the World Bank.

- `get_chile_hospital_beds()`: Get Chile’s Hospital Beds (per 1,000 people) data from the World Bank.

- `get_chile_life_expectancy()`: Get Chile’s Life Expectancy at Birth data from the World Bank. 

- `get_chile_literacy_rate()`: Get Chile’s Adult Literacy Rate data from the World Bank.

- `get_chile_population()`: Get Chile’s Total Population data from the World Bank.

- `get_chile_unemployment()`: Get Chile’s Total Unemployment Rate data from the World Bank.


---

# ChileDataAPI 0.1.0

## Initial Release

- First release of `ChileDataAPI` package.
- Added `view_datasets_ChileDataAPI()` function to explore available datasets.
- Curated Collection of datasets that cover diverse aspects of Chilean society.
