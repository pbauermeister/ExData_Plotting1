file.url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
file.zip <- "household_power_consumption.zip"
file.txt <- "household_power_consumption.txt"
file.csv <- "filtered-data.csv"

wanted.dates.regex <- "^[12]/2/2007"

# If we have an already prepared CSV data set, load it
if (file.exists(file.csv)) {
    data <- read.csv(file.csv)
} else {
    # Ensure we have the TXT data set file duly extracted
    if (!file.exists(file.txt)) {
        # Fetch the ZIP archive if needed
        if (!file.exists(file.zip)) {
            download.file(url=file.url, destfile=file.zip, method='curl')
        }
        unzip (file.zip, exdir = "./")
    }
    # Load the file, only for items of wanted dates
    lines <- readLines(file.txt)                            # all lines
    subLines <- lines[grep(wanted.dates.regex, lines)]      # keep only wanted dates
    subLines <- append(subLines, lines[1], 0)               # prepend header line
    data <- read.table(text=subLines, header=TRUE, sep=";", na.strings="?") # load from lines
    data <- data[complete.cases(data),]                     # remove entries with NAs
    # Save to CSV data set file
    write.csv(data, file.csv, row.names=FALSE)
}

# Convert Date+Time (string) columns to a single datetime (POSIXct) column
data$datetime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
data <- subset(data, select = -c(Date,Time) )
