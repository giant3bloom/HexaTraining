-- =========================
-- Database Creation
-- Description: This database is designed to manage hospital operations.
-- =========================
create database hospital_capstone_db;
use hospital_capstone_db;

-- =========================
-- Table Creation
-- =========================
create table patients(
	patient_id int primary key,
    patient_name varchar(100),
    gender varchar(10),
    age int,
    city varchar(50),
    phone varchar(15)
);

create table departments(
	department_id int primary key,
    department_name varchar(100)
);

create table doctors(
	doctor_id int primary key,
    doctor_name varchar(100),
    specialization varchar(100),
    department_id int,
    consultation_fee decimal(10,2)
);

create table appointments(
	appointment_id int primary key,
    patient_id int,
    doctor_id int,
    appointment_date date,
    appointment_status varchar(30)
);

create table treatments(
	treatment_id int primary key,
    appointment_id int,
    treatment_name varchar(100),
    treatment_cost decimal(10, 2)
);

create table bills(
	bill_id int primary key,
    patient_id int, 
    appointment_id int,
    bill_date date,
    total_amount decimal(10, 2),
    bill_status varchar(30)
);

create table payments(
	payment_id int primary key,
    bill_id int,
    payment_mode varchar(30),
    paid_amount decimal(10, 2),
    payment_status varchar(30)
);

-- =========================
-- Patients
-- =========================
insert into patients values
    (1, 'Arun Kumar', 'Male', 28, 'Chennai', '9876543210'),
    (2, 'Divya Sharma', 'Female', 34, 'Coimbatore', '9876543211'),
    (3, 'Rahul Verma', 'Male', 45, 'Madurai', '9876543212'),
    (4, 'Sneha Iyer', 'Female', 29, 'Salem', '9876543213'),
    (5, 'Karthik Raj', 'Male', 38, 'Trichy', '9876543214'),
    (6, 'Priya Nair', 'Female', 26, 'Erode', '9876543215'),
    (7, 'Vikram Singh', 'Male', 50, 'Chennai', '9876543216'),
    (8, 'Ananya Das', 'Female', 31, 'Vellore', '9876543217'),
    (9, 'Suresh Babu', 'Male', 41, 'Tirunelveli', '9876543218'),
    (10, 'Meena Lakshmi', 'Female', 36, 'Thoothukudi', '9876543219'),
    (11, 'Rohit Jain', 'Male', 27, 'Karur', '9876543220'),
    (12, 'Keerthana M', 'Female', 24, 'Namakkal', '9876543221');

-- =========================
-- Departments
-- =========================
insert into departments values
    (101, 'Cardiology'),
    (102, 'Neurology'),
    (103, 'Orthopedics'),
    (104, 'Dermatology'),
    (105, 'Pediatrics');

-- =========================
-- Doctors
-- =========================
insert into doctors values
    (201, 'Dr. Ravi Kumar', 'Cardiologist', 101, 800.00),
    (202, 'Dr. Meera Joshi', 'Neurologist', 102, 900.00),
    (203, 'Dr. Sanjay Rao', 'Orthopedic Surgeon', 103, 750.00),
    (204, 'Dr. Priyanka Menon', 'Dermatologist', 104, 600.00),
    (205, 'Dr. Ashok Patel', 'Pediatrician', 105, 500.00),
    (206, 'Dr. Harish N', 'Cardiologist', 101, 850.00),
    (207, 'Dr. Lavanya S', 'Neurologist', 102, 950.00),
    (208, 'Dr. Deepak Sharma', 'Orthopedic Surgeon', 103, 700.00);

-- =========================
-- Appointments
-- =========================
insert into appointments values
    (301, 1, 201, '2026-05-01', 'Completed'),
    (302, 2, 202, '2026-05-02', 'Completed'),
    (303, 3, 203, '2026-05-03', 'Completed'),
    (304, 4, 204, '2026-05-03', 'Pending'),
    (305, 5, 205, '2026-05-04', 'Completed'),
    (306, 6, 206, '2026-05-04', 'Cancelled'),
    (307, 7, 207, '2026-05-05', 'Completed'),
    (308, 8, 208, '2026-05-05', 'Completed'),
    (309, 9, 201, '2026-05-06', 'Pending'),
    (310, 10, 202, '2026-05-06', 'Completed'),
    (311, 11, 203, '2026-05-07', 'Completed'),
    (312, 12, 204, '2026-05-07', 'Completed'),
    (313, 1, 205, '2026-05-08', 'Completed'),
    (314, 2, 206, '2026-05-08', 'Pending'),
    (315, 3, 207, '2026-05-09', 'Completed'),
    (316, 4, 208, '2026-05-09', 'Cancelled'),
    (317, 5, 201, '2026-05-10', 'Completed'),
    (318, 6, 202, '2026-05-10', 'Completed'),
    (319, 7, 203, '2026-05-11', 'Pending'),
    (320, 8, 204, '2026-05-11', 'Completed');

