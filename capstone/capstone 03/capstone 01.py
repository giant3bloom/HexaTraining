
import csv
from pandas import read_csv
import numpy as np

file_path = r'C:\hex-t\HexaTraining\capstone\capstone 03\dataset\orders.csv'


with open(file_path, 'r') as f:

    read = csv.reader(f)

    for i in read:
        print(i)

    count = sum([1 for _ in read]) - 1 
    print('total count: ', count)

    #can also use next() but yap here i'm
    revenue = 0
    for row in read:
        try:
            revenue += (int(row[5]) * int(row[6]))
        except: continue
    print('total revenue: ', revenue)

    #can also use next() but yap here i'm
    highest_order_value = 0
    for row in read:
        try:
            highest_order_value = max(highest_order_value, (int(row[5]) * int(row[6])))
        except: continue
    print('max val: ', highest_order_value)

    #can also use next() but yap here i'm
    highest_order_value = float('inf')
    for row in read:
        try:
            highest_order_value = min(highest_order_value, (int(row[5]) * int(row[6])))
        except: continue
    print('min val: ', highest_order_value)

    lst = []
    for row in read:
        try: 
            lst.append(int(row[5])*int(row[6]))
        except: continue
    print('avg_val: ', sum(lst)/len(lst))

    #first ele in lst : type of data that lst contains
    lst = []
    for row in read:
        if row[1] in lst:
            continue
        else:
            lst.append(row[1])
    print(lst)

    #first ele in lst : type of data that lst contains
    lst = []
    for row in read:
        if row[1] in lst:
            continue
        else:
            lst.append(row[1])
    print('customer_count: ', len(lst)-1)

    hig_price_val_cus = ''
    hig_price_val = 0
    for row in read:
        try: val = int(row[5]) * int(row[6])
        except: continue
        if hig_price_val < val:
            hig_price_val = val
            hig_price_val_cus = row[1]
    print('high_price_value_customer: ', hig_price_val_cus)

    from pprint import pprint 
    dit = {}
    for row in read:
        dit[row[3]] = dit.get(row[3], 0) + 1
    pprint(dit)

    from pprint import pprint 
    dit = {}
    for row in read:
        try: val = int(row[5]) * int(row[6])
        except: continue
        dit[row[3]] = dit.get(row[3], 0) + val
    print('product revenue: ')
    pprint(dit)

    from pprint import pprint
    dit = {}
    for row in read:
        dit[row[3]] = dit.get(row[3], 0) + 1
    
    max_k = ''
    max_v = 0
    for (k,v) in dit.items():
        if max_v < v:
            max_v = v
            max_k = k
    print('most sold product: ', max_k)
    pprint(dit)

    from pprint import pprint
    dit = {}
    for row in read:
        dit[row[3]] = dit.get(row[3], 0) + 1
    
    del dit['product']
    min_k = ''
    min_v = float('inf')
    for (k,v) in dit.items():
        if min_v > v:
            min_v = v
            min_k = k
    print('least sold product: ', min_k)

    dit = {}
    for row in read:
        try: val = int(row[5]) * int(row[6])
        except: continue

        dit[row[4]] = dit.get(row[4], 0) + val

    for k,v in dit.items():
        print('revenue', k, ":", v)


from pandas import read_csv
df = read_csv(file_path)
df.columns = df.columns.str.strip()
df['revenue'] = df['quantity'] * df['price']

print(df.groupby('city').size())
print(df.groupby('city')['revenue'].mean())
print(df.groupby('city')['revenue'].max().idxmax())

lst = df['product'].unique()
print(sorted(lst))

st = set(df['city'].unique())
print(st)

dit_01 = {
    'city': 'revenue'
}
dit_02 = {
    'product': 'quantity_sold'
}

def calculate_total_revenue():
    return df['revenue'].sum()

def find_top_product():
    return df.groupby('product')['revenue'].sum().idxmax()

def find_top_city():
    return df.groupby('city')['revenue'].sum().idxmax()

def find_average_order_value():
    return df['revenue'].mean()

try:
    df = read_csv(file_path)

    df.columns = df.columns.str.strip()

    try:
        df['quantity'] = df['quantity'].astype(int)
    except ValueError:
        print('Invalid quantity values found')

    try:
        df['price'] = df['price'].astype(int)
    except ValueError:
        print('Invalid price values found')

    df['revenue'] = df['quantity'] * df['price']

    print(df)

except FileNotFoundError:
    print('CSV file not found')

import numpy as np
mat = np.array(df['quantity'] * df['price'])

print('total revenue: ', mat.sum())
print('avg revenue: ', mat.mean())
print('max revenue: ', mat.max())
print('min revenue: ', mat.min())
print('standard deviation: ', mat.std())

import pandas as pd
df = pd.read_csv(file_path)
df.columns = df.columns.str.strip()

df['revenue'] = df['quantity'] * df['price']

