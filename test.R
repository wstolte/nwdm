
source("r/wfsBuild.R")
require(tidyverse)
require(sf)

# Get all locations

typeName = "NWDM:location"
url = create_url(cql_list = NULL, typeName = typeName, maxFeatures = NULL, outputFormat = "application/json")
locations <- st_read(url)
# Visualize
locations  %>% st_difference() %>%
  st_transform(4326) %>%
  leaflet() %>%
  leaflet::addTiles() %>% 
  addCircleMarkers(label = ~ location_name)


typeName = "NWDM:p35location"
url = create_url(cql_list = NULL, typeName = typeName, maxFeatures = NULL, outputFormat = "application/json")
p35locations <- st_read(url)
# p35locations %>% st_drop_geometry() %>% group_by(p35code, p35preflabel) %>% summarize(n = n()) %>% View()
# p35locations %>% st_drop_geometry() %>% group_by(p35code, p35preflabel, data_holder) %>% summarize(aantalStations = n()) %>% 
#   write_csv2(file.path("data", paste(lubridate::today(), "p35locations.csv", sep = "_")))

p35locations  %>% 
  filter(grepl("silic", x = p35preflabel)) %>%
  st_difference() %>%
  st_transform(4326) %>%
  leaflet() %>%
  leaflet::addTiles() %>% 
  addCircleMarkers(label = ~ location_name)


typeName = "NWDM:measurement_view"
l = list(
  p35preflabel = "Water body nitrate",
  p35preflabel = "Water body phosphate"#,
  # location_code = "DOOVBWT"
)
# still need to figure out how to select multiple substances.. 
# https://stackoverflow.com/questions/24059773/correct-way-to-pass-multiple-values-for-same-parameter-name-in-get-request

l = list(
  p35preflabel = "Water body nitrate"#,
  # location_code = "DOOVBWT"
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

url = create_url(cql_list = l, typeName = typeName, maxFeatures = NULL, outputFormat = "application/json")
myData <- st_read(url)

st_crs(myData)

require(leaflet)

myData  %>% st_difference() %>%
  st_transform(4326) %>%
leaflet() %>%
  leaflet::addTiles() %>% 
  addCircleMarkers(label = ~ location_name)




