#' Calculate the Delaunay triangulation.
#'
#' @import geometry
calculate_delaunay <- function(df) {
    delaunayn(df[c('easting', 'northing')], full = TRUE)
}

#' Get a central point for each voting area in each municipality.
#'
#' @import dplyr
get_central_points = function(df, func = median) {
  df %>%
    group_by(municipality, voting_area) %>%
    summarise(northing = func(northing),
              easting = func(easting))
}

#' Transform ETRS-TM35FIN into WGS 84.
#'
#' @import proj4
transform_etrs_tm35fin_to_wgs84 <- function(df) {
  # FIXME: Unfinished.
}

#' Run everything.
#'
#' @import dplyr
#' @export
main <- function() {
  voting_area_filename <- 'voting-areas.csv'

  if (!file.exists(voting_area_filename)) {
    download_voting_area_csv(voting_area_filename)
  }
  df <- parse_voting_area_csv(voting_area_filename)

  clean_df <- df %>%
    log_and_clean('missing_values.csv', find_missing_values) %>%
    log_and_clean('duplicated_rows.csv', find_duplicated_rows) %>%
    log_and_clean('conflicting_coordinates.csv', find_conflicting_coordinates) %>%
    log_and_clean('duplicated_coordinates.csv', find_duplicated_coordinates)

  central_df <- get_central_points(clean_df, median)
  central_delaunay <- calculate_delaunay(central_df)
  # FIXME: visualize
  save(central_delaunay, file = 'central_delaunay.Rdata')

  delaunay <- calculate_delaunay(clean_df)
  save(central_delaunay, file = 'delaunay.Rdata')

  list(central_df = central_df, central_delaunay = central_delaunay,
       delaunay = delaunay)
}
