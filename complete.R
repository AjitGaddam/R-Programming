complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating the location of the CSV files
  ## 'id' is an integer vector indicating the monitor ID numbers to be used
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the number of complete cases
  
  #obtain length of ID vector
  len <- length(id)
  complete_data <- rep(0, len)
  
  ## find the files in specdata folder
  all_files <- list.files(directory)
  file_paths <- paste(directory, "/", all_files, sep="")
  
  ## create matrix with 0 rows and 2 columns
  result <- matrix(data = NA,nrow = 0,ncol = 2)
  j <- 1
  for (i in id) {
    data <- read.csv(file_paths[i])
    complete_data[j] <- sum(complete.cases(data))
    j <- j + 1
  }
  
  result <- data.frame(id = id, nobs = complete_data)
  return(result)
  
}
