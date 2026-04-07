import pandas as pd
from sqlalchemy import create_engine

# connection string
engine = create_engine("postgresql://postgres:Admin%40123@localhost:5432/retailpulse")

# load CSV files
customers_df = pd.read_csv("python/data/customers.csv")
products_df = pd.read_csv("python/data/products.csv")
transactions_df = pd.read_csv("python/data/transactions.csv")

# load into database
customers_df.to_sql("customers", engine, if_exists="append", index=False)
products_df.to_sql("products", engine, if_exists="append", index=False)
transactions_df.to_sql("transactions", engine, if_exists="append", index=False)

print("Data loaded into Postgres successfully!")