-- =========================
-- Treatements
-- =========================
insert into treatments values
    (401, 301, 'ECG Test', 1500.00),
    (402, 302, 'Brain MRI', 4500.00),
    (403, 303, 'Knee Surgery', 12000.00),
    (404, 305, 'Child Vaccination', 2000.00),
    (405, 307, 'Neuro Therapy', 3500.00),
    (406, 308, 'Bone Fracture Fixing', 8000.00),
    (407, 310, 'Migraine Treatment', 2500.00),
    (408, 311, 'Joint Replacement', 15000.00),
    (409, 312, 'Skin Allergy Treatment', 1800.00),
    (410, 313, 'General Checkup', 1000.00),
    (411, 315, 'Spine Scan', 5000.00),
    (412, 317, 'Heart Surgery', 25000.00),
    (413, 318, 'Brain CT Scan', 4000.00),
    (414, 320, 'Acne Treatment', 2200.00),
    (415, 301, 'Blood Test', 700.00);

-- =========================
-- Bills
-- =========================
insert into bills values
    (501, 1, 301, '2026-05-01', 2200.00, 'Paid'),
    (502, 2, 302, '2026-05-02', 5400.00, 'Paid'),
    (503, 3, 303, '2026-05-03', 12750.00, 'Pending'),
    (504, 5, 305, '2026-05-04', 2500.00, 'Paid'),
    (505, 7, 307, '2026-05-05', 4400.00, 'Paid'),
    (506, 8, 308, '2026-05-05', 8700.00, 'Paid'),
    (507, 10, 310, '2026-05-06', 3400.00, 'Pending'),
    (508, 11, 311, '2026-05-07', 15750.00, 'Paid'),
    (509, 12, 312, '2026-05-07', 2400.00, 'Paid'),
    (510, 1, 313, '2026-05-08', 1500.00, 'Paid'),
    (511, 3, 315, '2026-05-09', 5900.00, 'Pending'),
    (512, 5, 317, '2026-05-10', 25800.00, 'Paid'),
    (513, 6, 318, '2026-05-10', 4900.00, 'Paid'),
    (514, 8, 320, '2026-05-11', 2800.00, 'Pending'),
    (515, 9, 309, '2026-05-12', 1800.00, 'Paid');

-- =========================
-- Payments
-- =========================
insert into payments values
    (601, 501, 'UPI', 2200.00, 'Completed'),
    (602, 502, 'Credit Card', 5400.00, 'Completed'),
    (603, 503, 'Cash', 5000.00, 'Partial'),
    (604, 504, 'Debit Card', 2500.00, 'Completed'),
    (605, 505, 'UPI', 4400.00, 'Completed'),
    (606, 506, 'Net Banking', 8700.00, 'Completed'),
    (607, 507, 'Cash', 1500.00, 'Partial'),
    (608, 508, 'Credit Card', 15750.00, 'Completed'),
    (609, 509, 'UPI', 2400.00, 'Completed'),
    (610, 510, 'Cash', 1500.00, 'Completed'),
    (611, 511, 'Debit Card', 3000.00, 'Partial'),
    (612, 512, 'Net Banking', 25800.00, 'Completed'),
    (613, 513, 'UPI', 4900.00, 'Completed'),
    (614, 514, 'Cash', 1000.00, 'Partial'),
    (615, 515, 'Credit Card', 1800.00, 'Completed');

-- =========================
-- Basic Queries
-- =========================
select * from patients;
select * from doctors;
select * from patients
where city = 'Hyderabad';
select * from doctors
where specialization = 'Cardiologist';
select * from appointments
where appointment_date > '2026-01-01';
select * from appointments
where appointment_status = 'Cancelled';
select * from bills
where total_amount > 5000.00;
select * from payments 
where payment_mode = 'UPI';
select * from patients 
where age between 30 and 50;
select * from doctors 
where consultation_fee > 800;

-- =========================
-- Aggregate Queries
-- =========================
select count(*) as total_patients from patients;
select count(*) as total_doctors from doctors;
select count(*) as total_appointments from appointments;
select avg(consultation_fee) as avg_consultation_fee from doctors;
select max(treatment_cost) as max_treatment_cost from treatments;
select sum(total_amount) as total_billing from bills;
select sum(paid_amount) as total_payments from payments;
select city, count(patient_id) as patient_count from patients 
group by city;
select specialization, count(doctor_id) as doctor_count from doctors
group by specialization;
select appointment_status, count(appointment_id) as status_count from appointments
group by appointment_status;

-- =========================
-- Join Queries
-- =========================
select p.patient_name, a.appointment_date, a.appointment_status from patients p
    join appointments a on p.patient_id = a.patient_id;
select d.doctor_name, dept.department_name from doctors d 
    join departments dept on d.department_id = dept.department_id;
select p.patient_name, d.doctor_name, a.appointment_date from patients p
    join appointments a on p.patient_id = a.patient_id
    join doctors d on a.doctor_id = d.doctor_id;
