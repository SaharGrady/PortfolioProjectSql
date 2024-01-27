# COVID-19 Data Analysis Project

This project involves the analysis of COVID-19 data, including data cleaning, SQL queries, stored procedures, indexing, and cleaning of the NashvilHousing dataset.

## Table of Contents

- [Introduction](#introduction)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Usage](#usage)
- [Data Cleaning](#data-cleaning)
- [Joins and Queries](#joins-and-queries)
- [Stored Procedures](#stored-procedures)
- [Indexing](#indexing)
- [NashvilHousing Data Cleaning](#nashvilhousing-data-cleaning)
  - [Date](#date)
  - [Fixing Missing Values](#fixing-missing-values)
  - [Address Fixing](#address-fixing)
  - [Changing 'Y' and 'N' to 'Yes' and 'No'](changing-y-and-n-to-yes-and-no)
  - [Duplicate Values](#duplicate-values)
- [Tableau Dashboard](#tableau-dashboard)
- [Contributing](#contributing)

## Introduction

This project analyzes COVID-19 data, involving SQL queries, data cleaning, and various operations on datasets.

## Getting Started

### Prerequisites

Make sure you have SQL Server installed.

### Installation

1. Clone the repository.
2. Open the SQL Server Management Studio and execute the SQL scripts.

## Usage

Explore and analyze COVID-19 and NashvilHousing datasets using SQL queries provided.

## Data Cleaning

Learn about the SQL queries involved in cleaning the COVID-19 dataset.

## Joins and Queries

Understand the SQL queries for joins and other operations on COVID-19 datasets.

## Stored Procedures

Explore stored procedures such as `GetLocationVacData` and `GetLocationTestData`.

## Indexing

Discover how indexing is implemented, especially with the `idxGetLocationTestData` index.

## NashvilHousing Data Cleaning

### Date

See how date cleaning is performed on the NashvilHousing dataset.

### Fixing Missing Values

Learn about the process of handling missing values in the NashvilHousing dataset.

### Address Fixing

Understand the steps taken to fix address-related issues in the NashvilHousing dataset.

### Changing 'Y' and 'N' to 'Yes' and 'No'

Explore how 'Y' and 'N' values are changed to 'Yes' and 'No' in the NashvilHousing dataset.

### Duplicate Values

See how duplicate values are identified and handled in the NashvilHousing dataset.

## Tableau Dashboard

Explore the Tableau dashboard for visualizations related to this project: [Tableau Dashboard](https://public.tableau.com/app/profile/sahar.mashraki/viz/PortfolioProject_17057639519990/Dashboard1?publish=yes).

### Excel Data Generation Explanation

The data in this dataset was generated using Excel, incorporating a random function and VLOOKUP for data mapping. Below is a brief overview:

1. **Random Data Generation:**
   - Utilized the random function in Excel to generate unique values for each column.
   - Employed the `RAND()` function, for instance, to create diverse and random values.

2. **List Generation:**
   - Developed lists or arrays of values to introduce diversity in specific columns (e.g., jobs, cities).
   - Combined these lists with the random function to assign varied values to each row.

3. **VLOOKUP for Data Mapping:**
   - Assigned unique IDs to each row by creating an ID column for each job and city combination.
   - Leveraged the `VLOOKUP` function to match and assign IDs based on the respective job and city.

4. **Excel Formulas Used:**
   - Example formulas used include:
     ```excel
     = RAND()              // Generate a random number
     = VLOOKUP(...)        // Look up a value in a table
     = CONCATENATE(...)    // Concatenate values
     = INDEX(...)          // Return a value at a specified row and column
     ```

Feel free to customize this information based on the exact Excel functions and steps you used. This provides transparency on the data generation process and enhances user understanding.

## Contributing

Feel free to contribute by reporting issues, making suggestions, or submitting pull requests.




