# Voting Intentions in the 1988 Chilean Plebiscite

This dataset, chile_plebiscite_df, is a data frame containing
information on voting intentions in the 1988 Chilean plebiscite. The
data were collected from a national survey conducted by FLACSO/Chile
during April and May of 1988. The dataset consists of 2,700 observations
and 8 variables, including demographic details such as region, sex, age,
education, and income, as well as voting preferences and support for the
status quo. Some observations contain missing values.

## Usage

``` r
data(chile_plebiscite_df)
```

## Format

A data frame with 2,700 observations and 8 variables:

- region:

  Region of the respondent (factor with 5 levels: "C", "M", "N", "S",
  ...)

- population:

  Population size of the respondent's area (integer)

- sex:

  Sex of the respondent (factor: "F", "M")

- age:

  Age in years (integer)

- education:

  Education level (factor with 3 levels: "P", "PS", "S")

- income:

  Income of the respondent (integer)

- statusquo:

  Support for the status quo (numeric scale)

- vote:

  Intended vote (factor with 4 levels)

## Source

Data taken from the carData package version 3.0-5

## Details

The dataset name has been kept as 'chile_plebiscite_df' to avoid
confusion with other datasets in the R ecosystem. This naming convention
helps distinguish this dataset as part of the ChileDataAPI package and
assists users in identifying its specific characteristics. The suffix
'df' indicates that the dataset is a data frame. The original content
has not been modified in any way.
