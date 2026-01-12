# Data retrieved from https://nssdc.gsfc.nasa.gov/planetary/factsheet/index.html

library(tidyverse)

planets <- read_csv(here::here("data-raw/planets/planets.csv")) |> 
  janitor::clean_names() |> 
  rename(
    name = x1,
    mass = mass_1024kg,
    length_of_day = length_of_day_hours,
    orbital_period = orbital_period_days,
    mean_temp = mean_temperature_c, 
    n_moons = number_of_moons,
    surface_pressure = surface_pressure_bars
    ) |> 
  select(
    name, 
    mass, 
    length_of_day, 
    mean_temp, 
    n_moons, 
    ring_system, 
    surface_pressure) |> 
  mutate(
    name = str_to_title(name),
    name = str_trim(name),
    surface_pressure = na_if(surface_pressure, "Unknown*"),
    ring_system = as.factor(ring_system),
    surface_pressure = as.numeric(surface_pressure),
    n_moons = as.integer(n_moons),
    mean_temp = if_else (mean_temp < 0, "negative", "positive"),
    mean_temp = as.factor(mean_temp),
    ring_system = if_else(ring_system == "Yes", 1, 0),
    ring_system = as.logical(ring_system)) |>
  filter(
    name != "Pluto",
    name!= "Moon"
    ) 

usethis::use_data(planets, overwrite = TRUE)
