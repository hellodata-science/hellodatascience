# Fruit and Vegetable Prices

How much do fruits and vegetables cost? United States Department of
Agriculture (USDA) Economic Research Service (ERS), estimated average
prices for 153 commonly consumed fresh and processed fruits and
vegetables. USDA ERS calculated average prices at retail stores using
2022 retail scanner data from Circana (formerly Information Resources
Inc. (IRI)). A selection of retail establishments—grocery stores,
supermarkets, supercenters, convenience stores, drug stores, and liquor
stores—across the United States provides Circana with weekly retail
sales data (revenue and quantity).

## Usage

``` r
produce_prices
```

## Format

A data frame with 155 rows and 10 variables:

- id:

  ID of item

- produce:

  name of produce

- form:

  form of produce, either \`Canned\`, \`Dried\`, \`Fresh\`, \`Frozen\`,
  or \`Juice\`

- retail_price:

  average retail price per pound or per pint

- retail_price_unit:

  unit for the \`retail_price\`, either \`per pint\` or \`per pound\`

- cup_equivalent_size:

  For most fruits and vegetables, a cup equivalent is the edible portion
  that will fit into a 1-cup measuring cup; for raisins and other dried
  fruit, it is the edible portion that will fit into a 1/2-cup; and for
  leafy vegetables, 2 cups. An edible cup equivalent is the unit of
  measurement used by the U.S. Department of Agriculture and the
  Department of Health and Human Services to report fruit and vegetable
  consumption recommendations.

- cup_equivalent_unit:

  unit for \`cup_equivalent_size\`

- cup_equivalent_price:

  average retail price per \`cup_equivalent_unit\` of produce

- type:

  type of produce, either \`fruit\` or \`vegetables\`

- year:

  year

## Source

U.S. Department of Agriculture, Economic Research Service. (2024). Fruit
and vegetable prices.
<https://www.ers.usda.gov/data-products/fruit-and-vegetable-prices>
