# Planets Data

The data was scraped from NASA's website
<https://nssdc.gsfc.nasa.gov/planetary/factsheet/index.html> and
contains information on the planets of our Solar System

## Usage

``` r
planets
```

## Format

A data frame with 8 rows and 7 variables. Each row represents a planet.

- name:

  name of the planet

- mass:

  mass in 10^24 kg

- length_of_day:

  length of day in hours

- mean_temp:

  whether mean temperature in C is positive or not {negative}{positive}

- n_moons:

  number of moons

- ring_system:

  whether the planet has set of rings around it {TRUE} {FALSE}

- surface_pressure:

  surface pressure in bars

## Source

David R. Williams (2024).
<https://nssdc.gsfc.nasa.gov/planetary/factsheet/index.html>.
