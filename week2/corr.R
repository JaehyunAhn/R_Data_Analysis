corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  
  corr <- numeric(0)
  
  for (i in 1:332) {
   
	## omit na data
	data <- na.omit(read.csv(paste(directory, '/', sprintf("%03d", i), ".csv", sep="")))
    
    if (nrow(data) >= threshold) {
      cr <- cor(data["sulfate"], data["nitrate"])
      
      if (!is.na(cr)) {
        corr <- append(corr, cr)
      }
    }
  }
  
  corr
}
