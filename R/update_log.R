#' library(RSQLite)
#'
#' #' Creating Runner Log
#' #'
#' #' @param name Name of runner. Will be used to name the RData file to store logged runs.
#' #' @param time Length of this run in minutes
#' #' @param distance Distance of this run. If units is unspecified or 'english' then distance is in miles, otherwise if units are 'metric then distance is in kilometers
#' #' @param height Height of the runner. If units is unspecified or 'english' then height in inches, otherwise if units are 'metric' then height in meters
#' #' @param weight Weight of the runner. If units is unspecified or 'english' then weight in pounds, otherwise if units are 'metric' then weight in kilograms
#' #' @param heartrate Optional input of heartrate. This input allows the 'runner' package to provide a visualization of the difficulty of a runner's workout over time. Heartrate measured in beats per minute
#' #' @return Loaded RData file
#' #' @examples
#' #' create_log('Paul',10,2,66,140)
#' #' @export
#' create_log <- function(name, time, distance, height, weight, heartrate=-1, units="english") {
#'
#'   # writing to RData file to save logged run
#'   # filename <- cat(name,".RData")
#'   # save(filename)
#' }
#'
#' #' Updating Runner Log
#' #'
#' #' @param name Name of runner. Will be used to name the RData file to store logged runs.
#' #' @param time Length of this run in minutes
#' #' @param distance Distance of this run. If units is unspecified or 'english' then distance is in miles, otherwise if units are 'metric then distance is in kilometers
#' #' @param height Optional height of the runner. If height is unspecified then previous log height is used. If units is unspecified or 'english' then height in inches, otherwise if units are 'metric' then height in meters
#' #' @param weight Optional weight of the runner. If weight is unspecified then previous log weight is used. If units is unspecified or 'english' then weight in pounds, otherwise if units are 'metric' then weight in kilograms
#' #' @param heartrate Optional input of heartrate. This input allows the 'runner' package to provide a visualization of the difficulty of a runner's workout over time. Heartrate measured in beats per minute
#' #' @param units Optional input of units. Either 'metric' or 'english' can be provided. If unspecified then default to 'english'
#' #' @return Loaded RData file
#' #' @examples
#' #' update_log('Paul',10,2,66,140)
#' #' @export
#' update_log <- function(name, time, distance, height=,weight=,heartrate=-1,units="english") {
#'   # filename <- load(cat(name,".RData"))
#' }
