# sql-challenge

## Background

It’s been two weeks since you were hired as a new data engineer at Pewlett Hackard (a fictional company). Your first major task is to do a research project about people whom the company employed during the 1980s and 1990s. All that remains of the employee database from that period are six CSV files.

For this project, you’ll design the tables to hold the data from the CSV files, import the CSV files into a SQL database, and then answer questions about the data. That is, you’ll perform data modeling, data engineering, and data analysis, respectively.

# Data Modeling

![schema](https://github.com/rachelschoen/sql-challenge/assets/161248655/0e8bdda4-493d-4ca0-9fca-e9ab26ff5ee4)

In order to import the CSV file, I had to CREATE the tables with any date field set to VARCHAR, but I later ALTER the table to change it back to a DATE datatype.

## Data Engineering

The code for creating the six tables in the database can be found in schema.sql, within the EmployeeSQL folder.

- `dept_no` and `title_id/emp_title_id` and `sex` are VARCHARs because they have a fixed length.
- All other strings are TEXT because they could have varying lengths.

## Data Analysis

The queries to get answers to the data analysis lists are found in queries.sql, within the EmployeeSQL folder.

The number of results for each query are the following:

1. 300,024
2. 36,150
3. 24
4. 331,603
5. 20
6. 52,245
7. 137,952
8. 1,638
  - All last names appeared between 145 ('Sadowsky') and 226 ('Baba') times, except 'Foolsday', which appeared only once.

