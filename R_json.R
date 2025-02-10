# Load necessary library
library(jsonlite)

# Create a list
my_list <- list(
  name = "Türkan",
  age = 25,
  hobbies = c("Reading", "Hiking", "Cooking")
)

# Convert list to JSON and save it
json_file <- "data.json"
write_json(my_list, json_file, pretty = TRUE)

# Read JSON back into R
my_list_new <- fromJSON(json_file)

# Modify a value
my_list_new$age <- 26  # Change age

# Print modified list
print(my_list_new)