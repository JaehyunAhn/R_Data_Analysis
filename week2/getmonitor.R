getmonitor <- function(id, directory, summarize = FALSE) {
        ## 'id' is a vector of length 1 indicating the monitor ID
        ## number. The user can specify 'id' as either an integer, a
        ## character, or a numeric.
        if( nchar(id) == 1 ) {
        	id = paste("00",id,sep="")
        }
        else if( nchar(id) == 2 ) {
        	id = paste("0",id,sep="")
        }
        else if( nchar(id) == 3 ) {
        }
        else {
        	print("[Error] read csv file error")
        }
        
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        dir = paste(directory,"/",id,".csv",sep="")
        base_table = read.csv(dir)
        
        ## 'summarize' is a logical indicating whether a summary of
        ## the data should be printed to the console; the default is
        ## FALSE
        if(summarize == TRUE) {
        	print(summary(base_table))
        	return (base_table)
        }
        else {
        	return (base_table)
        }
}