# Write a function named 'pollutantmean' that calculates the mean of a pollutant 
# (sulfate or nitrate) across a specified list of monitors. The function 'pollutantmean' 
# takes three arguments: 'directory', 'pollutant', and 'id'. Given a vector monitor ID numbers,
# 'pollutantmean' reads that monitors' particulate matter data from the directory specified 
# in the 'directory' argument and returns the mean of the pollutant across all of the monitors,
# ignoring any missing values coded as NA.
pollutantmean <- function(directory, pollutant, id=1:332) {
    vctr <- c()
    for(i in id) {
        filename <- sprintf("%03d", (i))
        file <- paste(as.character(filename), ".csv", sep="")
        filepath <- file.path(directory, file)
        data <- read.csv(filepath)
        vals <- data[pollutant]
        bad <- is.na(vals)
        vctr <- c(vctr, vals[!bad])
        
    }
    mean(vctr)
}