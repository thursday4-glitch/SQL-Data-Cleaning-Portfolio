-- SQL Project: Data Cleaning
-- Dataset: World Layoffs

-- Disable safe updates to allow mass updates/deletes
SET SQL_SAFE_UPDATES = 0;

USE world_layoffs;

-- ---------------------------------------------------------
-- 1. REMOVE DUPLICATES
-- ---------------------------------------------------------

-- Create staging table to preserve raw data
DROP TABLE IF EXISTS layoffs_staging2;

CREATE TABLE layoffs_staging2 (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Insert data with row_num to identify duplicates
INSERT INTO layoffs_staging2
SELECT *,
ROW_NUMBER() OVER(
    PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, funds_raised_millions, country
) AS row_num
FROM layoffs;

-- Delete duplicate rows
DELETE 
FROM layoffs_staging2
WHERE row_num > 1;


-- ---------------------------------------------------------
-- 2. STANDARDIZE DATA
-- ---------------------------------------------------------

-- Trim whitespace from company names
UPDATE layoffs_staging2
SET company = TRIM(company);

-- Normalize 'Crypto' industry variations
UPDATE layoffs_staging2
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%';

-- Fix country names (remove trailing period)
UPDATE layoffs_staging2
SET country = TRIM(TRAILING '.' FROM country)
WHERE country LIKE 'United States%';

-- Convert date column to proper DATE format
UPDATE layoffs_staging2
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');

ALTER TABLE layoffs_staging2
MODIFY COLUMN `date` DATE;


-- ---------------------------------------------------------
-- 3. HANDLE NULL VALUES
-- ---------------------------------------------------------

-- Convert blank industries to NULL
UPDATE layoffs_staging2
SET industry = NULL
WHERE industry = '';

-- Populate null industry values using self-join
UPDATE layoffs_staging2 t1
JOIN layoffs_staging2 t2
    ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE t1.industry IS NULL 
AND t2.industry IS NOT NULL;


-- ---------------------------------------------------------
-- 4. REMOVE IRRELEVANT DATA
-- ---------------------------------------------------------

-- Remove rows with no layoff data
DELETE 
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

-- Drop helper column
ALTER TABLE layoffs_staging2
DROP COLUMN row_num;

-- Final Output
SELECT * FROM layoffs_staging2;