# ChileDataAPI - Access Chilean Economic, Demographic, Environmental, and Geopolitical Data via RESTful APIs and Curated Datasets
# Version 0.1.0
# Copyright (C) 2025 Renzo Caceres Rossi
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

#' Human Rights Abuses in the Pinochet Regime (1973–1990)
#'
#' This dataset, pinochet_regime_df, is a data frame containing detailed information about human rights violations
#' that occurred in Chile during the military dictatorship of Augusto Pinochet, spanning from 1973 to 1990.
#' The data includes victim-level records such as names, age, gender, affiliation, nature of the violence,
#' methods used, and geographic information when available. It is based on the National Truth and Reconciliation
#' Commission Report (1991, ISBN:9780268016463). The dataset also includes georeferenced locations across
#' multiple levels for incidents where such data could be retrieved.
#'
#' The dataset name has been kept as pinochet_regime_df to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' ChileDataAPI package and assists users in identifying its specific characteristics.
#' The suffix df indicates that the dataset is a data frame. The original content has not been modified.
#'
#' @name pinochet_regime_df
#' @format A data frame with 2,398 observations and 59 variables:
#' \describe{
#'   \item{individual_id}{Victim ID}
#'   \item{group_id}{Group ID for collective incidents}
#'   \item{start_date_daily}{Start date (day precision)}
#'   \item{end_date_daily}{End date (day precision)}
#'   \item{start_date_monthly}{Start date (month precision)}
#'   \item{end_date_monthly}{End date (month precision)}
#'   \item{last_name}{Victim's last name}
#'   \item{first_name}{Victim's first name}
#'   \item{minor}{Indicator if victim was a minor}
#'   \item{age}{Age of the victim}
#'   \item{male}{Indicator if victim was male}
#'   \item{occupation}{Victim's occupation}
#'   \item{occupation_detail}{Detailed occupation description}
#'   \item{victim_affiliation}{Affiliation of the victim}
#'   \item{victim_affiliation_detail}{Detailed affiliation}
#'   \item{violence}{Type of violence experienced}
#'   \item{method}{Method of violence}
#'   \item{interrogation}{Interrogation indicator}
#'   \item{torture}{Torture indicator}
#'   \item{mistreatment}{Mistreatment indicator}
#'   \item{targeted}{Targeting category}
#'   \item{press}{Indicator for press involvement}
#'   \item{war_tribunal}{War tribunal indicator}
#'   \item{number_previous_arrests}{Number of previous arrests}
#'   \item{perpetrator_affiliation}{Affiliation of perpetrator}
#'   \item{perpetrator_affiliation_detail}{Detailed affiliation of perpetrator}
#'   \item{nationality}{Victim's nationality}
#'   \item{place_1}{First incident location}
#'   \item{location_1}{First location detail}
#'   \item{latitude_1}{Latitude of first location}
#'   \item{longitude_1}{Longitude of first location}
#'   \item{exact_coordinates_1}{Indicator of coordinate precision (1 = exact)}
#'   \item{place_2}{Second incident location}
#'   \item{location_2}{Second location detail}
#'   \item{latitude_2}{Latitude of second location}
#'   \item{longitude_2}{Longitude of second location}
#'   \item{exact_coordinates_2}{Indicator of coordinate precision (2nd)}
#'   \item{place_3}{Third incident location}
#'   \item{location_3}{Third location detail}
#'   \item{latitude_3}{Latitude of third location}
#'   \item{longitude_3}{Longitude of third location}
#'   \item{exact_coordinates_3}{Indicator of coordinate precision (3rd)}
#'   \item{place_4}{Fourth incident location}
#'   \item{location_4}{Fourth location detail}
#'   \item{latitude_4}{Latitude of fourth location}
#'   \item{longitude_4}{Longitude of fourth location}
#'   \item{exact_coordinates_4}{Indicator of coordinate precision (4th)}
#'   \item{place_5}{Fifth incident location}
#'   \item{location_5}{Fifth location detail}
#'   \item{latitude_5}{Latitude of fifth location}
#'   \item{longitude_5}{Longitude of fifth location}
#'   \item{exact_coordinates_5}{Indicator of coordinate precision (5th)}
#'   \item{place_6}{Sixth incident location}
#'   \item{location_6}{Sixth location detail}
#'   \item{latitude_6}{Latitude of sixth location}
#'   \item{longitude_6}{Longitude of sixth location}
#'   \item{exact_coordinates_6}{Indicator of coordinate precision (6th)}
#'   \item{page}{Source page in the original report}
#'   \item{additional_comments}{Additional remarks or context}
#' }
#' @source Data taken from the pinochet package version 0.1.0.
#' @usage data(pinochet_regime_df)
#' @export
load("data/pinochet_regime_df.rda")
NULL



