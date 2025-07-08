# ChileDataAPI

The `ChileDataAPI` package provides a unified interface to access open data from the *FINDIC API* and the *REST Countries API*, with a focus on Chile. 
It allows users to easily retrieve up-to-date time series data on financial indicators such as the **UF, UTM, Dollar, Euro, Yen, Copper price per pound, Bitcoin, and the IPSA index**, as well as international metadata on countries via standardized API calls.

All API-based functions return data as tidy tibble objects, making them ready for immediate use in data pipelines.
The financial indicator functions, such as `get_chile_dollar()`, `get_chile_uf()`, and `get_chile_bitcoin()`, provide real-time series of daily or monthly values, with each row representing a timestamped observation. 
This makes `ChileDataAPI` a valuable tool for working with economic time series data in a reproducible manner.

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

- `get_country_info(name)`: Get essential information about Chile or any other country by its full name
Example: *get_country_info("Chile")*,*get_country_info("chile")*,*get_country_info("Peru")*

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

# Selected, essential information about Chile

get_country_info("Chile")

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
