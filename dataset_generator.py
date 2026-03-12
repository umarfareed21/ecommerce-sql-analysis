import pandas as pd
import random
from faker import Faker

fake = Faker()

# 1. Generate Customers

customers = []

cities = [
    "Delhi","Mumbai","Bangalore","Hyderabad","Chennai",
    "Kolkata","Pune","Ahmedabad","Lucknow","Jaipur"
]

for i in range(1,501):
    customers.append([
        i,
        fake.name(),
        fake.email(),
        random.choice(cities),
        fake.date_between(start_date='-3y', end_date='today')
    ])

customers_df = pd.DataFrame(customers, columns=[
    "customer_id","name","email","city","signup_date"
])


# 2. Generate Products

product_names = [
    "Laptop","Smartphone","Headphones","Keyboard","Mouse",
    "Monitor","Tablet","Smartwatch","Speaker","Camera"
]

products = []

for i in range(1,101):
    products.append([
        i,
        random.choice(product_names),
        random.choice(["Electronics","Accessories","Gadgets"]),
        random.randint(500,50000)
    ])

products_df = pd.DataFrame(products, columns=[
    "product_id","product_name","category","price"
])


# 3. Generate Orders

orders = []

for i in range(1,1001):
    orders.append([
        i,
        random.randint(1,500),
        fake.date_between(start_date='-1y', end_date='today'),
        random.choice(["Delivered","Cancelled","Shipped"])
    ])

orders_df = pd.DataFrame(orders, columns=[
    "order_id","customer_id","order_date","status"
])


# 4. Generate Order Items

order_items = []

for i in range(1,2001):
    order_items.append([
        i,
        random.randint(1,1000),
        random.randint(1,100),
        random.randint(1,5)
    ])

order_items_df = pd.DataFrame(order_items, columns=[
    "order_item_id","order_id","product_id","quantity"
])


# Save CSV Files

customers_df.to_csv("customers.csv",index=False)
products_df.to_csv("products.csv",index=False)
orders_df.to_csv("orders.csv",index=False)
order_items_df.to_csv("order_items.csv",index=False)

print("Dataset generated successfully ✅")