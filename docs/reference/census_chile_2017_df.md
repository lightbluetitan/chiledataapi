# Chilean Census Example Data (San Pablo Commune, 2017)

This dataset, census_chile_2017_df, is a data frame containing microdata
from the 2017 Chilean census, specifically from the commune of San
Pablo. It was selected due to its relatively small size, making it
suitable for inclusion in CRAN and GitHub repositories. The dataset
includes 7,512 observations and 60 variables related to housing,
households, individuals, migration, education, and geographic
information. All variable names and data values are in Spanish, as
retrieved from the original source.

## Usage

``` r
data(census_chile_2017_df)
```

## Format

A data frame with 7,512 observations and 60 variables:

- region:

  Administrative region code

- provincia:

  Province code

- comuna:

  Commune code

- dc:

  Census district code

- area:

  Urban/rural area indicator

- zc_loc:

  Census location zone

- id_zona_loc:

  Location zone ID

- nviv:

  Number of dwellings

- nhogar:

  Number of households

- personan:

  Person number

- p07:

  Sex

- p08:

  Relationship to head of household

- p09:

  Age

- p10:

  Place of birth (Chile or abroad)

- p10comuna:

  Commune of birth

- p10pais:

  Country of birth

- p11:

  Last place of residence

- p11comuna:

  Commune of last residence

- p11pais:

  Country of last residence

- p12:

  Place of residence in 2012

- p12comuna:

  Commune of residence in 2012

- p12pais:

  Country of residence in 2012

- p12a_llegada:

  Year of arrival

- p12a_tramo:

  Time range of arrival

- p13:

  Health insurance

- p14:

  Marital status

- p15:

  Educational level

- p15a:

  Currently attending school

- p16:

  Employment status

- p16a:

  Occupation type

- p16a_otro:

  Other occupation (free text)

- p17:

  Disability indicator

- p18:

  Ethnic group

- p19:

  Language spoken

- p20:

  Language understood

- p21m:

  Month of migration

- p21a:

  Year of migration

- p10pais_grupo:

  Grouped birth country

- p11pais_grupo:

  Grouped last residence country

- p12pais_grupo:

  Grouped 2012 residence country

- escolaridad:

  Years of schooling

- p16a_grupo:

  Grouped occupation

- region_15r:

  Region code (15-region system)

- provincia_15r:

  Province code (15-region system)

- comuna_15r:

  Commune code (15-region system)

- p10comuna_15r:

  Commune of birth (15-region system)

- p11comuna_15r:

  Commune of last residence (15-region system)

- p12comuna_15r:

  Commune of residence in 2012 (15-region system)

- geocode:

  Geographical identifier

- p01:

  Type of dwelling

- p02:

  Dwelling condition

- p03a:

  Material of exterior walls

- p03b:

  Material of floor

- p03c:

  Material of roof

- p04:

  Number of rooms

- p05:

  Number of bedrooms

- cant_hog:

  Number of households in the dwelling

- cant_per:

  Number of persons in the dwelling

- tipo_hogar:

  Type of household

- tipo_operativo:

  Census operation type

## Source

Data taken from the ismtchile package version 2.1.5.

## Details

The dataset name has been kept as census_chile_2017_df to avoid
confusion with other datasets in the R ecosystem. This naming convention
helps distinguish this dataset as part of the ChileDataAPI package and
assists users in identifying its specific characteristics. The suffix df
indicates that the dataset is a data frame. The original content has not
been modified.
