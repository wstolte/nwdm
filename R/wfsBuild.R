
#' Create url to be used as wfs query
#' 
#' This function is used internally at Deltares to query the North Sea and Wadden sea 
#' validation database. The url can then be used to download validation data. 
#' @param cql_list list with cql conditions
#' @param outputformat desired format for download
#' @param maxFeatures maximum number of features to download
#' @columns character vector of columns to download
#' @example 
#' cql_list = list(p35preflabel = "Water body nitrate",
#' location_code = "DOOVBWT"
#' )
#' columns = c("location_code", "date", "depth", "parameter_label", "value", "unit_preflabel", "quality_code")
#' 
#' url = create_url(cql_list = cql_list)
#' read_csv(url)
#' 
create_url <- function(cql_list, outputFormat = "csv", maxFeatures = NULL, columns = NULL) {
  
  require(httr)
  
  if(is.null(columns)) propertyName = NULL else propertyName = paste("NWDM", columns, sep = ":", collapse = ",")
  
  if(is.null(cql_list)) cql_filter = NULL else cql_filter = paste0("(",paste(names(cql_list),paste0("'", cql_list, "'"),sep="=",collapse=" and " ),")")
  
  request <- structure(
    list(scheme = "https", 
         hostname = "marineprojects.openearth.nl", 
         port = NULL, 
         path = "geoserver/NWDM/ows", 
         query = list(
           service = "WFS", 
           version = "1.0.0", 
           request = "GetFeature", 
           typeName = "NWDM:measurement_view",
           cql_filter = cql_filter,
           outputFormat = outputFormat, 
           maxFeatures = maxFeatures,
           propertyName = propertyName
         ), 
         params = NULL, 
         fragment = NULL, 
         username = NULL, 
         password = NULL
    ), 
    class = "url")
  
  url <- httr::build_url(request)
}