select a.appointment_id, t.treatment_name, t.treatment_cost from appointments a 
    join treatments t on a.appointment_id = t.appointment_id;
select b.bill_id, p.patient_name, b.total_amount from bills b
    join patients p on b.patient_id = p.patient_id;
select b.bill_id, py.payment_mode, py.paid_amount, py.payment_status from bills b 
    join payments py on b.bill_id = py.bill_id;
select b.bill_id, p.patient_name, b.total_amount from bills b
    join patients p on b.patient_id = p.patient_id;

select 
    p.patient_name, d.doctor_name, dept.department_name,
    a.appointment_date, a.appointment_status, t.treatment_name,
    t.treatment_cost, b.total_amount, py.payment_status
    from patients p
    join appointments a on p.patient_id = a.patient_id
    join doctors d on a.doctor_id = d.doctor_id
    join departments dept on d.department_id = dept.department_id
    join treatments t on a.appointment_id = t.appointment_id
    join bills b on a.appointment_id = b.appointment_id
    join payments py on b.bill_id = py.bill_id;

-- =========================
-- Group By and Having
-- =========================
select doctor_id, count(appointment_id) as total_appointments from appointments 
group by doctor_id;
select d.department_id, count(a.appointment_id) as total_appointments from doctors d
join appointments a on d.doctor_id = a.doctor_id
group by d.department_id;
select d.department_id, sum(b.total_amount) as total_revenue from appointments a
    join doctors d on a.doctor_id = d.doctor_id
    join bills b on a.appointment_id = b.appointment_id
group by d.department_id;
select t.treatment_name, sum(t.treatment_cost) as total_treatment_cost from treatments t 
group by t.treatment_name;
select p.city, sum(b.total_amount) as total_billing from patients p
    join bills b on p.patient_id = b.patient_id
group by p.city;
select d.doctor_name from doctors d 
    join appointments a on d.doctor_id = a.doctor_id
group by d.doctor_name
having count(a.appointment_id) > 2;
select dept.department_name from departments dept
    join doctors d on dept.department_id = d.department_id
    join appointments a on d.doctor_id = a.doctor_id
    join bills b on a.appointment_id = b.appointment_id
group by dept.department_name
having sum(b.total_amount) > 20000;
select p.city from patients p
group by p.city
having count(patient_id) > 2;

-- =========================
-- Subqueries
-- =========================
select p.patient_name from patients p
where p.patient_id in (
    select distinct a.patient_id from appointments a
);
select p.patient_name from patients p
where p.patient_id not in (
    select distinct a.patient_id from appointments a
);
select d.doctor_name from doctors d
where d.doctor_id not in (
    select distinct a.doctor_id from appointments a 
);
select b.bill_id from bills b
where b.total_amount > (
    select avg(total_amount) from bills
);
select p.patient_name from patients p
    join bills b on p.patient_id = b.patient_id
where b.total_amount = (
    select max(total_amount) from bills
);
select d.doctor_name from doctors d
where d.consultation_fee > (
    select avg(consultation_fee) from doctors
);
select p.patient_name from patients p
    join appointments a on p.patient_id = a.patient_id
    join doctors d on a.doctor_id = d.doctor_id
where d.specialization = 'Cardiologist' and a.appointment_status = 'Completed';
select b.bill_id from bills b
    join payments py on b.bill_id = py.bill_id
where py.payment_status = 'Partial';
select a.appointment_id from appointments a 
where a.appointment_id in (
    select distinct appointment_id from treatments
);
select p.patient_name from patients p
where p.patient_id in (
    select patient_id from bills
    where total_amount > (select avg(total_amount) from bills)
);

-- =========================
-- Data quality checks
-- =========================
select * from appointments 
where appointment_id not in (
    select appointment_id from treatments
);
select * from bills 
where bill_id not in (
    select bill_id from payments
);
select * from payments
where paid_amount = 0 or paid_amount is null;
select * from appointments a 
where a.appointment_status = 'Cancelled' 
and a.appointment_id in (
    select appointment_id from bills
);
select * from bills b
where b.bill_status = 'Paid' 
and b.total_amount > (
    select paid_amount from payments py
    where py.bill_id = b.bill_id
);
select * from doctors d 
where d.department_id not in (
    select distinct department_id from departments
);
select * from appointments a 
where a.patient_id not in (
    select distinct patient_id from patients
) or a.doctor_id not in (
    select distinct doctor_id from doctors 
);

-- =========================
-- Final report query
-- =========================
select 
    p.patient_name,
    p.city,
    count(distinct a.appointment_id) as total_appointments,
    sum(b.total_amount) as total_bill_amount,
    sum(py.paid_amount) as total_paid_amount,
    (sum(b.total_amount) - sum(py.paid_amount)) as pending_amount
from patients p
    join appointments a on p.patient_id = a.patient_id
    join bills b on a.appointment_id = b.appointment_id
    join payments py on b.bill_id = py.bill_id
group by p.patient_name, p.city;