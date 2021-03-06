#' Find rows that have any values missing.
#'
#' @export
find_missing_values <- function(df) {
  apply(df, 1, function(row) { any(is.na(row)) })
}

#' Find duplicated rows.
#'
#' @export
find_duplicated_rows <- function(df) {
  duplicated(df)
}

#' Find rows with duplicated coordinates but differing municipality or voting
#' area.
#'
#' @import dplyr
#' @export
find_conflicting_coordinates <- function(df) {
  conflicting_df <- df %>%
    mutate(row_idx = seq_along(municipality)) %>%
    group_by(northing, easting) %>%
    distinct(municipality, voting_area) %>%
    filter(length(municipality) > 1L)
  row_vector <- logical(nrow(df))
  row_vector[conflicting_df[['row_idx']]] <- TRUE
  row_vector
}

#' Find rows with duplicated coordinates.
#'
#' @export
find_duplicated_coordinates <- function(df) {
  duplicated(df[, c('easting', 'northing'), drop = FALSE])
}

#' Separate a data frame into two, dirty and clean.
#'
#' Create a list of two data frames, 'dirty_df' with the rows indicated by
#' dirty_row_index, 'clean_df' with the rest of the rows.
separate_rows <- function(df, dirty_row_index) {
  list(dirty_df = df[dirty_row_index, , drop = FALSE],
       clean_df = df[!dirty_row_index, , drop = FALSE])
}

#' Log the dirty rows and return the clean rows.
#'
#' @param df The data frame to process.
#' @param filename The filename to write the log into.
#' @param finder The function that finds the dirty rows and returns a logical
#'   vector.
#' @export
log_and_clean <- function(df, filename, finder, ...) {
  separated_l <- separate_rows(df, finder(df, ...))
  dirty_df <- separated_l[['dirty_df']]
  if (nrow(dirty_df) > 0L) {
    message('Write into ', filename)
    write.csv(dirty_df, file = filename)
  } else {
    message('Nothing to write into ', filename)
  }
  separated_l[['clean_df']]
}
