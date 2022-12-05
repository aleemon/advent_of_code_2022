##-----  Part 1 Problem  -----

# Split based on spaces
# Sum the values within each split
# Find the highest value


##-----  Part 1 Sample  ----

sample <- data.table::fread(
  "1000
  2000
  3000
  
  4000
  
  5000
  6000
  
  7000
  8000
  9000
  
  10000",
  header = FALSE,
  colClasses = "character"
)

#~ Imports the whitespace lines as NA
## This stuff doesn't work:
sample[sample$V1 == ""] <- "empty"
groups <- str_split(sample$V1, pattern = "empty")

#~ Not sure how to break the chunks 