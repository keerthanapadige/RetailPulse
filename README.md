# RetailPulse – End-to-End Retail Analytics Pipeline

## 📌 Overview

RetailPulse is an end-to-end data analytics project that simulates a real-world retail business pipeline.

It covers the full lifecycle:

* Data generation using Python
* Data storage in PostgreSQL
* Business analysis using SQL
* Visualization using Power BI

---

## 🏗️ Architecture

```
Python (Data Generation)
        ↓
CSV Files (Staging)
        ↓
PostgreSQL (Data Warehouse)
        ↓
SQL (Business Analysis)
        ↓
Power BI (Dashboard & Insights)
```

---

## 🛠️ Tech Stack

* Python (Pandas, NumPy, Faker)
* PostgreSQL
* SQL
* Power BI
* Git & GitHub

---

## 🚀 Features

* Generated synthetic retail dataset (customers, products, transactions)
* Built ETL pipeline to load data into PostgreSQL
* Designed relational schema
* Performed SQL-based business analysis
* Built interactive Power BI dashboard

---

## 📊 Dashboard

![Dashboard](images/dashboard_overview.png)

---

## 📈 Key Insights

* Revenue trends fluctuate across months
* Electronics category contributes the highest revenue (~51%)
* Certain cities dominate overall sales performance
* Customer spending is highly concentrated among top users (high CLTV)

---

## 📂 Project Structure

```
RetailPulse/
 ├── python/
 │    ├── generate_data.py
 │    ├── load_to_db.py
 ├── sql/
 │    ├── business_analysis.sql
 ├── images/
 │    ├── dashboard_overview.png
 ├── README.md
 ├── .gitignore
```

---

## ▶️ How to Run

1. Generate data:

```
python python/generate_data.py
```

2. Load data into PostgreSQL:

```
python python/load_to_db.py
```

3. Run SQL queries:

* Open `sql/business_analysis.sql` in PostgreSQL

4. Open Power BI dashboard:

* Load `.pbix` file (if included)

---

## 🎯 Outcome

This project demonstrates the ability to build a complete data pipeline and derive actionable business insights.
