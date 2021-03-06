# Census
## https://geocoding.geo.census.gov/geocoder/Geocoding_Services_API.pdf

### NOTE: different endpoint urls for US and Europe are available

library(httr)
library(jsonlite)

addr <- "1600 Pennsylvania Ave, Washington, DC" # address to geocode

url_base <- "https://geocoding.geo.census.gov/geocoder/locations/onelineaddress"

# limit=1 limits the query to one result

resp <- httr::GET(url = url_base, 
      query = list(address = addr, format = 'json', benchmark = 'Public_AR_Current', vintage = 'Current_Current'))

# dataframe is returned
dat <- jsonlite::fromJSON(httr::content(resp, as = 'text', encoding = "UTF-8"))

# Obtain latitude and longitude, take first one if there are multiple
coord_xy <- dat$result$addressMatches$coordinates

lat_lng <- c(coord_xy$y, coord_xy$x)

