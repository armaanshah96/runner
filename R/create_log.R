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
#' @import RSQLite
#' @import lubridate
#'
#' @description Creates a new log for the user's running data. Using user info and measurements,
#'              creates a data frame with the info entered along with calories burned, bmi, and body_fat.
#'              Saves the data as a .RData file under the user's chosen file name.
#' @examples
#' create_log("english", "09/30/2016", "Anna", 18, "female", 57, 128, 10, 1)
#' create_log("metric", "09/30/2016", "Jon", 19, "male", 57, 128, 10, 1, 72)

create_log <- function(units = "english", date, name, age, gender, height, weight,
                       time, distance, heartrate = NA) {


  if ((tolower(units) != "english" && tolower(units) != "metric") || class(date) != "character" ||
      class(name) != "character" || class(age) != "numeric" || class(gender) != "character" ||
      class(height) != "numeric" || class(weight) != "numeric" || class(time) != "numeric" ||
      class(distance) != "numeric" || (class(heartrate) != "numeric" && !is.na(heartrate))) {
    stop("Incorrect class for one or more parameters")
  }
  else{
    date <- mdy(date)

    tolower(name)
    tolower(gender)

    if(!is.na(heartrate)){
      c <- calories_burned(age, heartrate, weight, time, gender, units)
    }
    else {
      c <- NA
    }

    if (gender != "male" && gender != "female"){
      stop("gender input must be 'male' or 'female'")
    }
    else{
      log <- data.frame(Date = date,
                        Age = age,
                        Gender = gender,
                        Height = height,
                        Weight = weight,
                        Time = time,
                        Distance = distance,
                        Heart.Rate = heartrate,
                        Calories.Burned = c,
                        stringsAsFactors = FALSE)

      if (class(name) != "character"){
        stop("Name must be a character!")
      }
      else {
        saveRDS(log, paste(name, ".rds", sep = ""))
      }
    }
  }
  View(log)
  }
