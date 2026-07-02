# Chilean Earthquakes Data

This dataset, chile_earthquakes_tbl_df, is a tibble containing
information about significant (perceptible) earthquakes that occurred in
Chile from January 1st, 2012 to the present. The data was originally
compiled by the Centro Sismológico Nacional (Chile) and was published on
Kaggle by Nicolás González Muñoz. The dataset includes 4,018
observations and 5 variables, capturing relevant geophysical
characteristics such as the date and time of occurrence, geographic
coordinates, depth, and magnitude of each seismic event.

## Usage

``` r
data(chile_earthquakes_tbl_df)
```

## Format

A tibble with 4,018 observations and 5 variables:

- Date(UTC):

  Timestamp of the earthquake in UTC (POSIXct)

- Latitude:

  Latitude coordinate of the event (numeric)

- Longitude:

  Longitude coordinate of the event (numeric)

- Depth:

  Depth in kilometers (numeric)

- Magnitude:

  Richter magnitude of the earthquake (numeric)

## Source

Data taken from Kaggle:
<https://www.kaggle.com/datasets/nicolasgonzalezmunoz/earthquakes-on-chile>

## Details

The dataset name has been kept as 'chile_earthquakes_tbl_df' to avoid
confusion with other datasets in the R ecosystem. This naming convention
helps distinguish this dataset as part of the ChileDataAPI package and
assists users in identifying its specific characteristics. The suffix
'tbl_df' indicates that the dataset is a tibble (a modern data frame).
The original content has not been modified in any way. Variable names
and values are in English, as originally provided by the source.
