# View Available Datasets in ChileDataAPI

This function lists all datasets available in the 'ChileDataAPI'
package. If the 'ChileDataAPI' package is not loaded, it stops and shows
an error message. If no datasets are available, it returns a message and
an empty vector.

## Usage

``` r
view_datasets_ChileDataAPI()
```

## Value

A character vector with the names of the available datasets. If no
datasets are found, it returns an empty character vector.

## Examples

``` r
if (requireNamespace("ChileDataAPI", quietly = TRUE)) {
  library(ChileDataAPI)
  view_datasets_ChileDataAPI()
}
#> Datasets available in the 'ChileDataAPI' package:
#> [1] "census_chile_2017_df"     "chile_earthquakes_tbl_df"
#> [3] "chile_election_2021_df"   "chile_health_survey_df"  
#> [5] "chile_plebiscite_df"      "malleco_tree_rings_ts"   
#> [7] "pinochet_regime_df"       "territorial_codes_tbl_df"
```
