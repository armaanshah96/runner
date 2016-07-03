#' Calculates Body Fat Percentage
#' @param weight Weight of individual of numeric vector. In pounds if english units and kilograms if metric units.
#' @param gendsnter "male" for male and "female" for female.
#' @param wrist Wrist measurement of individual of numeric vector. In inches if english units and centimeters if metric units.
#' @param waist Waist measurement at navel of individual of numeric vector. In inches if english units and centimeters if metric units.
#' @param hip Hip measurement of individual at fullest point of numeric vector. In inches if english units and centimeters if metric units.
#' @param forearm Forearm measurement of individual at fullest point of numeric vector. In inches if english units and centimeters if metric units.
#' @param units Character vector representing the units convention used for variables. Either "english" or "metric". Default is "english".
#' @return numeric vector representing the BMI of an individual based on their height and weight
#' @examples
#' body_fat(152, "male",30, 6.5, 34, 10, "english")
#' @export
body_fat <- function(weight, gender, waist, wrist = 0, hip = 0, forearm = 0, units="english") {
  # Check parameter types are correct
  if(class(weight) != "numeric") {
    stop("weight must be a numeric!")
  }

  if(class(gender) != "character") {
    stop("gender must be a character!")
  }

  if(tolower(gender) != "male" & tolower(gender) != "female") {
    stop("gender must be either 'male' or 'female'")
  }

  if(class(wrist) != "numeric") {
    stop("wrist must be a numeric!")
  }

  if(class(waist) != "numeric") {
    stop("waist must be a numeric!")
  }

  if(class(hip) != "numeric") {
    stop("hip must be a numeric!")
  }

  if(class(hip) != "numeric") {
    stop("hip must be a numeric!")
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

  # Body Fat Percentage formula for english units
  if(tolower(units) == "english" ){
    if(tolower(gender) == "male"){
      bfp = (weight - ((weight*1.082 + 94.42) - (waist * 4.15))) * 100 / weight
    }
    if(tolower(gender) == "female"){
      bfp = (weight - ((weight * 0.732 + 8.987) + (wrist/3.140) - (waist * 0.157) - (hip * 0.249) + (forearm * .434))) * 100/weight
    }
    return(signif(bfp, 4))
  }

  # Body Fat Percentage formula for metric units
  if(tolower(units) == "metric" ){
    weight = weight * 2.20462
    wrist = wrist * 0.393701
    waist = waist * 0.393701
    hip = hip * 0.393701
    forearm = forearm * 0.393701
    if(tolower(gender) == "male"){
      bfp = (weight - ((weight*1.082 + 94.42) - (waist * 4.15))) * 100 / weight
    }
    if(tolower(gender) == "female"){
      bfp = (weight - ((weight * 0.732 + 8.987) + (wrist/3.140) - (waist * 0.157) - (hip * 0.249) + (forearm * .434))) * 100/weight
    }
    return(signif(bfp, 4))
  }
}
