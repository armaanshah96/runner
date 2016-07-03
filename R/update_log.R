library(RSQLite)

# STUFF TO ADD: test cases

#' @param filename The name under which you want the file saved. Should include .rds extension.
#' @param units "english" or "metric"
#' @param date User's date. Should be in "mm/dd/yyyy" format, of the class character.
#' @param name User's name. Should be in
#' @param age User's age. Should be in numeric format.
#' @param gender User's gender. Should be either "male" or "female"
#' @param height User's height. Should be in numeric format. If units = "english", should be in inches. If units = "metric", should be in centimeters.
#' @param weight User's weight. Should be in numeric format.
#' @param time The number of minutes the user ran the distance in. Should be in numeric format.
#' @param distance The distance the user ran. Should be in numeric format.
#' @param heartrate Optional parameter - user's heartrate during workout. Should be in numeric format.
#'
#' @description Creates a new log for the user's running data. Using user info and measurements,
#'              creates a data frame with the info entered along with calories burned, bmi, and body_fat.
#'              Saves the data as a .RData file under the user's chosen file name.
#' @examples
#' create_log("filename.rds", "english", "09/30/2016", "Anna", 18, "female", 57, 128, 10, 1)
#' create_log("filename.rds", "metric", "09/30/2016", "Jon", 19, "male", 57, 128, 10, 1, 72)
#'
# CREATE LOG

create_log <- function(filename, units = "english", date, name, age, gender, height, weight,
                       time, distance, heartrate = NA) {

  log <- data.frame(c("Date", "Name", "Age", "Gender", "Height", "Weight",
                     "Time", "Distance", "Heart Rate", "Calories Burned"))

  if ((tolower(units) != "english" || tolower(units) != "metric") || class(date) != "character" ||
      class(name) != "character" || class(age) != "numeric" || class(gender) != "character" ||
      class(height) != "numeric" || class(weight) != "numeric" || class(time) != "numeric" ||
      class(distance) != "numeric" || (class(heartrate) != "numeric" || !is.na(heartrate))) {
    stop("Incorrect class for one or more parameters")
  }
  else{
    library(lubridate)
    mdy(date)

    tolower(name)
    tolower(gender)

    if (gender != "male" | gender != "female"){
      stop("gender input must be 'male' or 'female'")
    }
    else{
      newrow <- c(date, name, age, gender, height, weight, time, distance, heartrate)
      if(!is.na(heartrate)){
        calories_burned(age, heartrate, weight, time, gender, units)
      }
      else {
        NA
      }
    }
  }

  log <- rbind(log, newrow)

  if(class(filename) != "character"){
    stop("File name must be character!")
  }
  else {
  saveRDS(log, filename)
    }

  }

#' @param filename The name under which you want the file saved. Should include .RData extension.
#' @param name User's name. Should be in
#' @param age User's age. Should be in numeric format.
#' @param gender User's gender. Should be in character format, and should either be an M or an F.
#' @param height User's height. Should be in numeric format.
#' @param weight User's weight. Should be in numeric format.
#' @param wrist User's wrist measurement from around the wrist. Should be in numeric format.
#' @param waist User's waist measurement from around the waist. Should be in numeric format.
#' @param hip User's hip measurement from around the hip. Should be in numeric format.
#' @param forearm User's forearm measurement from around the forearm. Should be in numeric format.
#' @param time The amount of time the user ran the distance in. Should be in character format.
#' @param distance The distance the user ran. Should be in numeric format.
#' @param heartrate Optional parameter - user's heartrate during workout. Should be in numeric format.
#' @param units English or Metric.
#'
#' @description Updates the log with the user's newest workout information. Loads in the stored data frame
#'              using the inputted filename and adds in a new row with the user's newest workout information.
# UPDATE LOG
update_log <- function(filename, units = "english", date, name, age, gender, height, weight,
                       time, distance, heartrate = NA){

  if(class(filename != "character")) {
    stop("File name must be a character!")
  }
  else{
  log <- readRDS(filename)
  }

  if (class(date) != "character" || class(name) != "character" || class(age) != "numeric" ||
      class(gender) != "character" || class(height) != "numeric" || class(weight) != "numeric" ||
      class(time) != "numeric" || class(distance) != "numeric" ||
      (class(heartrate) != "numeric" || !is.na(heartrate)) || (units != "english" || units != "metric")) {
    stop("Incorrect class")
  }
  else {
    library(lubridate)
    mdy(date)

    tolower(name)
    tolower(gender)

    if (gender != "male" | gender != "female"){
      stop("gender input must be 'male' or 'female'")
    }
    else {
      newrow <- c(date, name, age, gender, height, weight, time, distance, heartrate)
      if(!is.na(heartrate)){
        calories_burned(age, heartrate, weight, time, gender, units)
      }
      else {
        NA
      }
    }
  }


  if (class(name) != "character" | class(age) != "numeric" | class(gender) != "character" |
      class(height) != "numeric" | class(weight) != "numeric" | class(time) != "character" |
      class(distance) != "numeric" | class(heartrate) != "numeric" | !is.na(heartrate)) {
        stop("Incorrect class")
    }
  else{
  newrow <- c(name, age, gender, height, weight, time, distance, heartrate)
              if(!is.na(heartrate)){
                calories_burned(age, heartrate, weight, time, gender, units)
              }
              else {
                NA
              }
  }

  log <- rbind(log, newrow)
}

#' @param framename Name of the dataframe in R.
#' @description erases the log and makes a new fresh one
# ERASE LOG

erase_log <- function(framename) {
  if (class(framename) != "character"){
    stop("Framename must be a character!")
  }
  else {
  framename <- framename[0,]
  }
}
