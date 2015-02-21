parse_csv <- function(filename) {
    df <- read.csv(filename, sep = ';', header = FALSE,
                   col.names = c('building_id', 'northing', 'easting',
                                 'municipality', 'voting_area', 'NULL'),
                   colClasses = c('factor', 'integer', 'integer', 'factor',
                                  'factor', 'NULL'))
    # FIXME: There are duplicated building_ids. Are all of the properties identical for those rows?
}

library(httr)
load_and_cache_csv <- function () {
  url <- "https://www.avoindata.fi/data/fi/dataset/df2d00d2-4a00-46ba-b16c-8f73c5e6bb32/resource/b9e48d8e-f8c3-4dde-b221-45e495021c9c/download/rvaalit2015eduskuntavaalitdataavoindatarvaalit2015eduskuntavaalitdataavoindata1003796rakaanestysalu"
  GET(url, write_disk("inst/voting-areas.csv", overwrite = TRUE))
}
