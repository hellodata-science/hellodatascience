library(tidyverse)

# Data from https://www.bls.gov/tus/data/datafiles-0324.htm

# Read in data ------------------------------------------------------------

atus_respondent <- read_delim(
  here::here("data-raw/atus-college/atusresp_2024.dat"), 
  delim = ",", 
  show_col_types = FALSE
)

atus_roster <- read_delim(
  here::here("data-raw/atus-college/atusrost_2024.dat"), 
  delim = ",", 
  show_col_types = FALSE
)

atus_summary <- read_delim(
  here::here("data-raw/atus-college/atussum_2024.dat"), 
  delim = ",", 
  show_col_types = FALSE
)


# Wrangle data ------------------------------------------------------------

atus_join1 <- atus_respondent |> 
  left_join(atus_roster, by = c("TUCASEID", "TULINENO")) |> 
  select(
    subject_id = TUCASEID,
    employment = TRDPFTPT,
    age = TEAGE,
    enrollment = TESCHFT,
    academic_institution = TESCHLVL,
    weekly_earnings = TRERNWA,
    household_size = TRNUMHOU,
    time_alone = TRTALONE,
  ) |> 
  mutate(
    employment = case_when(
      employment == 1 ~ "Full Time",
      employment == 2 ~ "Part Time",
      is.na(employment) | employment %in% c(-1, -2, -3) ~ NA,
      TRUE ~ "Hellodata cleaning error"
    ),
    age = case_when(
      age >= 0 & age <= 85 ~ as.numeric(age),
      is.na(age) | age %in% c(-1, -2, -3) ~ NA,
      TRUE ~ 404404404 # Hellodata cleaning error check
    ),
    enrollment = case_when(
      enrollment == 1 ~ "Full Time",
      enrollment == 2 ~ "Part Time",
      is.na(enrollment) | enrollment %in% c(-1, -2, -3) ~ NA,
    ),
    academic_institution = case_when(
      academic_institution == 1 ~ "High School",
      academic_institution == 2 ~ "College or University",
      is.na(academic_institution) | academic_institution %in% c(-1, -2, -3) ~ NA,
      TRUE ~ "Hellodata cleaning error check"
    ),
    weekly_earnings = case_when(
      is.na(weekly_earnings) | weekly_earnings %in% c(-1, -2, -3) ~ NA,
      weekly_earnings >= 0 & weekly_earnings <= 9999999 ~ weekly_earnings / 100,
      TRUE ~ 404404404 # Hellodata cleaning error check
    )
  ) |> 
  filter( # What we want in our data
    academic_institution == "College or University"
  ) |> 
  mutate( # Types we want for each variable
    employment = factor(employment),
    enrollment = factor(enrollment)
  ) 

atus_college <- atus_summary |> 
  mutate(
    shopping_time = rowSums(across(starts_with("t0701"))),
    sports_time = rowSums(across(starts_with("t1301"))),
    religious_time = t140101 + t140102
  ) |> 
  select(
    subject_id = TUCASEID,
    sleep_time = t010101,
    work_time = t050101,
    degree_class_time = t060101,
    lunch_break_time = t110101,
    shopping_time,
    sports_time,
    religious_time
  ) |> 
  right_join(atus_join1, by = c("subject_id")) |> 
  select(
    employment, 
    age, 
    enrollment,  
    weekly_earnings, 
    household_size, 
    time_alone, 
    sleep_time, 
    work_time, 
    degree_class_time,
    shopping_time, 
    lunch_break_time,
    sports_time, 
    religious_time
  )

usethis::use_data(atus_college, overwrite = TRUE)
