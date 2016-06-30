# bmi
#' @param height Height of individual of numeric vector. In inches if english units and meters if metric units.
#' @param weight Weight of individual of numeric vector. In pounds if english units and kilograms if metric units.
#' @param units  Character vector representing the units convention used for height and weight. Either "english" or "metric". Default is "english".
#' @return numeric vector representing the BMI of an individual based on their height and weight
#' @example
#' bmi(72,1.7,"metric")
#' @export
bmi <- function(height,weight,units="english") {
  # Check parameter types are correct
  if(class(height) != "numeric") {
    stop("height must be a numeric!")
  }

  if(class(weight) != "numeric") {
    stop("weight must be a numeric!")
  }

  if(class(units) != "character") {
    stop("units must be a character!")
  }
  else{
    if(units != "english" && units != "metric") {
      stop("units must be either 'english' or 'metric'")
    }
  }

  body_mass_index <- weight/height^2
  # BMI formula for english units
  if(units=="english"){
    result <- signif(body_mass_index * 703,4)
    return(result)
  }

  # BMI formula for metric units
  result <- signif(body_mass_index,4)
  return(result)

}
