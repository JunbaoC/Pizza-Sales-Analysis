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
```

## **Key Insights**
1. **Hourly Order Trends**:
   - Most orders are placed during **6 PM to 8 PM**, indicating peak dinner hours.
   - Very few orders are placed late at night or early morning.

2. **Monthly Sales Trends**:
   - Sales peak in **November and December**, likely due to holiday promotions or seasonal demand.
   - Steady growth in sales during the first half of the year, with slight dips in off-peak months.

3. **Popular Pizza Categories**:
   - **Classic pizzas** dominate sales, followed by **Supreme pizzas**.
   - **Veggie pizzas** show consistent demand among customers with dietary preferences.

4. **Ingredient Preferences**:
   - The top ingredients include **cheese**, **tomato**, and **pepperoni**, showing a preference for traditional and simple flavors.
   - Specialty ingredients like **mushrooms** and **chicken** also contribute significantly to sales in their respective categories.


## **Visualizations**

### **1. Hourly Order Distribution**
- **Chart Type**: Bar Chart
- **Description**:
  - Displays the total number of orders placed during each hour of the day.
  - Identifies peak ordering hours to optimize operations like staffing and delivery schedules.

### **2. Monthly Sales Trends**
- **Chart Type**: Line Chart
- **Description**:
  - Visualizes sales revenue and order volume trends over months.
  - Highlights seasonal variations and sales spikes during holiday periods.
