# over time graph plot
#' Plots the calories burned or heartrate of user's runs over time
#' @param name Name of run log in character vector format. Must be spelled the same way as the logged values in order to access running log
#' @param type Type of plot expressed as a character vector. Either 'calories' or 'heartrate' as a function of time are measured. Defualt set is 'calories.
#' @return Returns a plot of type vs. time to give an understanding of progress over time.
#' @examples
#' progress_plot("John", type="heartrate")
#' @import ggplot2
#' @export
progress_plot <- function(name,type="calories") {
  # Check if name is right type and tolower name
  if(is.character(name) != TRUE) {
    stop("Name must be a character type!")
  }
  else {
    name <- tolower(name)
  }

  # Check if type is the right type, tolower type, and check for correct inputs
  if(is.character(type) != TRUE) {
    stop("Type must be a character type!")
  }
  else {
    type <- tolower(type)
    if(type!='calories' && type!='heartrate') {
      stop("type must be either 'calories' or heartrate")
    }
  }
  filename <- paste(name,".rds",sep="")
  log <- readRDS(filename)
  # return(class(log))
  if(type=='heartrate'){
    #regardless of na values plot
    ggplot(log,aes(x=Date,y=Heart.Rate)) +geom_point()+geom_smooth()
  }
  else{
    ggplot(log,aes(x=Date,y=Calories.Burned)) + geom_point() +geom_smooth()
  }
}
