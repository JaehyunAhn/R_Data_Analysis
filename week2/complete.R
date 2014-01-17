complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        directory = paste(directory,"/",sep="")
        result = data.frame()
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used        
        for(i in id) {
        	if(nchar(i) == 1) {
        		file = paste("00",i,".csv",sep="")
        	}
        	else if(nchar(i) == 2) {
        		file = paste("0" ,i,".csv",sep="")
        	}
        	else if(nchar(i) == 3) {
        		file = paste(     i,".csv",sep="")
        	}
        	else {
        		print("[ERROR] to read .csv file")
        	}
        	
        	## module
        	file = paste(directory,file,sep="")
           base_data = read.csv(file)
              	
          ## Return a data frame of the form:
          ## id nobs
          ## 1  117
          ## 2  1041
          ## ...
          ## where 'id' is the monitor ID number and 'nobs' is the
          ## number of complete cases
          num_of_cases = 0
          
          case_data = subset(base_data, !is.na(sulfate) & !is.na(nitrate))
          num_of_cases = nrow(case_data)
          
          # id = i, nobs = num_of_cases
          temp = data.frame(id = i, nobs = num_of_cases)
          result <- rbind(result, temp)
          
        }
        return (result)
}
