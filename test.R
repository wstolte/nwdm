
source("r/wfsBuild.R")
require(tidyverse)

# getCapabilities
# See all capabilities of the Geoserver schema. 
# a.o. the filtering possibilities are shown.
url.show("https://nwdm.avi.directory.intra/geoserver/NWDM/wfs?request=GetCapabilities")
# getFeatureTypes
# See layers and columns in each layer
url.show("https://nwdm.avi.directory.intra/geoserver/NWDM/wfs?request=DescribeFeatureType")

typeName = "NWDM:location"
url = create_url(cql_list = NULL, typeName = typeName, maxFeatures = NULL, outputFormat = "application/json")
locations <- st_read(url)



typeName = "NWDM:p35location"
url = create_url(cql_list = NULL, typeName = typeName, maxFeatures = NULL)
p35locations <- read_csv(url)
p35locations %>% group_by(p35code, p35preflabel) %>% summarize(n = n()) %>% View()


typeName = "NWDM:measurement_view"
cql_list = list(p35preflabel = "Water body nitrate",
                location_code = "DOOVBWT"
)
# cql_list = NULL
columns = c("location_code", 
            "date", 
            "depth", 
            "vertical_reference_code", 
            "parameter_label", 
            "value", 
            "unit_preflabel", 
            "quality_code")
url = create_url(cql_list = cql_list, typeName = typeName, maxFeatures = NULL)
myData <- read_csv(url)

require(sf)
url = create_url(cql_list, typeName = typeName, outputFormat = "application/json", columns = columns)
mySpatialData <- st_read(url, crs = 25831)
plot(mySpatialData) # something is wrong. geometry is not coming through



