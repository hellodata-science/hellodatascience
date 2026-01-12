# Data retrieved from https://www.rug.nl/ggdc/productivity/pwt/ on 2025-08-18

library(tidyverse)

penn_world <- 
  haven::read_stata(here::here("data-raw/penn-world/pwt1001.dta")) |> 
  select(
    countrycode, 
    country, 
    currency_unit, 
    year,
    rgdpe, 
    rgdpo, 
    pop, 
    emp, 
    avh,
    pl_c,
    pl_i,
    pl_g,
    pl_x,
    pl_m
    ) |> 
  rename(
    `Country Code` = countrycode,
    Country = country,
    `Currency Unit` = currency_unit,
    Year = year,
    `Real GDP Expenditure`  = rgdpe,
    `Real GDP Output` = rgdpo,
    Population = pop,
    Emp = emp,
    `Average Hours` = avh,
    `PL Consumption`= pl_c,
    `PL Capital Formation` = pl_i,
    `PL Gov` = pl_g,
    `PL Exports` = pl_x,
    `PL Imports` = pl_m
    ) |> 
  filter(Year >= 1990 & Year <= 2019) |> 
  mutate(Year = as.double(Year))

usethis::use_data(penn_world, overwrite = TRUE)
