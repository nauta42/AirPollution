complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  # SCM read the monitor data files
  filenames <- sprintf("%s/%03d.csv", directory, id)
  dfList <- lapply(filenames, read.csv)
  data <- do.call(rbind,dfList)
  #mean(data[[pollutant]], na.rm = TRUE)
  ok <- complete.cases(data)
  okData <- data[ok,]
  #counted <- by(okData, okData$ID, nrow, simplify = FALSE)
  #counted <- table(okData$ID)
  #data.frame(id=names(counted),nobs=unlist(counted))
  counted <- table(factor(okData$ID,ordered(id)))
  res <- as.data.frame(counted)
  names(res) <- c('id','nobs')
  res
}