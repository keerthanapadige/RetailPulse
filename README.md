# RetailPulse – End-to-End Data Engineering Project

## Overview
This project simulates a real-world retail data pipeline.

## Architecture
Python → CSV → PostgreSQL → SQL → Power BI

## Tech Stack
- Python (Pandas, Faker)
- PostgreSQL
- SQL
- Power BI

## Features
- Data generation (customers, products, transactions)
- ETL pipeline using Python
- Data loading into PostgreSQL
- SQL analytics (revenue, customer behavior, trends)

## Key Insights
- Monthly revenue trends
- Top customers (CLTV)
- Category performance

## How to Run
1. Run generate_data.py
2. Run load_to_db.py
3. Execute SQL queries in PostgreSQL

## Dashboard

### Key Metrics
- Total Revenue: $10.8K
- Avg Order Value: $540
- Revenue per Customer: $1.35K

### Insights
- Revenue shows fluctuating trend over months
- Electronics category contributes highest revenue (~51%)
- Top cities drive majority of sales
- Customer spending varies significantly (high CLTV concentration)