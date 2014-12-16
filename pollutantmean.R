pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating the location of the CSV files
  ## 'pollutant' is a character vector of length 1 indicating the name of the pollutant for which we will calculate the mean; 
  ##  either "sulfate" or "nitrate".
  ## 'id' is an integer vector indicating the monitor ID numbers to be used
  ## Return the mean of the pollutant across all monitors list in the 'id' vector (ignoring NA values)
  
  ## find the files in specdata folder
  all_files <- list.files(directory)
  file_paths <- paste(directory, "/", all_files, sep="")
  init <- if (pollutant == "sulfate") {
    2
  } else {
    3
  }
  ## create matrix with 0 rows and 4 columns
  total_data <- matrix(data=NA,nrow = 0,ncol = 4)
  for (i in id) {
    data <- read.csv(file_paths[i])
    total_data <- rbind(total_data, data)
  }
  ## generate mean and round off to 3 digits per sample output requirements
  result <- mean(total_data[,init], na.rm=TRUE)
  ##round(result, digits = 3)
}
