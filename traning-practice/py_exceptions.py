
# ==========================================
# EXERCISE
# ==========================================

# Highest Salary

high_sal = float('-inf')

for employee in employees:

    if employee["salary"] > high_sal:

        high_sal = employee["salary"]

print(high_sal)

# ==========================================
# Average Salary
# ==========================================

total = 0
emp_count = 0

for employee in employees:

    total += employee["salary"]
    emp_count += 1

print(total / emp_count)

# ==========================================
# Display Data Engineering Employees
# ==========================================

for employee in employees:

    if employee["department"] == "Data Engineering":

        print(employee["name"])

# ==========================================
# Display Employees Earning More Than 80000
# ==========================================

for employee in employees:

    if employee["salary"] > 80000:

        print(employee["name"])

# ==========================================
# Update Salary
# ==========================================

for employee in employees:

    if employee["employee_id"] == 101:

        employee["salary"] = 90000

        print("Salary Updated Successfully")
        print(employee)

# ==========================================
# Add New Employee
# ==========================================

new_employee = {

    "employee_id": 106,
    "name": "Kiran Rao",
    "department": "Data Engineering",
    "salary": 88000,
    "city": "Pune"

}

employees.append(new_employee)

print(employees)

# ==========================================
# Delete Employee
# ==========================================

for employee in employees:

    if employee["employee_id"] == 103:

        employees.remove(employee)
        break

print(employees)

# ==========================================
# CSV OPERATIONS
# ==========================================

import csv

# Display all rows

with open(r"C:\hex-t\HexaTraining\dataset\employees.csv") as file:

    reader = csv.reader(file)

    next(reader)

    for row in reader:

        print(row)

# ==========================================
# Display Employee Names
# ==========================================

with open(r"C:\hex-t\HexaTraining\dataset\employees.csv") as file:

    reader = csv.reader(file)

    next(reader)

    for row in reader:

        print(row[1])

# ==========================================
# Count Employees
# ==========================================

count = 0

with open(r"C:\hex-t\HexaTraining\dataset\employees.csv", "r") as file:

    reader = csv.reader(file)

    next(reader)

    for row in reader:

        count += 1

print(count)

# ==========================================
# Find Highest Salary
# ==========================================

highest_salary = float('-inf')

with open(r"C:\hex-t\HexaTraining\dataset\employees.csv", "r") as file:

    reader = csv.reader(file)

    next(reader)

    for row in reader:

        salary = int(row[3])

        if salary > highest_salary:

            highest_salary = salary

print("Highest Salary:", highest_salary)

# ==========================================
# Lowest Salary
# ==========================================

lowest_salary = float('inf')

with open(r"C:\hex-t\HexaTraining\dataset\employees.csv", "r") as file:

    reader = csv.reader(file)

    next(reader)

    for row in reader:

        salary = int(row[3])

        if salary < lowest_salary:

            lowest_salary = salary

print("Lowest Salary:", lowest_salary)

# ==========================================
# Average Salary
# ==========================================

total = 0
count = 0

with open(r"C:\hex-t\HexaTraining\dataset\employees.csv", "r") as file:

    reader = csv.reader(file)

    next(reader)

    for row in reader:

        total += int(row[3])
        count += 1

average = total / count

print("Average Salary:", average)

# ==========================================
# Total Salary Payout
# ==========================================

total = 0

with open(r"C:\hex-t\HexaTraining\dataset\employees.csv", "r") as file:

    reader = csv.reader(file)

    next(reader)

    for row in reader:

        total += int(row[3])

print("Total Salary Payout:", total)

# ==========================================
# Display Employees from Hyderabad
# ==========================================

with open(r"C:\hex-t\HexaTraining\dataset\employees.csv", "r") as file:

    reader = csv.reader(file)

    next(reader)

    for row in reader:

        if row[4] == "Hyderabad":

            print(row)

# ==========================================
# Display AI Engineers
# ==========================================

with open(r"C:\hex-t\HexaTraining\dataset\employees.csv", "r") as file:

    reader = csv.reader(file)

    next(reader)

    for row in reader:

        if row[2] == "AI Engineering":

            print(row)

# ==========================================
# Salary Above 80000
# ==========================================

with open(r"C:\hex-t\HexaTraining\dataset\employees.csv", "r") as file:

    reader = csv.reader(file)

    next(reader)

    for row in reader:

        if int(row[3]) > 80000:

            print(row)

# ==========================================
# NUMPY
# ==========================================

import numpy as np

arr = np.array([10, 20, 30, 40, 50])

print(arr)

print(arr + 5)

print(arr * 2)

print(np.sum(arr))

print(np.mean(arr))

print(np.max(arr))

print(np.min(arr))

print(np.shape(arr))

print(np.unique(arr))

print(arr.shape)

# ==========================================
# 2D ARRAY
# ==========================================

arr = np.array([[10, 20, 30], [40, 50, 60]])

print(arr)

# Zeros Array

arr = np.zeros((3, 4))

print(arr)

# Ones Array

arr = np.ones((2, 3))

print(arr)

# Range Array

arr = np.arange(1, 11)

print(arr)

# ==========================================
# PANDAS
# ==========================================

import pandas as pd

data = {

    "employee_id": [101, 102, 103],

    "name": [
        "Rahul",
        "Priya",
        "Amit"
    ],

    "salary": [
        75000,
        85000,
        65000
    ]
}

df = pd.DataFrame(data)

print(df)

print(df.head())

print(df.tail())

# ==========================================
# READ CSV USING PANDAS
# ==========================================

df = pd.read_csv(
    r"C:\hex-t\HexaTraining\dataset\employees.csv"
)

print(df.head())

print(df.tail())

print(df.dtypes)

print(df.info())

print(df.describe())

print(df["name"])

print(df[["name", "salary"]])
