# Chilean National Health Survey (2016–2017)

This dataset, chile_health_survey_df, is a data frame containing
information collected by the Chilean National Health Survey conducted
between 2016 and 2017. The objective of the survey was to study the
health status of the Chilean population and support health-related
public policy design. The dataset includes biometric, behavioral,
demographic, and educational variables from 3,211 individuals.

## Usage

``` r
data(chile_health_survey_df)
```

## Format

A data frame with 3,211 observations and 12 variables:

- pas, pad:

  Systolic and diastolic blood pressure (numeric)

- age:

  Age of the respondent (integer)

- waist, bmi:

  Waist circumference and body mass index (numeric)

- sedentary, smoker, diabetes, depression:

  Health behavior and condition indicators (integer)

- male:

  Sex of the respondent (1 = male, 0 = female) (integer)

- scholar2, scholar3:

  Education level indicators (integer)

## Source

Data taken from the abms package version 0.2

## Details

The dataset name has been kept as 'chile_health_survey_df' to avoid
confusion with other datasets in the R ecosystem. This naming convention
helps distinguish this dataset as part of the ChileDataAPI package and
assists users in identifying its specific characteristics. The suffix
'df' indicates that the dataset is a data frame. The original content
has not been modified in any way.
