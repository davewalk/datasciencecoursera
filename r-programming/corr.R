# Write a function that takes a directory of data files and a threshold for complete
# cases and calculates the correlation between sulfate and nitrate for monitor locations
# where the number of completely observed cases (on all variables) is greater than the
# threshold. The function should return a vector of correlations for the monitors that meet
# the threshold requirement. If no monitors meet the threshold requirement, then the function
# should return a numeric vector of length 0.
source("complete.R")

get_correlation <- function(x, dir) {
    id <- x[1]
    filename <- sprintf("%03d", (id))
    file <- paste(as.character(filename), ".csv", sep="")
    filepath <- file.path(dir, file)
    data <- read.csv(filepath)
    filtered_data <- data[complete.cases(data),]
    cor(filtered_data$sulfate, filtered_data$nitrate)
}

corr <- function(directory, threshold=0) {
    complete <- complete(directory)
    passed <- complete[complete$nobs > threshold,]
    if (nrow(passed) > 0) {
        apply(passed, 1, get_correlation, dir=directory)
    } else {
        vector("numeric")
    }  
}