best <- function(state, outcome) {
## Read outcome data

	full_data <- read.csv("outcome-of-care-measures.csv", colClasses="character")
		        
## Check that state and outcome are valid
		column <- if (outcome == "heart attack") {
			"Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
		} else if (outcome == "heart failure") {
			"Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
		} else if (outcome == "pneumonia") {
			"Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
		} else {
			stop("invalid outcome")
				    }
		    
			data_for_state <- full_data[full_data$State == state, c("Hospital.Name", column)]

			if (nrow(data_for_state) == 0) {
				stop("invalid state")
			}

## Return hospital name in that state with lowest 30-day death rate    
		data_for_state[,2] <- as.numeric(data_for_state[,2])

## Sorting items
			ordered_data_for_state <- order(data_for_state[column], data_for_state$Hospital.Name)
			        
## Pick up first row of state
			as.character(data_for_state$Hospital.Name[ordered_data_for_state[1]])

}
