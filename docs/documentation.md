---
title: "North Sea and Wadden Sea model validation database at Deltares"

---





# Workflow description

## Data in

Data from different sources are retrieved, harmonized and stored locally in a PostGreSQL/PostGIS database. This is done by scripting, so that it is easy to update. Data are then made available via a Geoserver for easy retrieval by users. For use in validation scripts, the data can be queried and downloaded in a ready-to-use form via scripting in Matlab, Python or R. This document describes this process. 

## Data out


The Geoserver provides a Web Feature Service (WFS). The service is called by a URL. In the URL, specifications and criteria can be included.

Currently, three tables are available in the Geoserver:

1. Locations
2. Locations and parameters 
3. Observations - all observations (1.4 million). It is unwise to download all data in the observations table at once. The first 50 records can be downloaded with https://marineprojects.openearth.nl/geoserver/NWDM/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=NWDM:measurement_view&outputFormat=csv&maxFeatures=50


## Locations

All unique locations in the database. The table can be downloaded using the url: https://marineprojects.openearth.nl/geoserver/NWDM/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=NWDM:location&outputFormat=csv

Below is a map with all locations currently in the database.


```r
locs <- readr::read_csv("https://marineprojects.openearth.nl/geoserver/NWDM/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=NWDM:location&outputFormat=csv") %>% sf::st_as_sf(coords = c("x","y"), crs = 25831) %>%
  sf::st_transform(4326)

leaflet::leaflet(locs) %>%
  addTiles() %>%
  addCircleMarkers(label = ~location_code)
```

