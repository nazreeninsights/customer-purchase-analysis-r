# customer-purchase-analysis-r
Showcase of R skills applied to real-world e-commerce data: cleaning, visualization, clustering, and statistical analysis for actionable business insights.

# Customer Purchase Analysis with R

## Project Overview

This project analyzes customer purchasing behavior for an e-commerce company using R, with the aim of generating insights to inform marketing and business strategy.

---

## Dataset

The dataset covers one year of e-commerce transactions and includes:
- **CustomerID:** Unique customer identifier
- **Gender:** Male/Female
- **Age:** Customer age
- **AnnualIncome:** Annual income (RM)
- **SpendingScore:** Spending score (0–100)
- **PurchaseCategory:** Product category (e.g., Electronics, Clothing, Groceries)
- **TransactionDate:** Date of transaction

---

## Analysis Workflow

1. **Data Import & Cleaning**
    - Load and clean the dataset
    - Handle missing values
    - Convert categorical columns

2. **Exploratory Data Analysis (EDA)**
    - Summary statistics for numerical variables
    - Histogram of spending scores
    - Boxplot of annual income by gender
    - Top 3 most purchased categories

3. **Customer Segmentation**
    - K-means clustering using SpendingScore and AnnualIncome
    - Visualize and interpret clusters

4. **Time Series Insights**
    - Trend analysis of monthly transactions
    - Seasonal patterns identification

5. **Statistical Testing**
    - T-test for SpendingScore difference by gender
    - Interpret significance and business relevance

---

## Key Insights

- **Spending behavior** is diverse, no dominant pattern across the customer base.
- **Top 3 purchase categories**: Books, Groceries, Home & Kitchen.
- **Customer segmentation**:
    - Cluster 1: High spenders with mid-to-high income
    - Cluster 2: Low spenders with high income
    - Cluster 3: Mixed spenders, low to mid income
- **Seasonal trends**: Peaks in October, dip during Nov-Dec, rebound in January, decline through early year.
- **No significant difference** in average SpendingScore between genders.

---

## Files Included

- **Project Report (PDF)**
- **R Analysis Script**
- **Supporting Visualizations (PDF)**
- **Dataset** 

---

## How to Use

1. Open the R script in RStudio.
2. Ensure the dataset file is in the same directory.
3. Run code sections as annotated for data cleaning, analysis, and visualizations.

---

## Author

Nazreen Agos Bin Abdul Latiff  
GitHub: [nazreeninsight](https://github.com/nazreeninsight)

---

*For demonstration and learning purposes. All data is anonymized and non-confidential.*
