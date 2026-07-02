# Get Chile's Adult Literacy Rate

Retrieves Chile's adult literacy rate ( for the years 2010 to 2022 using
the World Bank Open Data API. The indicator used is `SE.ADT.LITR.ZS`.

## Usage

``` r
get_chile_literacy_rate()
```

## Source

World Bank Open Data API:
<https://data.worldbank.org/indicator/SE.ADT.LITR.ZS>

## Value

A tibble with the following columns:

- `indicator`: Indicator name

- `country`: Country name ("Chile")

- `year`: Year of the data (integer)

- `value`: Literacy rate as a percentage

## Details

This function sends a GET request to the World Bank API. If the API
request fails or returns an error status code, the function returns
`NULL` with an informative message.

## Note

Requires internet connection.

## See also

[`GET`](https://httr.r-lib.org/reference/GET.html),
[`fromJSON`](https://jeroen.r-universe.dev/jsonlite/reference/fromJSON.html),
[`as_tibble`](https://tibble.tidyverse.org/reference/as_tibble.html)

## Examples

``` r
# \donttest{
  literacy_data <- get_chile_literacy_rate()
  head(literacy_data)
#> # A tibble: 6 × 4
#>   indicator                                                  country  year value
#>   <chr>                                                      <chr>   <int> <dbl>
#> 1 Literacy rate, adult total (% of people ages 15 and above) Chile    2022  NA  
#> 2 Literacy rate, adult total (% of people ages 15 and above) Chile    2021  NA  
#> 3 Literacy rate, adult total (% of people ages 15 and above) Chile    2020  NA  
#> 4 Literacy rate, adult total (% of people ages 15 and above) Chile    2019  NA  
#> 5 Literacy rate, adult total (% of people ages 15 and above) Chile    2018  NA  
#> 6 Literacy rate, adult total (% of people ages 15 and above) Chile    2017  96.4
# }
```
