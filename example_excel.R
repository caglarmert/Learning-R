# Load necessary library
library(openxlsx)

# Create a data frame
my_data <- data.frame(
  Name = c("Sabiha", "Afet", "Halide"),
  Age = c(30, 25, 35),
  Hobby = c("Uçma", "Okuma", "Yazma")
)

# Write the data frame to an Excel file
write.xlsx(my_data, "original_data.xlsx", rowNames = FALSE)

# Read the data back from the Excel file
read_data <- read.xlsx("original_data.xlsx")

# Modify a value
read_data$Age[read_data$Name == "Afet"] <- 26  # Change Afet's age

# Write the modified data to another Excel file
write.xlsx(read_data, "modified_data.xlsx", rowNames = FALSE)

# Print modified data
print(read_data)