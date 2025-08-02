import pandas as pd
import random
from faker import Faker
from datetime import datetime

fake = Faker()

# Configuration
NUM_CUSTOMERS = 2000
NUM_PRODUCTS = 500
NUM_ORDERS = 10000
categories = ["Electronics", "Home", "Fashion", "Beauty", "Sports", "Books"]
regions = ["North America", "Europe", "Asia", "South America"]
payment_methods = ["Credit Card", "Debit Card", "PayPal", "Net Banking", "UPI"]

# Generate Customers Table
customers = []
for i in range(1, NUM_CUSTOMERS + 1):
    customers.append([
        i,
        fake.name(),
        fake.email(),
        fake.country()
    ])
customers_df = pd.DataFrame(customers, columns=["CustomerID", "Name", "Email", "Country"])

# Generate Products Table
products = []
for i in range(1, NUM_PRODUCTS + 1):
    category = random.choice(categories)
    price = round(random.uniform(10, 500), 2)
    products.append([i, f"{category} Product {i}", category, price])
products_df = pd.DataFrame(products, columns=["ProductID", "ProductName", "Category", "Price"])

# Generate Orders and Order Details
orders = []
order_details = []
order_id = 1
for _ in range(NUM_ORDERS):
    customer_id = random.randint(1, NUM_CUSTOMERS)
    order_date = fake.date_between(start_date='-2y', end_date='today')
    region = random.choice(regions)
    payment_method = random.choice(payment_methods)

    orders.append([order_id, customer_id, order_date, region, payment_method])

    # Each order has 1-5 products
    for _ in range(random.randint(1, 5)):
        product_id = random.randint(1, NUM_PRODUCTS)
        quantity = random.randint(1, 3)
        price = float(products_df.loc[products_df['ProductID'] == product_id, 'Price'])
        revenue = round(price * quantity, 2)
        profit_margin = round(revenue * random.uniform(0.1, 0.3), 2)
        order_details.append([order_id, product_id, quantity, price, revenue, profit_margin])
    order_id += 1

orders_df = pd.DataFrame(orders, columns=["OrderID", "CustomerID", "OrderDate", "Region", "PaymentMethod"])
order_details_df = pd.DataFrame(order_details, columns=["OrderID", "ProductID", "Quantity", "Price", "Revenue", "ProfitMargin"])

# Save to CSV
customers_df.to_csv("customers.csv", index=False)
products_df.to_csv("products.csv", index=False)
orders_df.to_csv("orders.csv", index=False)
order_details_df.to_csv("order_details.csv", index=False)

print("✅ Amazon dataset generated successfully!")
print("Files: customers.csv, products.csv, orders.csv, order_details.csv")
