
#Exercise
# #highest salary
# high_sal=0
# for employee in employees:
#     if employee["salary"] > high_sal:
#         high_sal=employee["salary"]
# print(high_sal)
#
# #Average Salary
# total=0
# emp_count = 0
# for employee in employees:
#     total+=employee["salary"]
#     emp_count+=1
# print(total/emp_count)
#
# #Display dataengineering employees
# for employee in employees:
#     if employee["department"] == "Data Engineering":
#         print(employee["name"])
#
# #Display employee earning more than 80000
# for employee in employees:
#     if employee["salary"] > 80000:
#         print(employee["name"])
#
# #Update Salary of one of employees
# for employee in employees:
#     if employee["employee_id"] == 101:
#         employee["salary"] = 90000
#         print("Salary Updated Successfully")
#         print(employee)
#
# #ADD new employee
# new_employee = {
#     "employee_id": 106,
#     "name": "Kiran Rao",
#     "department": "Data Engineering",
#     "salary": 88000,
#     "city": "Pune"
# }
# employees.append(new_employee)
# print(employees)
#
# #delete a employee
# for employee in employees:
#     if employee["employee_id"] == 103:
#         employees.remove(employee)
# print(employees)

# import csv
# with open("employees.csv") as file:
#     reader = csv.reader(file)
#     next(reader)
#     for row in reader:
#         print(row)

# with open("employees.csv") as file:
#     reader = csv.reader(file)
#     next(reader)
#     for row in reader:
#         print(row[1]) #display employee names
#
# #count employees
# count=0
# with open("employees.csv","r") as file:
#     reader = csv.reader(file)
#     next(reader)
#     for row in reader:
#         count+=1
# print(count)

#find highest salary
# import csv
#
# highest_salary = 0
#
# with open("employees.csv", "r") as file:
#     reader = csv.reader(file)
#     next(reader)
#
#     for row in reader:
#         salary = int(row[3])   # salary column
#         if salary > highest_salary:
#             highest_salary = salary
#
# print("Highest Salary:", highest_salary)
#
#
# #lowest salary
# import csv
#
# lowest_salary = float('inf')
#
# with open("employees.csv", "r") as file:
#     reader = csv.reader(file)
#     next(reader)
#
#     for row in reader:
#         salary = int(row[3])
#
#         if salary < lowest_salary:
#             lowest_salary = salary
#
# print("Lowest Salary:", lowest_salary)
#
# #average salary
# import csv
#
# total = 0
# count = 0
#
# with open("employees.csv", "r") as file:
#     reader = csv.reader(file)
#     next(reader)
#
#     for row in reader:
#         total += int(row[3])
#         count += 1
#
# average = total / count
#
# print("Average Salary:", average)
#
# #Find Total Salary Payout
# import csv
#
# total = 0
#
# with open("employees.csv", "r") as file:
#     reader = csv.reader(file)
#     next(reader)
#
#     for row in reader:
#         total += int(row[3])
#
# print("Total Salary Payout:", total)
#
# #Display employees from hyderabad
# import csv
#
# with open("employees.csv", "r") as file:
#     reader = csv.reader(file)
#     next(reader)
#
#     for row in reader:
#         if row[4] == "Hyderabad":
#             print(row)
#
# #Display Ai engineeers
# import csv
#
# with open("employees.csv", "r") as file:
#     reader = csv.reader(file)
#     next(reader)
#
#     for row in reader:
#         if row[2] == "AI Engineering":
#             print(row)
#
# #Salary above 80,000
# import csv
#
# with open("employees.csv", "r") as file:
#     reader = csv.reader(file)
#     next(reader)
#
#     for row in reader:
#         if int(row[3]) > 80000:
#             print(row)

#numpy pandas
# import numpy as np
#
# arr=np.array([10,20,30,40,50])
# print(arr)
#
# print(arr+5)
# print(arr*2)
#
# print(np.sum(arr))
# print(np.mean(arr))
# print(np.max(arr))
# print(np.min(arr))
# print(np.shape(arr))
# print(np.unique(arr))
# print(arr.shape)
#
# #2d array
# arr=np.array([[10,20,30],[40,50,60]])
# print(arr)
#
# arr=np.zeros((3,4))
# print(arr)
#
# arr=np.ones((2,3))
# print(arr)
#
# arr=np.arange(1,11)
# print(arr)

#pandas

# import pandas as pd
#
# data = {
#
#     "employee_id": [101,102,103],
#
#     "name": [
#         "Rahul",
#         "Priya",
#         "Amit"
#     ],
#
#     "salary": [
#         75000,
#         85000,
#         65000
#     ]
# }
# df=pd.DataFrame(data)
# print(df)
# print(df.head())
# print(df.tail())

# df=pd.read_csv("employees.csv")
# print(df.head())
# print(df.tail())
# print(df.dtypes)
# print(df.info())
# print(df.describe()) #statistics
# print(df["name"])
# print(
#     df[["name","salary"]]
# )
