# Get Country Information for Chile

Retrieves comprehensive country information for Chile from the REST
Countries API. This function fetches data including official and common
names, geographical information, capital, area, population, and
languages.

## Usage

``` r
get_country_info_cl()
```

## Value

A tibble with one row containing Chile's country information:

- name_common:

  Common name of the country

- name_official:

  Official name of the country

- region:

  Geographic region

- subregion:

  Geographic subregion

- capital:

  Capital city(ies)

- area:

  Total area in square kilometers

- population:

  Total population

- languages:

  Languages spoken (comma-separated)

## Details

This function makes a request to the REST Countries API v3.1 endpoint
specifically for Chile using full text search. It handles API errors
gracefully and returns NULL if the request fails or no data is found.

## Examples

``` r
# \donttest{
# Get Chile information
cl_info <- get_country_info_cl()
print(cl_info)
#> # A tibble: 1 × 8
#>   name_common name_official region subregion capital   area population languages
#>   <chr>       <chr>         <chr>  <chr>     <chr>    <dbl>      <int> <chr>    
#> 1 Chile       Republic of … Ameri… South Am… Santia… 756102   19116209 Spanish  
# }
```
