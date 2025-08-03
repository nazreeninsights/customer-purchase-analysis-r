# ---- Question 1 ----

# Load data - ensure file is in the working directory

df <- read.csv("~/Data Analytic Study UMK/Assignment 5 (R Studio)/Customer Purchase Data.csv")
View(df)

# Missing values handling
anyNA(df) # Check presence of missing values
df = na.omit(df) # Remove rows with missing values (if any)

# Ensure categorical column as character data type

# | Type          | Use Case                                                                                                        |
# | ------------- | --------------------------------------------------------------------------------------------------------------- |
# | **Character** | When you just want to treat text as plain strings (e.g., for printing, labeling, or temporary cleaning)         |
# | **Factor**    | When the variable has a fixed set of categories (e.g., for modeling, grouping, plotting, statistical summaries) |
  

df$Gender <- as.factor(df$Gender)
df$PurchaseCategory <- as.factor(df$PurchaseCategory)

# Check structure of the dataset

str(df)

# ---- Question 2 ----

# View summary statistics for all numeric columns
summary(df)

# Create a histogram of SpendingScore

install.packages("ggplot2")  # Run only once
library(ggplot2)

# Histogram of SpendingScore

ggplot(df, aes(x = SpendingScore)) +
  geom_histogram(binwidth = 5, fill = "steelblue", color = "white") +
  labs(title = "Histogram of Spending Score",
       x = "Spending Score",
       y = "Count") +
  theme_minimal()

# Boxplot of AnnualIncome by Gender

# The AnnualIncome column was not properly converted to numeric — it still contains text labels like "RM91,995.00" instead of plain numbers.
# Solution: Convert AnnualIncome to Numeric

install.packages("readr")
library(readr)

library(ggplot2)

# Remove "RM" and commas, then convert to numeric
df$AnnualIncome <- readr::parse_number(df$AnnualIncome)

ggplot(df, aes(x = Gender, y = AnnualIncome)) + 
  geom_boxplot(fill = "orange") +
  labs(
    title = "Annual Income by Gender",
    x = "Gender",
    y = "Annual Income (USD)"
  ) +
  theme_minimal()

# Find the top 3 most purchased categories.

install.packages("dplyr")

library(dplyr)

top_categories <- df %>%
  group_by(PurchaseCategory) %>%
  summarise(Count = n()) %>%
  arrange(desc(Count)) %>%
  slice_head(n = 3)

print(top_categories)

# Visualize

library(ggplot2)

ggplot(top_categories, aes(x = reorder(PurchaseCategory, Count), y = Count)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(
    title = "Top 3 Most Purchased Categories",
    x = "Purchase Category",
    y = "Number of Purchases"
  ) +
  coord_flip() +
  theme_minimal()

# ---- Question 3 ----

# Customer Segmentation (Clustering)

# Ensure AnnualIncome and SpendingScore are numeric
str(df$AnnualIncome)
str(df$SpendingScore)

# Create a new dataframe with relevant columns
cluster_data <- df %>%
  select(AnnualIncome, SpendingScore)

# Remove any missing values (just in case)
cluster_data <- na.omit(cluster_data)

# Scale the data (standardize for fair distance comparison)
cluster_scaled <- scale(cluster_data)

# Apply K-means with 3 clusters
set.seed(123)  # for reproducibility
kmeans_result <- kmeans(cluster_scaled, centers = 3, nstart = 25)

# Add cluster labels back to original data
df$Cluster <- as.factor(kmeans_result$cluster)

# Visualize the Clusters
library(ggplot2)

ggplot(df, aes(x = AnnualIncome, y = SpendingScore, color = Cluster)) +
  geom_point(size = 3, alpha = 0.7) +
  labs(title = "Customer Segmentation using K-Means",
       x = "Annual Income (USD)",
       y = "Spending Score") +
  theme_minimal()

# ---- Question 4 ----

# Time Series Insights

# Convert TransactionDate into Date format

# To convert the TransactionDate column into proper Date format, I can use the lubridate package, especially if the format is in dd/mm/yyyy, which is common in Malaysian datasets.

install.packages("lubridate")  # Run once
library(lubridate)

df$TransactionDate <- dmy(df$TransactionDate)

str(df$TransactionDate) # to confirm it works

# Plot the number of transactions per month

library(lubridate)
library(dplyr)

# Create a new column with year-month format (e.g., "2024-04")
df$Month <- floor_date(df$TransactionDate, unit = "month")

monthly_transactions <- df %>%
  group_by(Month) %>%
  summarise(Transactions = n())

# Plot the results

library(ggplot2)

ggplot(monthly_transactions, aes(x = Month, y = Transactions)) +
  geom_line(color = "steelblue", size = 1.2) +
  geom_point(size = 3, color = "steelblue") +
  labs(
    title = "Number of Transactions Per Month",
    x = "Month",
    y = "Number of Transactions"
  ) +
  theme_minimal()

#----Question 5----

# Check that Gender is a factor and SpendingScore is numeric

str(df$Gender)
str(df$SpendingScore)

df$SpendingScore <- as.numeric(df$SpendingScore)

t_test_result <- t.test(SpendingScore ~ Gender, data = df)
print(t_test_result)