#' Voting Intentions in the 1988 Chilean Plebiscite
#'
#' This dataset, chile_plebiscite_df, is a data frame containing information on voting intentions in the 1988 Chilean plebiscite.
#' The data were collected from a national survey conducted by FLACSO/Chile during April and May of 1988. The dataset consists of
#' 2,700 observations and 8 variables, including demographic details such as region, sex, age, education, and income, as well as
#' voting preferences and support for the status quo. Some observations contain missing values.
#'
#' The dataset name has been kept as 'chile_plebiscite_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' ChileDataAPI package and assists users in identifying its specific characteristics.
#' The suffix 'df' indicates that the dataset is a data frame. The original content has not been modified
#' in any way.
#'
#' @name chile_plebiscite_df
#' @format A data frame with 2,700 observations and 8 variables:
#' \describe{
#'   \item{region}{Region of the respondent (factor with 5 levels: "C", "M", "N", "S", ...)}
#'   \item{population}{Population size of the respondent's area (integer)}
#'   \item{sex}{Sex of the respondent (factor: "F", "M")}
#'   \item{age}{Age in years (integer)}
#'   \item{education}{Education level (factor with 3 levels: "P", "PS", "S")}
#'   \item{income}{Income of the respondent (integer)}
#'   \item{statusquo}{Support for the status quo (numeric scale)}
#'   \item{vote}{Intended vote (factor with 4 levels)}
#' }
#' @source Data taken from the carData package version 3.0-5
#' @usage data(chile_plebiscite_df)
#' @export
load("data/chile_plebiscite_df.rda")
NULL



#' Chilean Census Example Data (San Pablo Commune, 2017)
#'
#' This dataset, census_chile_2017_df, is a data frame containing microdata from the 2017 Chilean census,
#' specifically from the commune of San Pablo. It was selected due to its relatively small size,
#' making it suitable for inclusion in CRAN and GitHub repositories. The dataset includes 7,512 observations
#' and 60 variables related to housing, households, individuals, migration, education, and geographic information.
#' All variable names and data values are in Spanish, as retrieved from the original source.
#'
#' The dataset name has been kept as census_chile_2017_df to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' ChileDataAPI package and assists users in identifying its specific characteristics.
#' The suffix df indicates that the dataset is a data frame. The original content has not been modified.
#'
#' @name census_chile_2017_df
#' @format A data frame with 7,512 observations and 60 variables:
#' \describe{
#'   \item{region}{Administrative region code}
#'   \item{provincia}{Province code}
#'   \item{comuna}{Commune code}
#'   \item{dc}{Census district code}
#'   \item{area}{Urban/rural area indicator}
#'   \item{zc_loc}{Census location zone}
#'   \item{id_zona_loc}{Location zone ID}
#'   \item{nviv}{Number of dwellings}
#'   \item{nhogar}{Number of households}
#'   \item{personan}{Person number}
#'   \item{p07}{Sex}
#'   \item{p08}{Relationship to head of household}
#'   \item{p09}{Age}
#'   \item{p10}{Place of birth (Chile or abroad)}
#'   \item{p10comuna}{Commune of birth}
#'   \item{p10pais}{Country of birth}
#'   \item{p11}{Last place of residence}
#'   \item{p11comuna}{Commune of last residence}
#'   \item{p11pais}{Country of last residence}
#'   \item{p12}{Place of residence in 2012}
#'   \item{p12comuna}{Commune of residence in 2012}
#'   \item{p12pais}{Country of residence in 2012}
#'   \item{p12a_llegada}{Year of arrival}
#'   \item{p12a_tramo}{Time range of arrival}
#'   \item{p13}{Health insurance}
#'   \item{p14}{Marital status}
#'   \item{p15}{Educational level}
#'   \item{p15a}{Currently attending school}
#'   \item{p16}{Employment status}
#'   \item{p16a}{Occupation type}
#'   \item{p16a_otro}{Other occupation (free text)}
#'   \item{p17}{Disability indicator}
#'   \item{p18}{Ethnic group}
#'   \item{p19}{Language spoken}
#'   \item{p20}{Language understood}
#'   \item{p21m}{Month of migration}
#'   \item{p21a}{Year of migration}
#'   \item{p10pais_grupo}{Grouped birth country}
#'   \item{p11pais_grupo}{Grouped last residence country}
#'   \item{p12pais_grupo}{Grouped 2012 residence country}
#'   \item{escolaridad}{Years of schooling}
#'   \item{p16a_grupo}{Grouped occupation}
#'   \item{region_15r}{Region code (15-region system)}
#'   \item{provincia_15r}{Province code (15-region system)}
#'   \item{comuna_15r}{Commune code (15-region system)}
#'   \item{p10comuna_15r}{Commune of birth (15-region system)}
#'   \item{p11comuna_15r}{Commune of last residence (15-region system)}
#'   \item{p12comuna_15r}{Commune of residence in 2012 (15-region system)}
#'   \item{geocode}{Geographical identifier}
#'   \item{p01}{Type of dwelling}
#'   \item{p02}{Dwelling condition}
#'   \item{p03a}{Material of exterior walls}
#'   \item{p03b}{Material of floor}
#'   \item{p03c}{Material of roof}
#'   \item{p04}{Number of rooms}
#'   \item{p05}{Number of bedrooms}
#'   \item{cant_hog}{Number of households in the dwelling}
#'   \item{cant_per}{Number of persons in the dwelling}
#'   \item{tipo_hogar}{Type of household}
#'   \item{tipo_operativo}{Census operation type}
#' }
#' @source Data taken from the ismtchile package version 2.1.5.
#' @usage data(census_chile_2017_df)
#' @export
load("data/census_chile_2017_df.rda")
NULL


