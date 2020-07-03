
source("wfsBuild.R")
require(readr)

# getCapabilities
# See all capabilities of the Geoserver schema. 
# a.o. the filtering possibilities are shown.
url.show("https://marineprojects.openearth.nl/geoserver/NWDM/ows?service=WFS&version=1.0.0&request=GetCapabilities")
# getFeatureTypes
# See layers and columns in each layer
url.show("https://marineprojects.openearth.nl/geoserver/NWDM/wfs?request=DescribeFeatureType")

cql_list = list(p35preflabel = "Water body nitrate",
                location_code = "DOOVBWT"
)

columns = c("location_code", "date", "depth", "vertical_reference_code", "parameter_label", "value", "unit_preflabel", "quality_code")

url = create_url(cql_list = cql_list)
myData <- read_csv(url)

require(sf)
url = create_url(cql_list, outputFormat = "application/json", columns = columns)
mySpatialData <- st_read(url, crs = 25831)
plot(mySpatialData) # something is wrong. geometry is not coming through

