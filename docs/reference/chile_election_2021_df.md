# Chilean 2021 First Round Presidential Election

This dataset, chile_election_2021_df, is a data frame containing the
results of the first round of the 2021 Chilean presidential elections.
It includes vote counts for seven presidential candidates, as well as
counts for blank and null votes. Each observation corresponds to an
individual ballot box, identified by its unique ID and associated
electoral district. Additionally, the dataset includes demographic
information on the age distribution of voters for each ballot box, and a
logical indicator for mismatches or inconsistencies in the vote counts.

## Usage

``` r
data(chile_election_2021_df)
```

## Format

A data frame with 46,606 observations and 21 variables:

- REGION:

  Administrative region (character)

- ELECTORAL.DISTRICT:

  Electoral district (character)

- BALLOT.BOX:

  Unique identifier for the ballot box (character)

- C1:

  Votes for Candidate 1 (integer)

- C2:

  Votes for Candidate 2 (integer)

- C3:

  Votes for Candidate 3 (integer)

- C4:

  Votes for Candidate 4 (integer)

- C5:

  Votes for Candidate 5 (integer)

- C6:

  Votes for Candidate 6 (integer)

- C7:

  Votes for Candidate 7 (integer)

- BLANK.VOTES:

  Count of blank votes (integer)

- NULL.VOTES:

  Count of null votes (integer)

- X18.19:

  Voters aged 18–19 (integer)

- X20.29:

  Voters aged 20–29 (integer)

- X30.39:

  Voters aged 30–39 (integer)

- X40.49:

  Voters aged 40–49 (integer)

- X50.59:

  Voters aged 50–59 (integer)

- X60.69:

  Voters aged 60–69 (integer)

- X70.79:

  Voters aged 70–79 (integer)

- X80.:

  Voters aged 80 and older (integer)

- MISMATCH:

  Logical indicator of inconsistency in vote reporting (logical)

## Source

Data taken from the fastei package version 0.0.0.7.

## Details

The dataset name has been kept as chile_election_2021_df to avoid
confusion with other datasets in the R ecosystem. This naming convention
helps distinguish this dataset as part of the ChileDataAPI package and
assists users in identifying its specific characteristics. The suffix df
indicates that the dataset is a data frame. The original content has not
been modified.