#' Chilean 2021 First Round Presidential Election
#'
#' This dataset, chile_election_2021_df, is a data frame containing the results of the first round
#' of the 2021 Chilean presidential elections. It includes vote counts for seven presidential candidates,
#' as well as counts for blank and null votes. Each observation corresponds to an individual ballot box,
#' identified by its unique ID and associated electoral district. Additionally, the dataset includes demographic information on the age distribution of voters for each
#' ballot box, and a logical indicator for mismatches or inconsistencies in the vote counts.
#'
#' The dataset name has been kept as chile_election_2021_df to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' ChileDataAPI package and assists users in identifying its specific characteristics.
#' The suffix df indicates that the dataset is a data frame. The original content has not been modified.
#'
#' @name chile_election_2021_df
#' @format A data frame with 46,606 observations and 21 variables:
#' \describe{
#'   \item{REGION}{Administrative region (character)}
#'   \item{ELECTORAL.DISTRICT}{Electoral district (character)}
#'   \item{BALLOT.BOX}{Unique identifier for the ballot box (character)}
#'   \item{C1}{Votes for Candidate 1 (integer)}
#'   \item{C2}{Votes for Candidate 2 (integer)}
#'   \item{C3}{Votes for Candidate 3 (integer)}
#'   \item{C4}{Votes for Candidate 4 (integer)}
#'   \item{C5}{Votes for Candidate 5 (integer)}
#'   \item{C6}{Votes for Candidate 6 (integer)}
#'   \item{C7}{Votes for Candidate 7 (integer)}
#'   \item{BLANK.VOTES}{Count of blank votes (integer)}
#'   \item{NULL.VOTES}{Count of null votes (integer)}
#'   \item{X18.19}{Voters aged 18–19 (integer)}
#'   \item{X20.29}{Voters aged 20–29 (integer)}
#'   \item{X30.39}{Voters aged 30–39 (integer)}
#'   \item{X40.49}{Voters aged 40–49 (integer)}
#'   \item{X50.59}{Voters aged 50–59 (integer)}
#'   \item{X60.69}{Voters aged 60–69 (integer)}
#'   \item{X70.79}{Voters aged 70–79 (integer)}
#'   \item{X80.}{Voters aged 80 and older (integer)}
#'   \item{MISMATCH}{Logical indicator of inconsistency in vote reporting (logical)}
#' }
#' @source Data taken from the fastei package version 0.0.0.7.
#' @usage data(chile_election_2021_df)
#' @export
load("data/chile_election_2021_df.rda")
NULL



#' Chilean National Health Survey (2016–2017)
#'
#' This dataset, chile_health_survey_df, is a data frame containing information collected by the Chilean National Health Survey
#' conducted between 2016 and 2017. The objective of the survey was to study the health status of the Chilean population and
#' support health-related public policy design. The dataset includes biometric, behavioral, demographic, and educational variables
#' from 3,211 individuals.
#'
#' The dataset name has been kept as 'chile_health_survey_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' ChileDataAPI package and assists users in identifying its specific characteristics.
#' The suffix 'df' indicates that the dataset is a data frame. The original content has not been modified
#' in any way.
#'
#' @name chile_health_survey_df
#' @format A data frame with 3,211 observations and 12 variables:
#' \describe{
#'   \item{pas, pad}{Systolic and diastolic blood pressure (numeric)}
#'   \item{age}{Age of the respondent (integer)}
#'   \item{waist, bmi}{Waist circumference and body mass index (numeric)}
#'   \item{sedentary, smoker, diabetes, depression}{Health behavior and condition indicators (integer)}
#'   \item{male}{Sex of the respondent (1 = male, 0 = female) (integer)}
#'   \item{scholar2, scholar3}{Education level indicators (integer)}
#' }
#' @source Data taken from the abms package version 0.2
#' @usage data(chile_health_survey_df)
#' @export
load("data/chile_health_survey_df.rda")
NULL



