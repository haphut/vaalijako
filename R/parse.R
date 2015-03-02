parse_voting_area_csv <- function(filename) {
  df <- read.csv(filename, sep = ';', header = FALSE,
                 col.names = c('building_id', 'northing', 'easting',
                               'municipality', 'voting_area', 'NULL'),
                 colClasses = c('factor', 'integer', 'integer', 'factor',
                                'factor', 'NULL'))
}

