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

  # SCM read the monitor data files
  filenames <- sprintf("%s/%03d.csv", directory, id)
  dfList <- lapply(filenames, read.csv)

  # SCM first solution
  # means= numeric()
  # for(df in dfList) { means <- c(means, mean(df[[pollutant]], na.rm = TRUE))}
  # mean(means)
  
  # SCM second solution
  data <- do.call(rbind,dfList)
  mean(data[[pollutant]], na.rm = TRUE)
  
  # SCM another solution
  # Ref: http://www.r-bloggers.com/concatenating-a-list-of-data-frames/
  # library(data.table)
  # data <- rbindlist(dfList)
  
  
}