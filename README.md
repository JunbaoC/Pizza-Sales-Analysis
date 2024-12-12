# **Pizza Sales Analysis**

This project analyzes pizza sales data using SQL and Tableau. The analysis focuses on sales performance, customer preferences, and time-based trends. Insights are visualized through interactive Tableau dashboards.


## **Project Overview**
The main objectives of this project are:
- To clean and process raw pizza sales data.
- Perform SQL-based exploratory data analysis (EDA) to uncover key trends.
- Visualize insights using Tableau dashboards to support business decisions.


## **Dataset Description**
This dataset comes from [Kaggle: Pizza Sales Data](https://www.kaggle.com/datasets/shilongzhuang/pizza-sales/data). It contains **48,621 pizza orders** and includes the following features:

- **pizza_id**: Unique identifier for each pizza.
- **order_id**: Unique identifier for each order.
- **pizza_name_id**: Identifier for the specific pizza name.
- **quantity**: Number of pizzas ordered in a transaction.
- **order_date**: Date the order was placed.
- **order_time**: Time the order was placed.
- **unit_price**: Price per pizza.
- **total_price**: Total price of the order (quantity × unit price).
- **pizza_size**: Size of the pizza (S, M, L, XL, XXL).
- **pizza_category**: Category or style of pizza (Classic, Veggie, Supreme, Chicken).
- **pizza_ingredients**: Ingredients used in the pizza.
- **pizza_name**: Name of the pizza.


## **Tools and Technologies**
- **SQL (MySQL)**: For data cleaning and analysis.
- **Tableau**: For creating interactive dashboards.

## **Project Structure**
```plaintext
pizza-sales-analysis/
│
├── sql/                               # SQL scripts
│   └── Pizza Sales Analysis.sql       # Analysis queries
│
├── tableau/                           # Tableau dashboards
│   └── Pizza Sales Analysis.twbx      # Packaged Tableau workbook
│
└──README.md                           # Project documentation
