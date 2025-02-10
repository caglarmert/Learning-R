# Load necessary libraries
library(tidyverse)

# Load dataset (Example: built-in mtcars dataset)
data <- mtcars

# View first few rows
head(data)

# Summary statistics
summary(data)

# Check for missing values
sum(is.na(data))

# Data Visualization
# Histogram of MPG
ggplot(data, aes(x = mpg)) +
  geom_histogram(binwidth = 2, fill = 'blue', color = 'black', alpha = 0.7) +
  labs(title = 'Distribution of MPG', x = 'Miles Per Gallon', y = 'Count')

# Scatter plot of Horsepower vs. MPG
ggplot(data, aes(x = hp, y = mpg)) +
  geom_point(color = 'red', alpha = 0.6) +
  geom_smooth(method = 'lm', color = 'blue', se = FALSE) +
  labs(title = 'Horsepower vs. MPG', x = 'Horsepower', y = 'MPG')

# Boxplot of MPG by Cylinder Count
ggplot(data, aes(x = factor(cyl), y = mpg)) +
  geom_boxplot(fill = 'green', alpha = 0.6) +
  labs(title = 'MPG by Cylinder Count', x = 'Number of Cylinders', y = 'MPG')

# Correlation matrix
cor_matrix <- cor(data)
print(cor_matrix)

# Save cleaned data
write.csv(data, 'cleaned_data.csv', row.names = FALSE)
