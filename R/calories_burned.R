#' Calculates Calories Burned From Running
#' @param age Age of individual of numeric vector.
#' @param heart_rate Heart rate (bpm) of individual of numeric vector.
#' @param weight Weight of individual of numeric vector. In pounds if english units and kilograms if metric units.
#' @param time Time spent running of individual of numeric vector. In minutes.
#' @param gendser "male" for male and "female" for female.
#' @param units  Character vector representing the units convention used for weight. Either "english" or "metric". Default is "english".
#' @return numeric vector representing the BMI of an individual based on their height and weight
#' @examples
#' calories_burned(19, 130, 152, 60, "male", "metric")
#' @export
calories_burned <- function(age, heart_rate, weight, time, gender, units="english") {
  # Check parameter types are correct
  units = tolower(units)

  if(class(age) != "numeric") {
    stop("age must be a numeric!")
  }

  if(class(heart_rate) != "numeric") {
    stop("heart rate must be a numeric!")
  }

  if(class(weight) != "numeric") {
    stop("weight must be a numeric!")
  }

  if(class(gender) != "character") {
    stop("gender must be a character!")
  }

  if(class(units) != "character") {
    stop("units must be a character!")
  }
  else{
    if(tolower(units) != "english" && tolower(units) != "metric") {
      stop("units must be either 'english' or 'metric'")
      geterrmessage()
    }
  }

  if(tolower(units) == "english" ){
    if(tolower(gender) == "male"){
      calories = ((age * .2017) - (weight * 0.09036) + (heart_rate * .6309) - 55.0969) * time/4.184
    }
    if(tolower(gender) == "female"){
      calories = ((age * 0.074) - (weight * 0.05741) + (heart_rate * .4472) - 20.4022) * time/4.184
    }
    return(signif(calories))
  }

  # Calories burned formula for metric units
  if(tolower(units) == "metric" ){
    weight = weight * 2.20462
    if(tolower(gender) == "male"){
      calories = ((age * .2017) - (weight * 0.09036) + (heart_rate * .6309) - 55.0969) * time/4.184
    }
    if(tolower(gender) == "female"){
      calories = ((age * 0.074) - (weight * 0.05741) + (heart_rate * .4472) - 20.4022) * time/4.184
    }
    return(signif(calories))
  }
}
