# Write a function that reads a directory full of files and reports the number
# of completely observed cases in each data file. The function should return a data
# frame where the first column is the name of the file and the second column is the
# number of complete cases.
complete <- function(directory, id = 1:332) {
    results <- data.frame(id=numeric(), nobs=numeric())

    for(i in id) {
        filename <- sprintf("%03d", (i))
        file <- paste(as.character(filename), ".csv", sep="")
        filepath <- file.path(directory, file)
        data <- read.csv(filepath)
        filtered_data <- data[complete.cases(data),]
        nobs <- nrow(filtered_data)
        results <- rbind(results, data.frame(id=i, nobs=nobs))
    }
    
    results        
}