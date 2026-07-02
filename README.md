# ChileDataAPI

The `ChileDataAPI` package provides a unified interface to access open data from multiple public RESTful APIs, including the *FINDIC API*, the *World Bank API*, and *Nager.Date*. With a focus on Chile, the package enables users to retrieve real-time or historical data such as financial indicators (**UF, UTM, Dollar, Euro, Yen, Copper price per pound, Bitcoin, IPSA index**), and holidays.

In addition to API-based data retrieval, `ChileDataAPI` includes a curated collection of datasets that cover diverse aspects of Chilean society and environment, such as human rights violations during the Pinochet regime, electoral data, census samples, health surveys, seismic events, territorial codes, and environmental measurements.  

## Installation

You can install the `ChileDataAPI` package from CRAN with the following R function:

```R

install.packages("ChileDataAPI")

```


## Usage

After installation, load the package and start exploring and using its functions and datasets.

```R

library(ChileDataAPI)

```

### ChileDataAPI Functions

- `get_chile_bitcoin()`: Retrieves the daily Bitcoin price in Chilean Pesos over the last month.

- `get_chile_copper_pound()`: Returns historical daily copper prices (per pound).

- `get_chile_dollar()`: Provides the exchange rate of the U.S. Dollar in CLP.

- `get_chile_euro()`: Provides the exchange rate of the Euro in CLP.

- `get_chile_ipsa()`: Retrieves daily values of the IPSA (Chile's stock market index).

- `get_chile_uf()`: Returns daily values of the Unidad de Fomento (UF).

- `get_chile_utm()`: Returns monthly values of the Unidad Tributaria Mensual (UTM).

- `get_chile_yen()`: Provides the exchange rate of the Japanese Yen in CLP.

- `get_chile_holidays()`: Get official public holidays in Chile for a given year, e.g., `get_chile_holidays(2025)`. 

- `get_chile_child_mortality()`: Get Chile’s Under-5 Mortality Rate data from the World Bank.

- `get_chile_cpi()`: Get Chile’s Consumer Price Index (2010 = 100) data from the World Bank.

- `get_chile_energy_use()`: Get Chile’s Energy Use (kg of oil equivalent per capita) data from the World Bank. 

- `get_chile_gdp()`: Get Chile’s GDP (current US$) data from the World Bank.

- `get_chile_hospital_beds()`: Get Chile’s Hospital Beds (per 1,000 people) data from the World Bank.

- `get_chile_life_expectancy()`: Get Chile’s Life Expectancy at Birth data from the World Bank. 

- `get_chile_literacy_rate()`: Get Chile’s Adult Literacy Rate data from the World Bank.

- `get_chile_population()`: Get Chile’s Total Population data from the World Bank.

- `get_chile_unemployment()`: Get Chile’s Total Unemployment Rate data from the World Bank.

- `view_datasets_ChileDataAPI()`: Lists all curated datasets included in the `ChileDataAPI` package


## Dataset Suffixes

Each dataset in `ChileDataAPI` is labeled with a *suffix* to indicate its structure and type:

- `_df`: A standard data frame.

- `_ts`: A time series object.

- `_tbl_df`: A tibble data frame object.


## Datasets Included in ChileDataAPI

In addition to API access functions, `ChileDataAPI` provides several curated datasets offering valuable insights into *Chile*’s recent history, population health, territorial divisions, electoral processes, and seismic activity.
Here are some featured examples:

- `census_chile_2017_df`: Data frame containing microdata from the 2017 Chilean census, specifically from the commune of San Pablo. The dataset includes 7,512 observations, all variable names and data values are in Spanish.

- `chile_earthquakes_tbl_df`: Tibble containing information about significant (perceptible) earthquakes
that occurred in Chile from January 1st, 2012 to the present.

- `malleco_tree_rings_ts`: Time series object (`ts`) containing the average annual tree ring width,
measured in millimeters, for Araucaria Araucana trees located in the Malleco region of Chile.


## Example Code:

```R

# Load the package

library(ChileDataAPI)

# Provides the exchange rate of the U.S. Dollar in CLP

get_chile_dollar()

# Load a dataset

data("census_chile_2017_df")

# Shows six rows of the dataset

head(census_chile_2017_df)

# Display the structure of the dataset

str(census_chile_2017_df)

# Shows the whole dataset

View(census_chile_2017_df)

```
