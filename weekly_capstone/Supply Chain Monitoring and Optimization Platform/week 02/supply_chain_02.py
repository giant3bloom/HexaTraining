import pandas as pd
import numpy as np
import requests

# -----------------------------
# STEP 1: Collect Data
# -----------------------------

def local_df_creation():
    data = [
        {
            "order_id": 101,
            "supplier_id": 1,
            "order_date": "2025-01-01",
            "delivery_date": "2025-01-05",
            "stock_level": 150
        },
        {
            "order_id": 102,
            "supplier_id": 2,
            "order_date": "2025-01-03",
            "delivery_date": "2025-01-10",
            "stock_level": 75
        },
        {
            "order_id": 103,
            "supplier_id": 1,
            "order_date": "2025-01-06",
            "delivery_date": None,
            "stock_level": 40
        },
        {
            "order_id": 104,
            "supplier_id": 3,
            "order_date": "2025-01-08",
            "delivery_date": "2025-01-15",
            "stock_level": np.nan
        }
    ]

    return pd.DataFrame(data)

# Option A: Fetch from API
try:
    url = "https://jsonplaceholder.typicode.com/users"
    response = requests.get(url)
    data = response.json()

    df = pd.DataFrame(data)
    print(df.columns)
    print(df.head())

except Exception as e:
    print("API unavailable. Loading local data...")
    # Option B: Local Sample Data
    df = local_df_creation()
    

#override
df = local_df_creation()
# -----------------------------
# STEP 2: Data Cleaning
# -----------------------------

# Remove rows with missing delivery dates
df = df.dropna(subset=['delivery_date'])

# Fill missing stock levels
df['stock_level'] = df['stock_level'].fillna(0)

# Convert dates to datetime format
df['order_date'] = pd.to_datetime(df['order_date'])
df['delivery_date'] = pd.to_datetime(df['delivery_date'])

# -----------------------------
# STEP 3: Data Processing
# -----------------------------

# Calculate delivery duration
df['delivery_days'] = (
    df['delivery_date'] - df['order_date']
).dt.days

# Calculate stock status
df['stock_status'] = np.where(
    df['stock_level'] < 100,
    'Low Stock',
    'Sufficient'
)

# Check delayed deliveries
df['delay_days'] = (
    pd.Timestamp.today() - df['delivery_date']
).dt.days

df['is_delayed'] = np.where(
    df['delay_days'] > 0,
    1,
    0
)

# -----------------------------
# STEP 4: Display Results
# -----------------------------

print("\nProcessed Supply Chain Data:\n")

print(
    df[
        [
            'order_id',
            'supplier_id',
            'delivery_days',
            'stock_level',
            'stock_status',
            'delay_days',
            'is_delayed'
        ]
    ]
)