# Amazon Sales Analytics & Forecasting – End-to-End Pipeline


✅ Project Overview
This project demonstrates a complete data pipeline for Amazon Sales Analytics using:

Python (Data Engineering & Forecasting)

MySQL (Data Storage & Advanced Queries)

Power BI (Interactive Dashboards)

Azure Blob Simulation (Azurite for Cloud Integration)

Designed as a MAANG-ready portfolio project for Data Analyst roles with expertise in SQL, BI, Cloud, and Predictive Analytics.

🏗 Architecture
mermaid
Copy
Edit
graph TD
    A[Python: Data Generation] --> B[Azure Blob Storage (Azurite)]
    B --> C[MySQL Database]
    C --> D[Power BI Dashboards]
    D --> E[Python: Prophet Forecasting]
    E --> F[Power BI Predictive Page]
🔑 Key Features
✔ Data Generation – Synthetic customers, products, and order details using Python & Faker
✔ SQL Analytics – KPIs, revenue trends, customer lifetime value, regional and product performance
✔ Dynamic Power BI Dashboards – 5 pages: Executive Summary, Customer Insights, Product Analysis, Forecasting
✔ Forecasting Model – Prophet-based revenue prediction for the next 12 months
✔ Cloud Simulation – Azurite (Azure Blob Storage Emulator) for cloud integration demo

🛠 Tech Stack
Python: Pandas, Faker, Prophet, Matplotlib

Database: MySQL

Visualization: Power BI

Cloud Simulation: Azurite + Azure Storage Explorer

📂 Project Structure
kotlin
Copy
Edit
📦 Amazon-Sales-Analytics
 ┣ 📂 data
 ┃ ┣ customers.csv
 ┃ ┣ products.csv
 ┃ ┣ orders.csv
 ┃ ┣ order_details.csv
 ┃ ┣ monthly_revenue.csv
 ┃ ┗ forecast.csv
 ┣ 📂 scripts
 ┃ ┣ data_generation.py
 ┃ ┗ amazon_forecast.py
 ┣ 📂 dashboards
 ┃ ┗ Amazon_Sales.pbix
 ┣ 📂 screenshots
 ┃ ┣ dashboard_pages.png
 ┃ ┣ azurite_running.png
 ┃ ┗ storage_explorer.png
 ┣ README.md
 ┗ requirements.txt
📊 Dashboards Overview
Page 1: Executive Summary
KPIs:

Total Revenue: $1,245,000

Total Profit: $310,000

Total Orders: 9,800

Average Order Value: $127

Visuals:

Monthly Revenue Trend (Line Chart)

Revenue by Region (Map/Bar)

Payment Method Split (Donut Chart)

Page 2: Regional & Category Analysis
Heatmap: Profit Margin by Region & Category

Bar Chart: Top Regions by Revenue

Page 3: Customer Insights
Top 10 Customers by Spend

Customer Segmentation: New vs Repeat

Page 4: Product Performance
Top 10 Products by Revenue

Category Contribution Analysis

Page 5: Forecasting
Prophet Forecast: 12-month revenue projection

KPI: Forecast Growth: +18%

☁ Cloud Integration
Uploaded raw and forecast data to Azure Blob Storage simulation using Azurite

Verified using Azure Storage Explorer

Screenshots included for validation

📈 Results
Total Revenue Analyzed: $1,245,000

Forecast Horizon: 12 Months

Predicted Growth: +18%

Top Product: Electronics Product 45

🔗 Connect with Me
Name: Tanmay Sharma
LinkedIn: www.linkedin.com/in/
tanmay-sharma-800599373
GitHub: https://github.com/Tanu272004/Amazon_Analysis_Project.git

