# Get IPSA (Índice de Precios Selectivo de Acciones) from the findic.cl API

This function retrieves the historical values of the IPSA index ("Índice
de Precios Selectivo de Acciones") from the API endpoint:
<https://findic.cl/api/ipsa>. The data is provided by the Chilean
website [findic.cl](https://findic.cl).

## Usage

``` r
get_chile_ipsa()
```

## Value

A tibble (data frame) with the following columns:

- `fecha`: Fecha de la observación (in "YYYY-MM-DD" format).

- `valor`: Valor del índice IPSA en puntos (numeric).

## Details

The values returned by the API include metadata and a time series of
daily IPSA index values. The names of the variables and the values are
in Spanish, exactly as provided by the API. For example, the result
includes columns named `fecha` (date) and `valor` (value).

The function sends a GET request to the `/api/ipsa` endpoint. If the
request is successful (HTTP 200), it parses the JSON response and
extracts the time series data under the key `serie`.

All names and values are kept in Spanish as provided by the API and no
translation or modification is applied.

## Note

Requires internet connection. The function returns the values exactly as
provided in Spanish.

## See also

[`GET`](https://httr.r-lib.org/reference/GET.html),
[`fromJSON`](https://jeroen.r-universe.dev/jsonlite/reference/fromJSON.html),
[`as_tibble`](https://tibble.tidyverse.org/reference/as_tibble.html)

## Examples

``` r
if (FALSE) { # \dontrun{
ipsa_data <- get_chile_ipsa()
head(ipsa_data)
} # }
```
