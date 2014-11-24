corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  
  # SCM read, concat & clean the monitor data files
  #rawfilenames <- sprintf("%s/%03d.csv", directory, id)
  rawfilenames <- list.files(path = directory, full.names = TRUE)
  rawdatalist <- lapply(rawfilenames, read.csv)
  rawdata <- do.call(rbind,rawdatalist)
  data <- rawdata[complete.cases(rawdata),]
  nobs <- tabulate(data$ID) #SCM indexed by monitor ID
  monitors <- which(nobs > threshold)
  #is.element(data$ID, monitors)
  datamon <- data[is.element(data$ID, monitors), ]
  #data[data[,"ID"]==c(1,2), ]
  datamonlist <- split(datamon, datamon$ID)
  c <- lapply(datamonlist, function(elem){ cor(elem$sulfate, elem$nitrate) })
  attributes(c) <- NULL
  v <- as.vector(c, mode = "numeric")
}