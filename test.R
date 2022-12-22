
source("r/wfsBuild.R")
require(tidyverse)
require(sf)
require(leaflet) 
source("R/credential.R")
# Get all locations

typeName = "NWDM:location"
url = create_url(cql_list = NULL, typeName = typeName, 
                 maxFeatures = NULL, outputFormat = "application/json",
                 username = nwdm$username, password = nwdm$password)
locations <- st_read(url)
# Visualize
locations  %>% sample_n(1000) %>%
  st_difference() %>%
  st_transform(4326) %>%
  leaflet() %>%
  leaflet::addTiles() %>% 
  addCircleMarkers(label = ~ location_name)

rm(url)
typeName <- "NWDM:measurement_p35_all"
url = create_url(cql_list = NULL, typeName = typeName, 
                 maxFeatures = 1000, outputFormat = "application/json",
                 username = nwdm$username, password = nwdm$password)
p35measurements <- st_read(url)
p35measurements %>% 
  st_drop_geometry() %>% 
  group_by(p35code, p35preflabel) %>% 
  summarize(n = n()) %>% View()

# p35locations %>% st_drop_geometry() %>% group_by(p35code, p35preflabel, data_holder) %>% summarize(aantalStations = n()) %>% 
#   write_csv2(file.path("data", paste(lubridate::today(), "p35locations.csv", sep = "_")))

typeName <- "NWDM:measurement_p35_all"
url = create_url(cql_list = NULL, typeName = typeName, 
                 maxFeatures = 1000, outputFormat = "application/json",
                 username = nwdm$username, password = nwdm$password)
p35measurements <- st_read(url)


p35locations  %>% 
  filter(grepl("nitra", x = p35preflabel)) %>%
  st_difference() %>%
  st_transform(4326) %>%
  leaflet() %>%
  leaflet::addTiles() %>% 
  addCircleMarkers(label = ~ location_name)


typeName <- "NWDM:measurement_p35_all"

l = list(
  p35preflabel = "Water body nitrate",
  p35preflabel = "Water body phosphate"#,
  # location_code = "DOOVBWT"
)
# still need to figure out how to select multiple substances.. 
# https://stackoverflow.com/questions/24059773/correct-way-to-pass-multiple-values-for-same-parameter-name-in-get-request

l = list(
  p35preflabel = "Water body nitrate",
  location_code = "DOOVBWT"
)

columns = c("location_code", 
            "date", 
            "depth", 
            "vertical_reference_code", 
            "parameter_label", 
            "value", 
            "unit_preflabel", 
            "quality_code",
            "geom"
            )

url = create_url(
  cql_list = l, 
  typeName = typeName, 
  maxFeatures = NULL, 
  outputFormat = "application/json",
  username = nwdm$username, password = nwdm$password
  )

myData <- st_read(url)


st_crs(myData)

require(leaflet)

myData  %>% 
  st_difference() %>%
  st_transform(4326) %>%
leaflet() %>%
  leaflet::addTiles() %>% 
  addCircleMarkers(label = ~ location_name)



## bounding box

myData %>% sf::summarize()

# for a list with possible spatial functions, see
# http://udig.refractions.net/confluence/display/EN/Constraint%20Query%20Language.html

url = create_url(
  cql_list = l, 
  typeName = typeName, 
  bbox = "142600,153800,146000,156900",
  maxFeatures = NULL, 
  outputFormat = "application/json",
  username = nwdm$username, password = nwdm$password
)

myData <- st_read(url)

bbox = "142600,153800,146000,156900"

