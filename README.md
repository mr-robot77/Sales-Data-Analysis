# Sales Data Analysis

This repository is for the Network Product Sales Prediction & Customers Data Analysis with Dashboard and Visualization project

##  Introduction

Welcome to the documentation for my project that involves importing a dataset into a database using SQLAlchemy and MySQL, Performing ETL on the dataset and Creating a Data Warehouse, Creating visualizations, Making a Prediction, and finally presenting the results in Power BI. This project aims to provide valuable insights into Network Products Sales data, enabling us to make informed decisions and gain a deeper understanding of Products Sales Information.

## Objectives

The primary objective of this project is to create a streamlined data pipeline for collecting, storing, analyzing, and visualizing Network Product sales data. By following this documentation, you will learn how to:

1. Create Database With MySQL: Create a database from the dataset and make Tables with Relationships between them.

2. Database Integration with SQLAlchemy: Learn how to set up and configure a SQL database using SQLAlchemy to Load the data efficiently.

3. Visualization & Prediction with Machine Learning: Explore various insights into the Network Products Sales and Creating Prediction with Machine Learning.

4. Power BI Integration: Finally, we will show you how to connect your database to Power BI to create interactive dashboards and visualizations to effectively communicate the insights derived from the data.

Below is a file structure of this project:

```
    .
    ├── Dataset    # Tables Extracted from the dataset
    |    ├── city.csv
    |    ├── Customers.csv
    |    ├── dataset.csv
    |    ├── products.csv
    |    ├── province.csv
    |    ├── sales.csv
    |    └─  time.csv
    ├── images
    |
    ├── NetSales.pbix    # Power BI Dashboard file
    |
    |
    ├── dataset.csv
    ├── initial.sql   # MySQL Queries
    |
    ├── NetSales Visualization and Connector.ipynb  # Notebook file for SQLAlchemy and Visualizations and Prediction
    |
    └── README.md # Explanation of project structure, tools used, and instructions for executing each part of the project.
    |
    └── requirements.txt
```


![Alt text](images/Sales_ERD.png)

![Alt text](images/Sales.PNG)

![Alt text](images/Geo.PNG)

![Alt text](images/Stats.PNG)

![Alt text](images/Relationships.PNG)
