# Data Cleaning Project: World Layoffs (MySQL)

## 📌 Project Overview
In this project, I used SQL to clean raw housing data from the **World Layoffs Dataset**. The goal was to transform messy data into a standardized format suitable for Exploratory Data Analysis (EDA).

## 📂 Dataset
The original dataset tracks layoffs from companies worldwide since COVID-19. 
- **Source:** [Kaggle - World Layoffs]

## 🛠 Tools Used
- **MySQL Workbench**
- **SQL Functions:** Joins, Windows Functions (ROW_NUMBER), CTEs, String Manipulation.

## 🧹 Cleaning Process (Key Steps)
1. **Remove Duplicates:** Used `ROW_NUMBER()` and `PARTITION BY` to identify and remove duplicate entries.
2. **Standardize Data:** - Fixed spelling variations in the `Industry` column (e.g., merging "Crypto" and "CryptoCurrency").
   - Cleaned country names (removed trailing periods).
   - Converted text-based dates to standard `DATE` format.
3. **Handle Null Values:** Populated missing industry data using self-joins based on company names.
4. **Remove Unnecessary Columns/Rows:** Dropped rows with missing critical data (Total Laid Off & Percentage) to ensure analysis accuracy.

## 📈 Results
The data is now clean, structured, and ready for analysis. 
