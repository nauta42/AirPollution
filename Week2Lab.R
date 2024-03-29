# Part 1
pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  filenames <- sprintf("%s/%03d.csv", d,i)
  data <- lapply(filenames, read.csv)
  mm = numeric()
  for(dd in data) { mm <- c(mm, mean(dd[[p]], na.rm = TRUE))}
  mean(mm)
}