print(df.nlargest(5, 'revenue'))
print(df.groupby('city')['revenue'].sum())
print(df.groupby('product')['revenue'].sum())
print(df.groupby('product')['quantity'].sum().nlargest(1))
print(df.groupby('city')['quantity'].size())

# report generation
import pandas as pd

df = pd.read_csv(file_path)

df.columns = df.columns.str.strip()

df['revenue'] = df['quantity'] * df['price']

total_orders = df['order_id'].size
total_revenue = df['revenue'].sum()
avg_order_val = df['revenue'].mean()
high_order_val = df['revenue'].max()
low_order_val = df['revenue'].min()

rev_city = df.groupby('city')['revenue'].sum()
rev_cat = df.groupby('category')['revenue'].sum()

top_sell_prod = df.groupby('product')['quantity'].sum().nlargest(1)
top_rev_city = df.groupby('city')['revenue'].sum().nlargest(1)

w_file = r'C:\hex-t\HexaTraining\capstone\capstone 03\generated_dataset\sales_summary_report.txt'

with open(w_file, 'w') as w_f:

    w_f.write(f'Total Orders: {total_orders}\n')
    w_f.write(f'Total Revenue: {total_revenue}\n')
    w_f.write(f'Average Order Value: {avg_order_val}\n')
    w_f.write(f'Highest Order Value: {high_order_val}\n')
    w_f.write(f'Lowest Order Value: {low_order_val}\n\n')

    w_f.write('Revenue By City:\n')
    w_f.write(rev_city.to_string())
    w_f.write('\n\n')

    w_f.write('Revenue By Category:\n')
    w_f.write(rev_cat.to_string())
    w_f.write('\n\n')

    w_f.write('Top Selling Product:\n')
    w_f.write(top_sell_prod.to_string())
    w_f.write('\n\n')

    w_f.write('Top Revenue City:\n')
    w_f.write(top_rev_city.to_string())

import pandas as pd 
df = pd.read_csv(file_path)
df.columns = df.columns.str.strip()
df['revenue'] = df['quantity'] * df['price']

w_path = r'C:\hex-t\HexaTraining\capstone\capstone 03\generated_dataset\high_value_orders.csv'

ans = df[df['revenue'] > 50000]

ans.to_csv(w_path, index = False)

import pandas as pd 
df = pd.read_csv(file_path)
df.columns = df.columns.str.strip()
df['revenue'] = df['quantity'] * df['price']

w_path = r'C:\hex-t\HexaTraining\capstone\capstone 03\generated_dataset\electronics_orders.csv'

ans = df[df['category'] == 'Electronics']

ans.to_csv(w_path, index = False)

import pandas as pd 
df = pd.read_csv(file_path)
df.columns = df.columns.str.strip()
df['revenue'] = df['quantity'] * df['price']

def report_generator(report_name):
    total_orders = df['order_id'].size
    total_revenue = df['revenue'].sum()
    avg_order_val = df['revenue'].mean()
    high_order_val = df['revenue'].max()
    low_order_val = df['revenue'].min()

    rev_city = df.groupby('city')['revenue'].sum()
    rev_cat = df.groupby('category')['revenue'].sum()

    top_sell_prod = df.groupby('product')['quantity'].sum().nlargest(1)
    top_rev_city = df.groupby('city')['revenue'].sum().nlargest(1)

    w_file = rf'C:\hex-t\HexaTraining\capstone\capstone 03\generated_dataset\{report_name}.txt'

    with open(w_file, 'w') as w_f:

        w_f.write(f'Total Orders: {total_orders}\n')
        w_f.write(f'Total Revenue: {total_revenue}\n')
        w_f.write(f'Average Order Value: {avg_order_val}\n')
        w_f.write(f'Highest Order Value: {high_order_val}\n')
        w_f.write(f'Lowest Order Value: {low_order_val}\n\n')

        w_f.write('Revenue By City:\n')
        w_f.write(rev_city.to_string())
        w_f.write('\n\n')

        w_f.write('Revenue By Category:\n')
        w_f.write(rev_cat.to_string())
        w_f.write('\n\n')

        w_f.write('Top Selling Product:\n')
        w_f.write(top_sell_prod.to_string())
        w_f.write('\n\n')

        w_f.write('Top Revenue City:\n')
        w_f.write(top_rev_city.to_string())

flag = True
while flag:
    print('1. View Orders')
    print('2. Revenue Analysis')
    print('3. Product Analysis')
    print('4. City Analysis')
    print('5. Export Reports')
    print('6. Exit')

    try: 
        choice = input('Enter your choice: ')
        match choice:
            case '1':
                print(df)
            case '2':
                print('mean revenue: ', df['revenue'].mean())
            case '3':
                print('product mean revenue: ', df.groupby('product')['revenue'].mean())
            case '4': 
                print('mean revenue by city: ', df.groupby('city')['revenue'].mean())
            case '5':
                f_name = input('Enter report name: ')
                report_generator(f_name)
                print('report generated!')
            case '6': 
                flag = False
                print('exit program')
            case _: print('invalid choice')    
    except Exception as e:
        print(e)