#' Official Codes for Chilean Communes, Provinces, and Regions
#'
#' This dataset, territorial_codes_tbl_df, is a tibble containing official codes for communes, provinces, and regions in Chile.
#' The codes were provided by the Chilean government agency SUBDERE. The names of the administrative divisions were converted to ASCII
#' characters to avoid encoding issues. All variable names and data values are in Spanish, as retrieved from the original source.
#'
#' The dataset name has been kept as 'territorial_codes_tbl_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' ChileDataAPI package and assists users in identifying its specific characteristics.
#' The suffix 'df' indicates that the dataset is a data frame. The original content has not been modified
#' in any way.
#'
#' @name territorial_codes_tbl_df
#' @format A tibble with 346 observations and 6 variables:
#' \describe{
#'   \item{codigo_comuna, nombre_comuna}{Official commune code and commune name (character, in Spanish)}
#'   \item{codigo_provincia, nombre_provincia}{Official province code and province name (character, in Spanish)}
#'   \item{codigo_region, nombre_region}{Official region code and region name (character, in Spanish)}
#' }
#' @source Data taken from the chilemapas package version 0.3.0
#' @usage data(territorial_codes_tbl_df)
#' @export
load("data/territorial_codes_tbl_df.rda")
NULL



#' Average Araucaria Araucana Tree Ring Width
#'
#' This dataset, malleco_tree_rings_ts, is a time series object (`ts`) containing the average annual tree ring width,
#' measured in millimeters, for Araucaria Araucana trees located in the Malleco region of Chile.
#' The data spans 734 years, from 1242 to 1975, and was originally collected for use in climate and environmental
#' reconstructions. The frequency of the series is annual (one observation per year). The series shows interannual
#' variability in growth and is suitable for time series analysis and dendrochronological studies.
#'
#' The dataset name has been kept as 'malleco_tree_rings_ts' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' ChileDataAPI package and assists users in identifying its specific characteristics.
#' The suffix 'ts' indicates that the dataset is a time series object. The original content has not been modified
#' in any way.
#'
#' @name malleco_tree_rings_ts
#' @format A time series object with 734 annual observations:
#' \describe{
#'   \item{Start year}{1242}
#'   \item{End year}{1975}
#'   \item{Frequency}{Annual (1)}
#'   \item{Values}{Average annual ring width in millimeters (numeric)}
#' }
#' @source Data taken from the LSTS package version 2.1
#' @usage data(malleco_tree_rings_ts)
#' @export
load("data/malleco_tree_rings_ts.rda")
NULL

#' Chilean Earthquakes Data
#'
#' This dataset, chile_earthquakes_tbl_df, is a tibble containing information about significant (perceptible) earthquakes
#' that occurred in Chile from January 1st, 2012 to the present. The data was originally compiled by the Centro Sismológico Nacional (Chile)
#' and was published on Kaggle by Nicolás González Muñoz. The dataset includes 4,018 observations and 5 variables, capturing relevant geophysical characteristics
#' such as the date and time of occurrence, geographic coordinates, depth, and magnitude of each seismic event.
#'
#' The dataset name has been kept as 'chile_earthquakes_tbl_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' ChileDataAPI package and assists users in identifying its specific characteristics.
#' The suffix 'tbl_df' indicates that the dataset is a tibble (a modern data frame). The original content has not been modified
#' in any way. Variable names and values are in English, as originally provided by the source.
#'
#' @name chile_earthquakes_tbl_df
#' @format A tibble with 4,018 observations and 5 variables:
#' \describe{
#'   \item{Date(UTC)}{Timestamp of the earthquake in UTC (POSIXct)}
#'   \item{Latitude}{Latitude coordinate of the event (numeric)}
#'   \item{Longitude}{Longitude coordinate of the event (numeric)}
#'   \item{Depth}{Depth in kilometers (numeric)}
#'   \item{Magnitude}{Richter magnitude of the earthquake (numeric)}
#' }
#' @source Data taken from Kaggle: \url{https://www.kaggle.com/datasets/nicolasgonzalezmunoz/earthquakes-on-chile}
#' @usage data(chile_earthquakes_tbl_df)
#' @export
load("data/chile_earthquakes_tbl_df.rda")
NULL







