# Human Rights Abuses in the Pinochet Regime (1973–1990)

This dataset, pinochet_regime_df, is a data frame containing detailed
information about human rights violations that occurred in Chile during
the military dictatorship of Augusto Pinochet, spanning from 1973 to
1990. The data includes victim-level records such as names, age, gender,
affiliation, nature of the violence, methods used, and geographic
information when available. It is based on the National Truth and
Reconciliation Commission Report (1991, ISBN:9780268016463). The dataset
also includes georeferenced locations across multiple levels for
incidents where such data could be retrieved.

## Usage

``` r
data(pinochet_regime_df)
```

## Format

A data frame with 2,398 observations and 59 variables:

- individual_id:

  Victim ID

- group_id:

  Group ID for collective incidents

- start_date_daily:

  Start date (day precision)

- end_date_daily:

  End date (day precision)

- start_date_monthly:

  Start date (month precision)

- end_date_monthly:

  End date (month precision)

- last_name:

  Victim's last name

- first_name:

  Victim's first name

- minor:

  Indicator if victim was a minor

- age:

  Age of the victim

- male:

  Indicator if victim was male

- occupation:

  Victim's occupation

- occupation_detail:

  Detailed occupation description

- victim_affiliation:

  Affiliation of the victim

- victim_affiliation_detail:

  Detailed affiliation

- violence:

  Type of violence experienced

- method:

  Method of violence

- interrogation:

  Interrogation indicator

- torture:

  Torture indicator

- mistreatment:

  Mistreatment indicator

- targeted:

  Targeting category

- press:

  Indicator for press involvement

- war_tribunal:

  War tribunal indicator

- number_previous_arrests:

  Number of previous arrests

- perpetrator_affiliation:

  Affiliation of perpetrator

- perpetrator_affiliation_detail:

  Detailed affiliation of perpetrator

- nationality:

  Victim's nationality

- place_1:

  First incident location

- location_1:

  First location detail

- latitude_1:

  Latitude of first location

- longitude_1:

  Longitude of first location

- exact_coordinates_1:

  Indicator of coordinate precision (1 = exact)

- place_2:

  Second incident location

- location_2:

  Second location detail

- latitude_2:

  Latitude of second location

- longitude_2:

  Longitude of second location

- exact_coordinates_2:

  Indicator of coordinate precision (2nd)

- place_3:

  Third incident location

- location_3:

  Third location detail

- latitude_3:

  Latitude of third location

- longitude_3:

  Longitude of third location

- exact_coordinates_3:

  Indicator of coordinate precision (3rd)

- place_4:

  Fourth incident location

- location_4:

  Fourth location detail

- latitude_4:

  Latitude of fourth location

- longitude_4:

  Longitude of fourth location

- exact_coordinates_4:

  Indicator of coordinate precision (4th)

- place_5:

  Fifth incident location

- location_5:

  Fifth location detail

- latitude_5:

  Latitude of fifth location

- longitude_5:

  Longitude of fifth location

- exact_coordinates_5:

  Indicator of coordinate precision (5th)

- place_6:

  Sixth incident location

- location_6:

  Sixth location detail

- latitude_6:

  Latitude of sixth location

- longitude_6:

  Longitude of sixth location

- exact_coordinates_6:

  Indicator of coordinate precision (6th)

- page:

  Source page in the original report

- additional_comments:

  Additional remarks or context

## Source

Data taken from the pinochet package version 0.1.0.

## Details

The dataset name has been kept as pinochet_regime_df to avoid confusion
with other datasets in the R ecosystem. This naming convention helps
distinguish this dataset as part of the ChileDataAPI package and assists
users in identifying its specific characteristics. The suffix df
indicates that the dataset is a data frame. The original content has not
been modified.
