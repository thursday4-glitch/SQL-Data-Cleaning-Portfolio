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

### 📊 Sample Cleaned Data

| Company | Location | Industry | Total Laid Off | Percentage | Date | Stage | Country | Funds (Millions) |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| Included Health | SF Bay Area | Healthcare | - | 0.06 | 2022-07-25 | Series E | United States | 272 |
| &Open | Dublin | Marketing | 9 | 0.09 | 2022-11-17 | Series A | Ireland | 35 |
| #Paid | Toronto | Marketing | 19 | 0.17 | 2023-01-27 | Series B | Canada | 21 |
| 100 Thieves | Los Angeles | Consumer | 12 | - | 2022-07-13 | Series C | United States | 120 |
| 10X Genomics | SF Bay Area | Healthcare | 100 | 0.08 | 2022-08-04 | Post-IPO | United States | 242 |
| 1stdibs | New York City | Retail | 70 | 0.17 | 2020-04-02 | Series D | United States | 253 |
| 2TM | Sao Paulo | Crypto | 90 | 0.12 | 2022-06-01 | Unknown | Brazil | 250 |
| 2TM | Sao Paulo | Crypto | 100 | 0.15 | 2022-09-01 | Unknown | Brazil | 250 |
| 2U | Washington D.C. | Education | - | 0.20 | 2022-07-28 | Post-IPO | United States | 426 |
| 54gene | Washington D.C. | Healthcare | 95 | 0.30 | 2022-08-29 | Series B | United States | 44 |
| 5B Solar | Sydney | Energy | - | 0.25 | 2022-06-03 | Series A | Australia | 12 |
| 6sense | SF Bay Area | Sales | 150 | 0.10 | 2022-10-12 | Series E | United States | 426 |
| 80 Acres Farms | Cincinnati | Food | - | 0.10 | 2023-01-18 | Unknown | United States | 275 |
| 8x8 | SF Bay Area | Support | 155 | 0.07 | 2023-01-18 | Post-IPO | United States | 253 |
| 8x8 | SF Bay Area | Support | 200 | 0.09 | 2022-10-04 | Post-IPO | United States | 253 |
| 98point6 | Seattle | Healthcare | - | 0.10 | 2022-07-21 | Series E | United States | 247 |
| 99 | Sao Paulo | Transportation | 75 | 0.02 | 2022-09-20 | Acquired | Brazil | 244 |
| Abra | SF Bay Area | Crypto | 12 | 0.05 | 2022-06-30 | Series C | United States | 106 |
| Absci | Vancouver | Healthcare | 40 | - | 2022-08-09 | Post-IPO | United States | 237 |
| Acast | Stockholm | Media | 70 | 0.15 | 2022-09-15 | Post-IPO | Sweden | 126 |