<!--html_preserve--><div id="htmlwidget-aeea685e6a06c9cc227b" style="width:100%;height:480px;" class="leaflet html-widget"></div>
<script type="application/json" data-for="htmlwidget-aeea685e6a06c9cc227b">{"x":{"options":{"crs":{"crsClass":"L.CRS.EPSG3857","code":null,"proj4def":null,"projectedBounds":null,"options":{}}},"calls":[{"method":"addTiles","args":["//{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",null,null,{"minZoom":0,"maxZoom":18,"tileSize":256,"subdomains":"abc","errorTileUrl":"","tms":false,"noWrap":false,"zoomOffset":0,"zoomReverse":false,"opacity":1,"zIndex":1,"detectRetina":false,"attribution":"&copy; <a href=\"http://openstreetmap.org\">OpenStreetMap<\/a> contributors, <a href=\"http://creativecommons.org/licenses/by-sa/2.0/\">CC-BY-SA<\/a>"}]},{"method":"addCircleMarkers","args":[[52.9293708776217,53.2245580292593,53.2305748936729,53.0695707136215,53.3349325458569,53.3492794474301,53.3736356888385,53.4045814387132,53.3303597462969,53.378953137106,53.1726073136615,53.0848693004251,53.4391625134117,53.4208220034079,53.4033574748109,53.4979722386284,52.951149249913,53.1162875673178,53.4633491043177,53.4025016364113,53.401137078859,53.3348248705734,53.3210102995442,53.3263550676854,52.9643590142882,52.9428100718519,53.4664409676854,53.0609099725244,53.0843887630788,53.0529029784346,53.0790464711485,53.4432630767439,53.4743916666972,53.4747078724357,53.3308254806716,53.3227316109586,53.3193361546077,53.442926755194,51.8460793482005,51.8689128960609,53.4507665588961,53.3042912212269,53.2777836580613,51.6602002781279,53.176983614711,53.1758114500965,53.1756325500171,53.1756340997776,53.1668180449173,53.1944918963835,53.1742868404856,53.4499595491898,53.4019694500228,53.4460782483062,53.0164541238113,53.4163619184447,53.559132611715,53.1619880487047,53.2645660607268,53.2627792736243,53.1036056158589,53.0790271693142,53.1644065960683,53.2060735393432,53.4150043471846,53.4105530156972,53.5309579876538,53.506522731846,51.5152744404781,52.9683683114131,52.9931325263732,52.9825381399915,53.4271938510947,53.3119166010179,53.3168461432249,53.4620793825436,53.254250609997,53.3580394045066,53.3364635068516,52.3014311968858,52.2605977563557,52.3408754320544,52.5853201950874,53.4242666370092,53.3751853569934,53.4341335179581,53.3166067207693,53.293331162508,53.3113142941468,53.3229941018957,53.3782389759271,53.5283841159641,53.4961620667271,53.3489441933571,53.4571005100926,53.4791342236958,53.5276076299403,53.4939367927187,53.4354629802855,53.2101305651791,53.5653859161004,53.9531736753388,54.1173447286575,53.5038857752686,53.4689374910291,52.9573563122076,51.7191817718849,53.3545977315492,53.5111335134073,53.3389918081169,53.3028783175294,53.4603661285559,54.1487133491412,54.4148297873347,54.7184469314101,55.1715113904969,53.4145318674325,53.40525186003,53.0195772552419,53.0258915214938,53.304981833524,53.2949593314339,53.297378293754,53.2960338580087,53.3133483581072,53.2621540968841,51.4119907329793,51.5480644724755,51.6577878697139,51.9561241094313,53.3202240259403,53.1059100699206,53.2883002262972,53.2886819075623,53.3630451667261,52.9775913156274,53.4076843654946,51.601575500181,53.2468471695926,53.318607469629,51.6447193808846,53.4294086660143,53.4751023159053,53.483165905071,53.4949896437082,53.4491464234201,53.120289148712,53.1068400821171,53.3218735905462],[4.9113234768228,5.27790674818044,5.20181949468584,4.72508415536482,6.94394011953761,6.91134306228514,6.90401616929804,6.89428094586592,6.95833648396886,5.16718451120009,5.39990392109177,5.33720991384324,5.6016350016176,5.55175742962807,5.50372901410243,6.52322658488722,4.96762560561375,5.04369395026962,5.80928858438454,5.72097797556428,5.72698108774243,6.93138495259786,6.96407412534212,6.93312280564187,4.74499019151815,5.02839992513494,6.84773663595894,5.20699545518091,5.28721390631665,5.03226398453544,4.73240116177641,6.88382342029064,6.82173055560236,6.33525078052625,7.10871777739246,7.01494408021515,7.01549119689682,6.12611300329205,3.91546752088625,3.87227693462101,6.40622148618553,7.15665958994787,7.16363936040893,3.85269495642574,5.39692892741914,5.41966154688158,5.41652069712047,5.40934192101131,5.41466055637681,5.32885444586546,5.40590150339498,5.61297744019492,5.87658221642866,5.9598610192723,4.70771280829184,5.34207480237005,6.66119880434168,5.18536763924581,5.46738591825767,5.45014873335814,4.75412905274358,5.33423211882294,4.81903066273462,5.2218296581904,6.20609484213571,6.19999476612981,6.4171024358133,6.45276385419678,4.12705291649591,4.79033024054182,4.90094619112228,4.74993359942857,5.7268863670684,7.08153686031402,7.08248105252046,5.77818613022255,7.1754243412665,5.38044946752199,5.33391685581467,4.30116315218516,4.40477798604035,4.17365889372161,3.53002485672872,6.24201025437356,6.95832025903979,6.91668623814282,7.01463770060673,5.44689417613392,5.41076232193483,5.35869483339684,5.45106931284982,6.66290791066752,6.69722581600788,6.94452181231996,6.45304200949614,6.66371719041275,6.7238242766177,6.81029304069966,6.89319765209262,5.43690030223162,6.56284741825207,6.30866195852366,6.21282085791657,6.19008447018198,6.20290774862513,4.94450031240929,3.49393911503521,5.21900740348582,6.43931201755192,5.05531158833658,7.03153753195865,5.09948023495789,4.34054979036026,4.0396998438116,3.69023603339202,3.15603962605152,5.14920515754542,5.25179761329025,4.82464856436493,4.70801252919872,5.05183805863975,5.0914636662493,5.08859745696293,5.08995654309109,5.1599040762715,5.17201219700067,3.56561888419438,3.40949772780585,3.21921228702063,2.67780186600426,6.99493291923213,5.08699107454339,5.22901231675767,5.18402594960214,5.22002589253731,4.94876108711943,6.06385547021112,3.72056596770991,5.15501064034745,7.006233696453,4.09698258102475,6.1326505085723,6.07922635547332,6.4521834111677,6.43590211700332,6.51348985578316,5.24456165339492,5.27223017346275,5.61980899451898],10,null,null,{"interactive":true,"className":"","stroke":true,"color":"#03F","weight":5,"opacity":0.5,"fill":true,"fillColor":"#03F","fillOpacity":0.2},null,null,null,null,["AMSDP","BLAUWSOT","BLAUWSWT","BLEEKBSD","BOCHTVWTM","BOCHTVWTMDOT","BOCHTVWTMDWT","BOCHTVWTND","BOCHTVWTZD","BOOMKDP","BOONTNMPL","BOONTS","BORNDP","BOSCHGT","BOSCHGWT","BOSCHNOT","BREEHN","BREESBI1","BURBSD","DANTZGND","DANTZGT","DELFZBSD","DELFZBTHVN","DELFZL","DENHDR","DENOVSSZ","DOEKGT","DOOVBMDN","DOOVBOT","DOOVBWT","ECMRTXLBSD","EEMSCTLE","EEMSHVSMPL","EILDBG","EMDVWTR","GAATJBNWT","GAATJBWT","GATVSMNOG","GOERE2","GOERE6","GRONGWD","GROOTGND","GROOTGZD","HAMMOT","HARLGHVMWT","HARLGJHVLZDE","HARLGJHVN","HARLGN","HARLGSBSD","HARLGVGL","HARLGVHVN","HOLLBSD","HOLWD","HOLWDBG","HOORNDSBSD","HOORNTSLG","HUIBGOT","INST","KIMSGOT","KIMSGWT","KOOGBSD","KORNWDZTGGL","KRIMBSD","LANGZD","LAUWOBTHVN","LAUWOHVMD","LAUWS","LAUWZD","LODSGT","MALZMRNHVN","MALZN","MARSDND","MOLGT","MONDVDDLD","MONDVDDLND","NESBSD","NIEUWSTZBTN","NOORDBGN","NOORDMOT","NOORDWK10","NOORDWK2","NOORDWK20","NOORDWK70","OORT","OOSTFSGJE","OOSTFSGJND","OOSTHD","OOSTMOT","OOSTMP","OOSTMWT","OOSTROT","OUDWTEND","OUDWTES","PAAP","PIETBRWD1","RA","RANSGT","RANSGZD","ROBBPT","ROPTZL","ROTTMPT3","ROTTMPT50","ROTTMPT70","SCHIERMNOBSD","SCHIERMNOG","SCHORE","SCHOUWN10","SCHUITGT","SPRUIT","STORTMK","TERMTZBSD","TERSLG10","TERSLG100","TERSLG135","TERSLG175","TERSLG235","TERSLG4","TERSLPL8","TEXSM","VLAKBSD","VLIELBSD","VLIELJHVHVMD","VLIELJHVLZDE","VLIELJHVN","VLIESM","VLIESZD","VLISSGBISSVH","WALCRN2","WALCRN20","WALCRN70","WESTHD","WESTKSRK","WESTMP","WESTMWT","WESTTSLG","WIERBND","WIERMWD1","WISSKKE","WOLFSHK","ZEEHVKNMDG","ZIJPE","ZOUTKPLG","ZOUTKPLZGT","ZUIDOLWNOT","ZUIDOLWNWT","ZUIDOLWOT","ZUIDORK","ZUIDORZD","ZWARTHN"],{"interactive":false,"permanent":false,"direction":"auto","opacity":1,"offset":[0,0],"textsize":"10px","textOnly":false,"className":"","sticky":true},null]}],"limits":{"lat":[51.4119907329793,55.1715113904969],"lng":[2.67780186600426,7.1754243412665]}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->


## Minimal metadata: Combination of locations and parameters

All unique combinations of location and parameters. The table can be downloaded completeley using the url:  https://marineprojects.openearth.nl/geoserver/NWDM/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=NWDM:p35location&outputFormat=csv

The following parameters are currently loaded in the database:


```r
parameters <- readr::read_csv("https://marineprojects.openearth.nl/geoserver/NWDM/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=NWDM:p35location&outputFormat=csv") %>% distinct(p35code, p35preflabel)
knitr::kable(parameters)
```



p35code     p35preflabel                                
----------  --------------------------------------------
EPC00168    Water body pH                               
WATERTEMP   ITS-90 water temperature                    
EPC00001    Water body salinity                         
EPC00211    Silicate in the sediment                    
EPC00006    Water body nitrite                          
EPC00186    Water body dissolved phosphorus             
EPC00004    Water body nitrate                          
EPC00212    Water body particulate nitrogen             
EPC00157    Water body particulate organic carbon {POC} 
EPC00002    Water body dissolved oxygen concentration   
EPC00160    Water body dissolved nitrogen               
EPC00190    Water body dissolved organic carbon {DOC}   


## Observations

All observations. This table should not be downloaded completely. It is big and will grow bigger over time, and it is unlikely that you will need the complete table. The table can be easily subsetted by a so-called CQL-query in the wfs request (url). This is described in the next part.


# Building a query

## Structure of a wfs request

The wfs request for the location table looks like this:


```r
structure <- httr::parse_url("https://marineprojects.openearth.nl/geoserver/NWDM/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=NWDM:location&outputFormat=csv")

knitr::kable(paste0(paste(names(structure),paste0(structure),sep="=")))
```



|x                                                                                                                        |
|:------------------------------------------------------------------------------------------------------------------------|
|scheme=https                                                                                                             |
|hostname=marineprojects.openearth.nl                                                                                     |
|port=NULL                                                                                                                |
|path=geoserver/NWDM/ows                                                                                                  |
|query=list(service = "WFS", version = "1.0.0", request = "GetFeature", typeName = "NWDM:location", outputFormat = "csv") |
|params=NULL                                                                                                              |
|fragment=NULL                                                                                                            |
|username=NULL                                                                                                            |
|password=NULL                                                                                                            |

The interesting part of the wfs request is the query. In the above example, the query contains information on the service and version (WFS 1.0.0), request (GetFeature), and the table or "typeName" (refers to database schema "NWDM", and table "location")


```r
knitr::kable(paste0(paste(names(structure$query),paste0(structure$query),sep="=")))
```



|x                      |
|:----------------------|
|service=WFS            |
|version=1.0.0          |
|request=GetFeature     |
|typeName=NWDM:location |
|outputFormat=csv       |

In the query part, we can add an element called [CQL-query](https://docs.geoserver.org/stable/en/user/tutorials/cql/cql_tutorial.html). 

## Select parameters and locations 

Below is an example where only data are requested that contain data on "water body nitrate" at locations "DOOVBWT" (this is a station in the Wadden Sea)



```r
url = "https://marineprojects.openearth.nl/geoserver/NWDM/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=NWDM%3Ameasurement_view&cql_filter=%28p35preflabel%3D%27Water%20body%20nitrate%27%20and%20location_code%3D%27DOOVBWT%27%29&outputFormat=csv"
structure <- httr::parse_url(url)

knitr::kable(paste0(paste(names(structure),paste0(structure),sep="=")))
```



|x                                                                                                                                                                                                                |
|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|scheme=https                                                                                                                                                                                                     |
|hostname=marineprojects.openearth.nl                                                                                                                                                                             |
|port=NULL                                                                                                                                                                                                        |
|path=geoserver/NWDM/ows                                                                                                                                                                                          |
|query=list(service = "WFS", version = "1.0.0", request = "GetFeature", typeName = "NWDM:measurement_view", cql_filter = "(p35preflabel='Water body nitrate' and location_code='DOOVBWT')", outputFormat = "csv") |
|params=NULL                                                                                                                                                                                                      |
|fragment=NULL                                                                                                                                                                                                    |
|username=NULL                                                                                                                                                                                                    |
|password=NULL                                                                                                                                                                                                    |

# More on WFS

Full documentation is found here: https://docs.geoserver.org/latest/en/user/services/wfs/reference.html

The capabilities of the used geoserver schema can be requested by:
https://marineprojects.openearth.nl/geoserver/NWDM/ows?service=WFS&version=1.0.0&request=GetCapabilities

A description of the featuretypes (layers) can be requested by:
https://marineprojects.openearth.nl/geoserver/NWDM/wfs?request=DescribeFeatureType


