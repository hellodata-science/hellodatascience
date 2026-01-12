#' Planets Data
#' 
#' The data was scraped from NASA's website \url{https://nssdc.gsfc.nasa.gov/planetary/factsheet/index.html} and contains information on the planets of our Solar System
#' 
#' @format A data frame with 8 rows and 7 variables. Each row represents a planet.
#' \describe{
#'   \item{name}{name of the planet}
#'   \item{mass}{mass in 10^24 kg}
#'   \item{length_of_day}{length of day in hours}
#'   \item{mean_temp}{whether mean temperature in C is positive or not \{negative\}\{positive\}}
#'   \item{n_moons}{number of moons}
#'   \item{ring_system}{whether the planet has set of rings around it \{TRUE\} \{FALSE\}}
#'   \item{surface_pressure}{surface pressure in bars}
#' }
#' @source David R. Williams (2024). \url{https://nssdc.gsfc.nasa.gov/planetary/factsheet/index.html}.

"planets"