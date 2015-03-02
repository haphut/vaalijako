#' @import httr
download_voting_area_csv <- function(filename,
                                     url = 'https://www.avoindata.fi/data/fi/dataset/df2d00d2-4a00-46ba-b16c-8f73c5e6bb32/resource/b9e48d8e-f8c3-4dde-b221-45e495021c9c/download/rvaalit2015eduskuntavaalitdataavoindatarvaalit2015eduskuntavaalitdataavoindata1003796rakaanestysalu') {
  GET(url, write_disk(filename, overwrite = TRUE))
}
