import os

os.makedirs("python/data", exist_ok=True)
import pandas as pd
import numpy as np
from faker import Faker
import uuid

fake = Faker()

customers = []

for _ in range(10):
    customers.append({
        "customer_id": str(uuid.uuid4()),
        "name": fake.name(),
        "city": fake.city()
    })

customers_df = pd.DataFrame(customers)

print(customers_df.head())
products = []

for _ in range(5):
    products.append({
        "product_id": str(uuid.uuid4()),
        "product_name": fake.word(),
        "category": fake.random_element(elements=["Electronics", "Clothing", "Grocery"]),
        "price": round(np.random.uniform(10, 500), 2)
    })

products_df = pd.DataFrame(products)

print(products_df.head())
transactions = []

for _ in range(20):
    customer = customers_df.sample(1).iloc[0]
    product = products_df.sample(1).iloc[0]

    quantity = np.random.randint(1, 5)
    discount = round(np.random.uniform(0, 0.3), 2)

    total_amount = round(quantity * product["price"] * (1 - discount), 2)

    transactions.append({
        "transaction_id": str(uuid.uuid4()),
        "customer_id": customer["customer_id"],
        "product_id": product["product_id"],
        "quantity": quantity,
        "discount": discount,
        "total_amount": total_amount,
        "transaction_date": fake.date_between(start_date='-1y', end_date='today')
    })

transactions_df = pd.DataFrame(transactions)

print(transactions_df.head())
customers_df.to_csv("python/data/customers.csv", index=False)
products_df.to_csv("python/data/products.csv", index=False)
transactions_df.to_csv("python/data/transactions.csv", index=False)

print("Data saved successfully!")