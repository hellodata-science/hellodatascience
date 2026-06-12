library(tidyverse)


confederations <- read_csv(here::here("data-raw/soccer/confederations.csv"))

country_rank <- read_csv(here::here("data-raw/soccer/country_rank.csv"))

country_capital <- read_csv(here::here("data-raw/soccer/country_capital.csv"))

mx_us_wc_ranks <- read_csv(here::here("data-raw/soccer/mx_us_wc_ranks.csv"))

usethis::use_data(confederations, overwrite = TRUE)

usethis::use_data(country_rank, overwrite = TRUE)

usethis::use_data(country_capital, overwrite = TRUE)

usethis::use_data(mx_us_wc_ranks, overwrite = TRUE)

