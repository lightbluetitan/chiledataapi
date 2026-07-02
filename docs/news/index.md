# Changelog

## ChileDataAPI 0.3.0

### Breaking Changes

- **Removed `get_country_info_cl()`** from the package. This function
  depended on the ‘REST Countries’ API v3.1 endpoint, which was
  deprecated by its provider. The replacement v5 endpoint now requires
  an API key, which is incompatible with CRAN’s policy that packages
  using Internet resources must work without user-supplied credentials.
  As a consequence, all associated tests, documentation, and examples
  have been removed, and references to the ‘REST Countries API’ have
  been removed from the package (`DESCRIPTION`, `README.md`, vignette,
  `LICENSE.md`).

- The package now integrates **three** APIs instead of four: **FINDIC
  API**, **World Bank API**, and **Nager.Date**.

### Notes

- Updated copyright year to 2025-2026 across license files.

------------------------------------------------------------------------

## ChileDataAPI 0.2.0

CRAN release: 2025-09-11

### Breaking Changes

- `get_country_info()` was renamed to `get_country_info_cl()` to avoid
  naming conflicts with other packages and improve function
  identification.

The following APIs were added to the `ChileDataAPI` package:

- ‘World Bank API’
  <https://datahelpdesk.worldbank.org/knowledgebase/articles/889392>,
- ‘Nager.Date’ <https://date.nager.at/Api>.

The following functions were added to the `ChileDataAPI` package:

- [`get_chile_holidays()`](https://lightbluetitan.github.io/chiledataapi/reference/get_chile_holidays.md):
  Get official public holidays in chile for a given year.

- [`get_chile_child_mortality()`](https://lightbluetitan.github.io/chiledataapi/reference/get_chile_child_mortality.md):
  Get Chile’s Under-5 Mortality Rate data from the World Bank.

- [`get_chile_cpi()`](https://lightbluetitan.github.io/chiledataapi/reference/get_chile_cpi.md):
  Get Chile’s Consumer Price Index (2010 = 100) data from the World
  Bank.

- [`get_chile_energy_use()`](https://lightbluetitan.github.io/chiledataapi/reference/get_chile_energy_use.md):
  Get Chile’s Energy Use (kg of oil equivalent per capita) data from the
  World Bank.

- [`get_chile_gdp()`](https://lightbluetitan.github.io/chiledataapi/reference/get_chile_gdp.md):
  Get Chile’s GDP (current US\$) data from the World Bank.

- [`get_chile_hospital_beds()`](https://lightbluetitan.github.io/chiledataapi/reference/get_chile_hospital_beds.md):
  Get Chile’s Hospital Beds (per 1,000 people) data from the World Bank.

- [`get_chile_life_expectancy()`](https://lightbluetitan.github.io/chiledataapi/reference/get_chile_life_expectancy.md):
  Get Chile’s Life Expectancy at Birth data from the World Bank.

- [`get_chile_literacy_rate()`](https://lightbluetitan.github.io/chiledataapi/reference/get_chile_literacy_rate.md):
  Get Chile’s Adult Literacy Rate data from the World Bank.

- [`get_chile_population()`](https://lightbluetitan.github.io/chiledataapi/reference/get_chile_population.md):
  Get Chile’s Total Population data from the World Bank.

- [`get_chile_unemployment()`](https://lightbluetitan.github.io/chiledataapi/reference/get_chile_unemployment.md):
  Get Chile’s Total Unemployment Rate data from the World Bank.

------------------------------------------------------------------------

## ChileDataAPI 0.1.0

CRAN release: 2025-07-16

### Initial Release

- First release of `ChileDataAPI` package.
- Added
  [`view_datasets_ChileDataAPI()`](https://lightbluetitan.github.io/chiledataapi/reference/view_datasets_ChileDataAPI.md)
  function to explore available datasets.
- Curated Collection of datasets that cover diverse aspects of Chilean
  society.
