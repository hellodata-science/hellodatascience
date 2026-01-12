# Data retrieved from https://www.ers.usda.gov/data-products/fruit-and-vegetable-prices

library(tidyverse)

fruit_cost <- read_csv(
  here::here("data-raw", "produce-prices", "Fruit-Prices-2022.csv"), 
  show_col_types = FALSE
) |> 
  janitor::clean_names() |> 
  rename(produce = fruit) |> 
  mutate(type = "Fruit")

vegetable_cost <- read_csv(
  here::here("data-raw", "produce-prices", "Vegetable-Prices-2022.csv"), 
  show_col_types = FALSE
) |> 
  janitor::clean_names() |> 
  rename(produce = vegetable) |> 
  mutate(type = "Vegetable")

produce_prices <- bind_rows(fruit_cost, vegetable_cost) |> 
  select(-yield) |> 
  mutate(type = factor(type)) |> 
  mutate(cup_equivalent_unit = factor(cup_equivalent_unit)) |> 
  mutate(form = factor(form)) |> 
  mutate(retail_price_unit = factor(retail_price_unit)) |> 
  mutate(year = 2022) |> 
  arrange(produce, form, cup_equivalent_price)

produce_prices <- bind_cols(
  data.frame(id = 1:nrow(produce_prices)),
  produce_prices
)

usethis::use_data(produce_prices, overwrite = TRUE)
