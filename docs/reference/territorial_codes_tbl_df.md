# Official Codes for Chilean Communes, Provinces, and Regions

This dataset, territorial_codes_tbl_df, is a tibble containing official
codes for communes, provinces, and regions in Chile. The codes were
provided by the Chilean government agency SUBDERE. The names of the
administrative divisions were converted to ASCII characters to avoid
encoding issues. All variable names and data values are in Spanish, as
retrieved from the original source.

## Usage

``` r
data(territorial_codes_tbl_df)
```

## Format

A tibble with 346 observations and 6 variables:

- codigo_comuna, nombre_comuna:

  Official commune code and commune name (character, in Spanish)

- codigo_provincia, nombre_provincia:

  Official province code and province name (character, in Spanish)

- codigo_region, nombre_region:

  Official region code and region name (character, in Spanish)

## Source

Data taken from the chilemapas package version 0.3.0

## Details

The dataset name has been kept as 'territorial_codes_tbl_df' to avoid
confusion with other datasets in the R ecosystem. This naming convention
helps distinguish this dataset as part of the ChileDataAPI package and
assists users in identifying its specific characteristics. The suffix
'df' indicates that the dataset is a data frame. The original content
has not been modified in any way.
