--Create and Insert Table script

DROP TABLE Employee CASCADE CONSTRAINTS;
DROP TABLE Salaried_emp CASCADE CONSTRAINTS;
DROP TABLE Hourly_emp CASCADE CONSTRAINTS;
DROP TABLE Doctor CASCADE CONSTRAINTS;
DROP TABLE Nurse CASCADE CONSTRAINTS;
DROP TABLE Ancillary_worker CASCADE CONSTRAINTS;
DROP TABLE Porter CASCADE CONSTRAINTS;
DROP TABLE Cleaner CASCADE CONSTRAINTS;
DROP TABLE Appointment CASCADE CONSTRAINTS;
DROP TABLE Care_centre CASCADE CONSTRAINTS;
DROP TABLE Residential_wing CASCADE CONSTRAINTS;
DROP TABLE Room CASCADE CONSTRAINTS;
DROP TABLE Ward CASCADE CONSTRAINTS;
DROP TABLE Bed CASCADE CONSTRAINTS;
DROP TABLE Shift CASCADE CONSTRAINTS;
DROP TABLE Emp_shift CASCADE CONSTRAINTS;
DROP TABLE GP CASCADE CONSTRAINTS;
DROP TABLE Patient CASCADE CONSTRAINTS;
DROP TABLE InPatient CASCADE CONSTRAINTS;
DROP TABLE OutPatient CASCADE CONSTRAINTS;
DROP TABLE Waiting_list CASCADE CONSTRAINTS;
DROP TABLE Family CASCADE CONSTRAINTS;
DROP TABLE Discharge CASCADE CONSTRAINTS;
DROP TABLE Prescription CASCADE CONSTRAINTS;
DROP TABLE Agency CASCADE CONSTRAINTS;
DROP TABLE Medical_condition CASCADE CONSTRAINTS;
DROP TABLE Treatment CASCADE CONSTRAINTS;
DROP TABLE Drug CASCADE CONSTRAINTS;
DROP TABLE Test_session CASCADE CONSTRAINTS;

CREATE TABLE Employee (
emp_id INT PRIMARY KEY,
centre_id INT,
emp_name VARCHAR(255),
emp_address VARCHAR(255),
emp_contact INT
);
CREATE TABLE Salaried_emp (
emp_id INT PRIMARY KEY,
salary INT,
designation VARCHAR(255),
FOREIGN KEY (emp_id) REFERENCES Employee(emp_id)
);
CREATE TABLE Hourly_emp (
emp_id INT PRIMARY KEY,
hourly_wage VARCHAR(255),
FOREIGN KEY (emp_id) REFERENCES Employee(emp_id)
);
CREATE TABLE Doctor (
emp_id INT PRIMARY KEY,
doctor_specialization VARCHAR(255),
FOREIGN KEY (emp_id) REFERENCES Employee(emp_id)
);
CREATE TABLE Nurse (
emp_id INT PRIMARY KEY,
nurse_specialization VARCHAR(255),
FOREIGN KEY (emp_id) REFERENCES Employee(emp_id)
);
CREATE TABLE Ancillary_worker (
emp_id INT PRIMARY KEY,
ancillary_section VARCHAR(255),
FOREIGN KEY (emp_id) REFERENCES Employee(emp_id)
);
CREATE TABLE Porter (
emp_id INT PRIMARY KEY,
porter_section VARCHAR(255),
FOREIGN KEY (emp_id) REFERENCES Employee(emp_id)
);
CREATE TABLE Cleaner (
emp_id INT PRIMARY KEY,
cleaner_section VARCHAR(255),
FOREIGN KEY (emp_id) REFERENCES Employee(emp_id)
);
CREATE TABLE Appointment (
app_no INT PRIMARY KEY,
patient_no INT,
emp_id INT,
app_datetime TIMESTAMP,
FOREIGN KEY (emp_id) REFERENCES Employee(emp_id)
);
CREATE TABLE Care_centre (
centre_id INT PRIMARY KEY,
centre_name VARCHAR(255),
centre_address VARCHAR(255),
centre_contact INT
);
CREATE TABLE Residential_wing (
residential_id INT PRIMARY KEY,
centre_id INT,
FOREIGN KEY (centre_id) REFERENCES Care_centre(centre_id)
);
CREATE TABLE Room (
room_no INT PRIMARY KEY,
residential_id INT,
wait_id INT,
FOREIGN KEY (residential_id) REFERENCES Residential_wing(residential_id)
);
CREATE TABLE Ward (
ward_id INT PRIMARY KEY,
ward_name VARCHAR(255)
);
CREATE TABLE Bed (
bed_id INT PRIMARY KEY,
ward_id INT,
patient_no INT,
FOREIGN KEY (ward_id) REFERENCES Ward(ward_id)
);
CREATE TABLE Shift (
shift_id INT PRIMARY KEY,
shift_name VARCHAR(255)
);
CREATE TABLE Emp_shift (
emp_shift_id INT PRIMARY KEY,
emp_id INT,
shift_id INT,
shift_datetime TIMESTAMP,
FOREIGN KEY (emp_id) REFERENCES Employee(emp_id),
FOREIGN KEY (shift_id) REFERENCES Shift(shift_id)
);
CREATE TABLE GP (
gp_id INT PRIMARY KEY,
gp_name VARCHAR(255),
gp_contact INT,
gp_address VARCHAR(255)
);
CREATE TABLE Family (
family_id INT PRIMARY KEY,
discharge_id INT NOT NULL,
caretaker_name VARCHAR(50) NOT NULL,
caretaker_contact INT,
relationship VARCHAR(50) NOT NULL
);
CREATE TABLE Discharge (
discharge_id INT PRIMARY KEY,
discharge_date TIMESTAMP NOT NULL,
emp_id INT NOT NULL,
FOREIGN KEY (emp_id) REFERENCES Employee (emp_id)
);
CREATE TABLE Treatment (
treatment_id INT PRIMARY KEY,
treatment_type VARCHAR(50) NOT NULL,
treatment_details VARCHAR(255)
);
CREATE TABLE Prescription (
prescription_no INT PRIMARY KEY,
treatment_no INT NOT NULL,
date_start TIMESTAMP NOT NULL,
date_end TIMESTAMP NOT NULL,
comments VARCHAR(255),
period INT,
FOREIGN KEY (treatment_no) REFERENCES Treatment (treatment_id)
);
CREATE TABLE Agency (
agency_id INT PRIMARY KEY,
discharge_id INT NOT NULL,
agency_name VARCHAR(50) NOT NULL,
agency_address VARCHAR(100),
agency_contact INT,
FOREIGN KEY (discharge_id) REFERENCES Discharge (discharge_id)
);
CREATE TABLE Medical_condition (
medical_cond_id INT PRIMARY KEY,
treatment_id INT NOT NULL,
FOREIGN KEY (treatment_id) REFERENCES Treatment (treatment_id)
);
CREATE TABLE Drug (
drug_code INT PRIMARY KEY,
treatment_id INT NOT NULL,
drug_name VARCHAR(50) NOT NULL,
drug_manufacturer VARCHAR(50),
drug_start TIMESTAMP NOT NULL,
drug_end TIMESTAMP NOT NULL,
period INT,
FOREIGN KEY (treatment_id) REFERENCES Treatment (treatment_id)
);
CREATE TABLE Test_session (
test_session_id INT PRIMARY KEY,
treatment_id INT NOT NULL,
test_for VARCHAR(100) NOT NULL,
test_duration TIMESTAMP NOT NULL,
FOREIGN KEY (treatment_id) REFERENCES Treatment (treatment_id)
);
CREATE TABLE Patient (
patient_no INT PRIMARY KEY,
gp_id INT,
discharge_id INT,
centre_id INT,
ward_id INT,
patient_name VARCHAR(255),
patient_address VARCHAR(255),
patient_contact INT,
FOREIGN KEY (gp_id) REFERENCES GP(gp_id),
FOREIGN KEY (discharge_id) REFERENCES Discharge(discharge_id),
FOREIGN KEY (centre_id) REFERENCES Care_centre(centre_id),
FOREIGN KEY (ward_id) REFERENCES Ward(ward_id)
);
CREATE TABLE InPatient (
patient_no INT PRIMARY KEY,
period_of_stay INT
);
CREATE TABLE OutPatient (
patient_no INT PRIMARY KEY,
treatment_type VARCHAR(255)
);
CREATE TABLE Waiting_list (
wait_id INT PRIMARY KEY,
patient_no INT NOT NULL,
entry_datetime TIMESTAMP NOT NULL,
bed_priority VARCHAR(50)
);

--Insert data 
DROP SEQUENCE seq_care;
CREATE SEQUENCE seq_care START WITH 1 INCREMENT BY 1 MINVALUE 1 MAXVALUE 10000;
DROP SEQUENCE seq_emp;
CREATE SEQUENCE seq_emp START WITH 1 INCREMENT BY 1 MINVALUE 1 MAXVALUE 10000;
DROP SEQUENCE seq_appt;
CREATE SEQUENCE seq_appt START WITH 1 INCREMENT BY 1 MINVALUE 1 MAXVALUE 10000;
DROP SEQUENCE seq_res;
CREATE SEQUENCE seq_res START WITH 1 INCREMENT BY 1 MINVALUE 1 MAXVALUE 10000;
DROP SEQUENCE seq_wait;
CREATE SEQUENCE seq_wait START WITH 1 INCREMENT BY 1 MINVALUE 1 MAXVALUE 10000;
DROP SEQUENCE seq_room;
CREATE SEQUENCE seq_room START WITH 1 INCREMENT BY 1 MINVALUE 1 MAXVALUE 10000;
DROP SEQUENCE seq_ward;
CREATE SEQUENCE seq_ward START WITH 1 INCREMENT BY 1 MINVALUE 1 MAXVALUE 10000;
DROP SEQUENCE seq_shift;
CREATE SEQUENCE seq_shift START WITH 1 INCREMENT BY 1 MINVALUE 1 MAXVALUE 10000;
DROP SEQUENCE seq_empshift;
CREATE SEQUENCE seq_empshift START WITH 1 INCREMENT BY 1 MINVALUE 1 MAXVALUE 10000;
DROP SEQUENCE seq_patient;
CREATE SEQUENCE seq_patient START WITH 1 INCREMENT BY 1 MINVALUE 1 MAXVALUE 10000;
DROP SEQUENCE seq_gp;
CREATE SEQUENCE seq_gp START WITH 1 INCREMENT BY 1 MINVALUE 1 MAXVALUE 10000;
DROP SEQUENCE seq_family;
CREATE SEQUENCE seq_family START WITH 1 INCREMENT BY 1 MINVALUE 1 MAXVALUE 10000;
DROP SEQUENCE seq_dis;
CREATE SEQUENCE seq_dis START WITH 1 INCREMENT BY 1 MINVALUE 1 MAXVALUE 10000;
DROP SEQUENCE seq_treat;
CREATE SEQUENCE seq_treat START WITH 1 INCREMENT BY 1 MINVALUE 1 MAXVALUE 10000;
DROP SEQUENCE seq_pres;
CREATE SEQUENCE seq_pres START WITH 1 INCREMENT BY 1 MINVALUE 1 MAXVALUE 10000;
DROP SEQUENCE seq_agency;
CREATE SEQUENCE seq_agency START WITH 1 INCREMENT BY 1 MINVALUE 1 MAXVALUE 10000;
DROP SEQUENCE seq_med;
CREATE SEQUENCE seq_med START WITH 1 INCREMENT BY 1 MINVALUE 1 MAXVALUE 10000;
DROP SEQUENCE seq_drug;
CREATE SEQUENCE seq_drug START WITH 1 INCREMENT BY 1 MINVALUE 1 MAXVALUE 10000;
INSERT INTO Care_centre(centre_id, centre_name, centre_address, centre_contact)
VALUES (seq_care.NEXTVAL, 'MedStar Care', '12 Bedford Row, Camden, London, United Kingdom, WC1R
4ED','7102134455');
INSERT INTO Care_centre(centre_id, centre_name, centre_address, centre_contact)
VALUES (seq_care.NEXTVAL, 'Handy Health Care', 'Lincolns Inn Pavillion, Lincolns Inn Fields, London, England
United Kingdom, WC2A 3BP', '7788234531');
INSERT INTO Care_centre(centre_id, centre_name, centre_address, centre_contact)
VALUES (seq_care.NEXTVAL, 'Global Health', '8 Bell Yard, Westminster, London, United Kingdom, WC2A 2JR',
'7983210023');
SELECT * FROM Care_centre;
INSERT INTO Employee(emp_id, centre_id, emp_name, emp_address, emp_contact) VALUES
(seq_emp.NEXTVAL, 1, 'Dr. Charles', 'Enoteca Rabezzana, 62-63 Long Lane, London, England United Kingdom',
'7712938890');
INSERT INTO Employee(emp_id, centre_id, emp_name, emp_address, emp_contact) VALUES
(seq_emp.NEXTVAL, 1, 'Dr. Matthew', '32 St. Petersburgh Mews, Westminster, London, United Kingdom,W2 4LB',
'7812129234');
INSERT INTO Employee(emp_id, centre_id, emp_name, emp_address, emp_contact) VALUES
(seq_emp.NEXTVAL, 2, 'Mrs. Joshua', 'Cafe 54, 54 lincolns Inn Fields, London, England United Kingdom, WC2A
3NA','7109833287');
INSERT INTO Employee(emp_id, centre_id, emp_name, emp_address, emp_contact) VALUES
(seq_emp.NEXTVAL, 2, 'George Timothy', '4 Airlie Gardens, Kensington and Chelsea, London, United Kingdom,W8
7AJ', '7109028732');
INSERT INTO Employee(emp_id, centre_id, emp_name, emp_address, emp_contact) VALUES
(seq_emp.NEXTVAL, 2, 'Jeffrey Jacob', '30 Thanet Street, Camden, London, United Kingdom,WC1H 9QG',
'7718294102');
INSERT INTO Employee(emp_id, centre_id, emp_name, emp_address, emp_contact) VALUES
(seq_emp.NEXTVAL, 1, 'Mr. Jonathan', 'Enoteca 90, 62-63 Long Lane, London, England United Kingdom',
'7109291920');
INSERT INTO Employee(emp_id, centre_id, emp_name, emp_address, emp_contact) VALUES
(seq_emp.NEXTVAL, 1, 'Henry Noah', 'Enoteca Rabezzana, 62-63 Long Lane, London, England United Kingdom',
'7711902029');
INSERT INTO Employee(emp_id, centre_id, emp_name, emp_address, emp_contact) VALUES
(seq_emp.NEXTVAL, 2, 'Zachary Jacob', '30 Thanet Street, Camden, London, United Kingdom,WC1H 9QG',
'7718290102');
INSERT INTO Employee(emp_id, centre_id, emp_name, emp_address, emp_contact) VALUES
(seq_emp.NEXTVAL, 1, 'Mr. Kyle', 'Enoteca Carl, 62-63 Long Lane, London, England United Kingdom',
'7109291920');
INSERT INTO Employee(emp_id, centre_id, emp_name, emp_address, emp_contact) VALUES
(seq_emp.NEXTVAL, 1, 'Keith Roger', 'Enoteca Rabezzana, 62-63 Long Lane, London, England United Kingdom',
'7711902129');
INSERT INTO Employee(emp_id, centre_id, emp_name, emp_address, emp_contact) VALUES
(seq_emp.NEXTVAL, 2, 'Zachary Jacob', '30 Thanet Street, Camden, London, United Kingdom,WC1H 9QG',
'7718290102');
INSERT INTO Employee(emp_id, centre_id, emp_name, emp_address, emp_contact) VALUES
(seq_emp.NEXTVAL, 1, 'Gerald Harold', '4 Airlie Rabezzana, 62-63 Long Lane, London, England United Kingdom',
'71092322920');
INSERT INTO Employee(emp_id, centre_id, emp_name, emp_address, emp_contact) VALUES
(seq_emp.NEXTVAL, 1, 'Austin Carl', '32 St. Enoteca , 62-63 Long Lane, London, England United Kingdom',
'7713202029');
SELECT * FROM Employee;
INSERT INTO Doctor(emp_id, doctor_specialization) VALUES (1, 'Cardiologist');
INSERT INTO Doctor(emp_id, doctor_specialization) VALUES (2, 'Oncologist');
INSERT INTO Doctor(emp_id, doctor_specialization) VALUES (3, 'General Physician');
SELECT * FROM Doctor;
INSERT INTO Nurse(emp_id, nurse_specialization) VALUES (4, 'Emergency Room');
INSERT INTO Nurse(emp_id, nurse_specialization) VALUES (5, 'Critical Care');
INSERT INTO Nurse(emp_id, nurse_specialization) VALUES (6, 'Medical Care');
SELECT * FROM Nurse;
INSERT INTO Salaried_emp(emp_id, salary, designation) VALUES (1, 50000, 'Doctor');
INSERT INTO Salaried_emp(emp_id, salary, designation) VALUES (2, 30000, 'Doctor');
INSERT INTO Salaried_emp(emp_id, salary, designation) VALUES (3, 25000, 'Doctor');
INSERT INTO Salaried_emp(emp_id, salary, designation) VALUES (4, 15000, 'Nurse');
INSERT INTO Salaried_emp(emp_id, salary, designation) VALUES (5, 15000, 'Nurse');
INSERT INTO Salaried_emp(emp_id, salary, designation) VALUES (6, 22000, 'Nurse');
SELECT * FROM Salaried_emp;
INSERT INTO Hourly_emp(emp_id, hourly_wage) VALUES (7, 200);
INSERT INTO Hourly_emp(emp_id, hourly_wage) VALUES (8, 150);
SELECT * FROM Hourly_emp;
INSERT INTO Ancillary_worker(emp_id, ancillary_section) VALUES (9, 'Kitchen');
INSERT INTO Ancillary_worker(emp_id, ancillary_section) VALUES (10, 'Housekeeping');
SELECT * FROM Ancillary_worker;
INSERT INTO Porter(emp_id, porter_section) VALUES (11, 'Transport');
INSERT INTO Porter(emp_id, porter_section) VALUES (12, 'Security');
SELECT * FROM Porter;
INSERT INTO Cleaner(emp_id, cleaner_section) VALUES (13, 'Sanitation');
SELECT * FROM Cleaner;
INSERT INTO Appointment(app_no, patient_no, emp_id, app_datetime) VALUES (seq_appt.NEXTVAL, 1, 1,
'24-MAR-2023 10:00:00 AM');
INSERT INTO Appointment(app_no, patient_no, emp_id, app_datetime) VALUES (seq_appt.NEXTVAL, 2, 3,
'2-Feb-2023 10:00:00 AM');
INSERT INTO Appointment(app_no, patient_no, emp_id, app_datetime) VALUES (seq_appt.NEXTVAL, 4, 2,
'11-Feb-2023 10:00:00 AM');
INSERT INTO Appointment(app_no, patient_no, emp_id, app_datetime) VALUES (seq_appt.NEXTVAL, 3, 1,
'04-MAR-2023 10:00:00 AM');
INSERT INTO Appointment(app_no, patient_no, emp_id, app_datetime) VALUES (seq_appt.NEXTVAL, 5, 2,
'28-Jan-2023 10:00:00 AM');
SELECT * FROM Appointment;
INSERT INTO Residential_wing(residential_id, centre_id) VALUES (seq_res.NEXTVAL, 1);
INSERT INTO Residential_wing(residential_id, centre_id) VALUES (seq_res.NEXTVAL, 1);
INSERT INTO Residential_wing(residential_id, centre_id) VALUES (seq_res.NEXTVAL, 2);
INSERT INTO Residential_wing(residential_id, centre_id) VALUES (seq_res.NEXTVAL, 2);
INSERT INTO Residential_wing(residential_id, centre_id) VALUES (seq_res.NEXTVAL, 1);
INSERT INTO Residential_wing(residential_id, centre_id) VALUES (seq_res.NEXTVAL, 2);
SELECT * FROM Residential_wing;
INSERT INTO Waiting_list (wait_id, patient_no, entry_datetime, bed_priority) VALUES (seq_wait.NEXTVAL, 3,
TIMESTAMP '2023-03-08 10:30:00', 'urgent');
INSERT INTO Waiting_list (wait_id, patient_no, entry_datetime, bed_priority) VALUES (seq_wait.NEXTVAL, 2,
TIMESTAMP '2023-01-29 10:30:00', 'normal');
INSERT INTO Waiting_list (wait_id, patient_no, entry_datetime, bed_priority) VALUES (seq_wait.NEXTVAL, 1,
TIMESTAMP '2023-01-02 10:30:00', 'normal');
INSERT INTO Waiting_list (wait_id, patient_no, entry_datetime, bed_priority) VALUES (seq_wait.NEXTVAL, 4,
TIMESTAMP '2023-02-11 10:30:00', 'urgent');
SELECT * FROM Waiting_list;
INSERT INTO Room(room_no, residential_id, wait_id) VALUES (seq_room.NEXTVAL, 1, 1);
INSERT INTO Room(room_no, residential_id, wait_id) VALUES (seq_room.NEXTVAL, 2, 2);
INSERT INTO Room(room_no, residential_id, wait_id) VALUES (seq_room.NEXTVAL, 3, 4);
INSERT INTO Room(room_no, residential_id, wait_id) VALUES (seq_room.NEXTVAL, 1, 3);
SELECT * FROM Room;
INSERT INTO Ward (ward_id, ward_name) VALUES (seq_ward.NEXTVAL, 'Cardiology Ward');
INSERT INTO Ward (ward_id, ward_name) VALUES (seq_ward.NEXTVAL, 'Oncologist Ward');
INSERT INTO Ward (ward_id, ward_name) VALUES (seq_ward.NEXTVAL, 'General Ward');
INSERT INTO Ward (ward_id, ward_name) VALUES (seq_ward.NEXTVAL, 'OPD Ward');
SELECT * FROM Ward;
INSERT INTO Shift (shift_id, shift_name) VALUES (seq_shift.NEXTVAL, 'Day Shift');
INSERT INTO Shift (shift_id, shift_name) VALUES (seq_shift.NEXTVAL, 'Night Shift');
INSERT INTO Shift (shift_id, shift_name) VALUES (seq_shift.NEXTVAL, 'General Shift');
INSERT INTO Shift (shift_id, shift_name) VALUES (seq_shift.NEXTVAL, 'Evening Shift');
SELECT * FROM Shift;
INSERT INTO Emp_shift (emp_shift_id, emp_id, shift_id, shift_datetime) VALUES (seq_empshift.NEXTVAL, 1, 1,
TO_TIMESTAMP('2023-01-01 08:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Emp_shift (emp_shift_id, emp_id, shift_id, shift_datetime) VALUES (seq_empshift.NEXTVAL, 4, 4,
TO_TIMESTAMP('2023-01-01 08:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Emp_shift (emp_shift_id, emp_id, shift_id, shift_datetime) VALUES (seq_empshift.NEXTVAL, 3, 2,
TO_TIMESTAMP('2023-01-15 08:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Emp_shift (emp_shift_id, emp_id, shift_id, shift_datetime) VALUES (seq_empshift.NEXTVAL, 2, 3,
TO_TIMESTAMP('2023-02-01 08:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Emp_shift (emp_shift_id, emp_id, shift_id, shift_datetime) VALUES (seq_empshift.NEXTVAL, 5, 1,
TO_TIMESTAMP('2023-02-01 08:00:00', 'YYYY-MM-DD HH24:MI:SS'));
SELECT * FROM Emp_shift;
INSERT INTO GP (gp_id, gp_name, gp_contact, gp_address) VALUES (seq_gp.NEXTVAL, 'Dr. Brandon',
'7134544890', 'Cafe 54, 54 lincolns Inn Fields, London, England United Kingdom, WC2A 3NA');
INSERT INTO GP (gp_id, gp_name, gp_contact, gp_address) VALUES (seq_gp.NEXTVAL, 'Dr. Gregory',
'7134134890', 'Tower Wharf, London, United Kingdom, EC3N 4DT');
INSERT INTO GP (gp_id, gp_name, gp_contact, gp_address) VALUES (seq_gp.NEXTVAL, 'Dr. Frank',
'71345678110', 'Penhaligons, 16-17 Burlington Arcade, London, England United Kingdom, W1J 0AX');
INSERT INTO GP (gp_id, gp_name, gp_contact, gp_address) VALUES (seq_gp.NEXTVAL, 'Dr. Buffay', '7134561490',
'Sarah Lee, 4 Airlie Gardens, Kensington Chelsea, London, United Kingdom,W8 7AJ');
SELECT * FROM GP;
INSERT INTO Discharge (discharge_id, discharge_date, emp_id) VALUES (seq_dis.NEXTVAL,
TO_TIMESTAMP('2023-03-24 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 3);
INSERT INTO Discharge (discharge_id, discharge_date, emp_id) VALUES (seq_dis.NEXTVAL,
TO_TIMESTAMP('2023-03-24 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 4);
INSERT INTO Discharge (discharge_id, discharge_date, emp_id) VALUES (seq_dis.NEXTVAL,
TO_TIMESTAMP('2023-03-24 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1);
SELECT * FROM Discharge;
INSERT INTO patient (patient_no, gp_id, discharge_id, centre_id, ward_id, patient_name, patient_address,
patient_contact)
VALUES (seq_patient.NEXTVAL, 1, 1, 1, 1, 'David Smith', 'Penhaligons, 16-17 Burlington Arcade, London, England
United Kingdom, W1J 0AX', '7012345678');
INSERT INTO patient (patient_no, gp_id, discharge_id, centre_id, ward_id, patient_name, patient_address,
patient_contact)
VALUES (seq_patient.NEXTVAL, 2, 1, 1, 2, 'Jane Doe', 'Cafe 54, 54 lincolns Inn Fields, London, England United
Kingdom, WC2A 3NA', '702345678');
INSERT INTO patient (patient_no, gp_id, discharge_id, centre_id, ward_id, patient_name, patient_address,
patient_contact)
VALUES (seq_patient.NEXTVAL, 3, 2, 2, 1, 'Thomas Johnson', '32 St. Petersburgh Mews, Westminster, London,
United Kingdom,W2 4LB', '7734506789');
INSERT INTO patient (patient_no, gp_id, discharge_id, centre_id, ward_id, patient_name, patient_address,
patient_contact)
VALUES (seq_patient.NEXTVAL, 2, 2, 2, 2, 'Sarah Lee', '4 Airlie Gardens, Kensington Chelsea, London, United
Kingdom,W8 7AJ', '7823415678');
INSERT INTO patient (patient_no, gp_id, discharge_id, centre_id, ward_id, patient_name, patient_address,
patient_contact)
VALUES (seq_patient.NEXTVAL, 1, 1, 1, 1, 'Daniel Brown', 'Tower Wharf, London, United Kingdom, EC3N 4DT',
'7034516789');
SELECT * FROM patient;
INSERT INTO Family (family_id, discharge_id, caretaker_name, caretaker_contact, relationship) VALUES
(seq_family.NEXTVAL, 1, 'Jerry Tyler', '7836543210', 'Spouse');
INSERT INTO Family (family_id, discharge_id, caretaker_name, caretaker_contact, relationship) VALUES
(seq_family.NEXTVAL, 3, 'Raymond Dennis', '7776543210', 'Father');
INSERT INTO Family (family_id, discharge_id, caretaker_name, caretaker_contact, relationship) VALUES
(seq_family.NEXTVAL, 2, 'Aaron Jose', '7891743210', 'Mother');
SELECT * FROM Family;
INSERT INTO Treatment (treatment_id, treatment_type, treatment_details) VALUES (seq_treat.NEXTVAL,
'Physical Therapy', 'Twice weekly for six weeks');
INSERT INTO Treatment (treatment_id, treatment_type, treatment_details) VALUES (seq_treat.NEXTVAL, 'Mind
Therapy', 'Once a day every morning');
INSERT INTO Treatment (treatment_id, treatment_type, treatment_details) VALUES (seq_treat.NEXTVAL, 'Body
Treatment', 'Twice a day for 2 weeks');
INSERT INTO Treatment (treatment_id, treatment_type, treatment_details) VALUES (seq_treat.NEXTVAL,
'Dentistry', 'Once a week for 1 month');
SELECT * FROM Treatment;
INSERT INTO Prescription (prescription_no, treatment_no, date_start, date_end, comments, period)
VALUES (seq_pres.NEXTVAL, 1, TO_TIMESTAMP('2023-03-25 10:00:00', 'YYYY-MM-DD HH24:MI:SS'),
TO_TIMESTAMP('2023-05-05 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Take with food.', 30);
INSERT INTO Prescription (prescription_no, treatment_no, date_start, date_end, comments, period)
VALUES (seq_pres.NEXTVAL, 3, TO_TIMESTAMP('2023-02-01 11:00:10', 'YYYY-MM-DD HH24:MI:SS'),
TO_TIMESTAMP('2023-02-25 01:01:00', 'YYYY-MM-DD HH24:MI:SS'), 'Take after dinner.', 20);
INSERT INTO Prescription (prescription_no, treatment_no, date_start, date_end, comments, period)
VALUES (seq_pres.NEXTVAL, 2, TO_TIMESTAMP('2023-01-02 10:20:30', 'YYYY-MM-DD HH24:MI:SS'),
TO_TIMESTAMP('2023-03-11 12:01:00', 'YYYY-MM-DD HH24:MI:SS'), 'with milk.', 10);
INSERT INTO Prescription (prescription_no, treatment_no, date_start, date_end, comments, period)
VALUES (seq_pres.NEXTVAL, 4, TO_TIMESTAMP('2023-03-11 10:10:30', 'YYYY-MM-DD HH24:MI:SS'),
TO_TIMESTAMP('2023-04-04 11:03:00', 'YYYY-MM-DD HH24:MI:SS'), 'with mild hot water', 5);
SELECT * FROM Prescription;
INSERT INTO Agency (agency_id, discharge_id, agency_name, agency_address, agency_contact) VALUES
(seq_agency.NEXTVAL, 1, '72andSunny', '4 Airlie Gardens, Kensington and Chelsea, London, United Kingdom,W8
7AJ', '76189901777');
INSERT INTO Agency (agency_id, discharge_id, agency_name, agency_address, agency_contact) VALUES
(seq_agency.NEXTVAL, 3, 'Rocket Clicks', 'Enoteca Rabezzana, 62-63 Long Lane, London, England United
Kingdom', '71890181889');
INSERT INTO Agency (agency_id, discharge_id, agency_name, agency_address, agency_contact) VALUES
(seq_agency.NEXTVAL, 2, 'David & Goliath', 'Cafe 54, 54 lincolns Inn Fields, London, England United Kingdom,
WC2A 3NA', '7177890186');
SELECT * FROM Agency;
INSERT INTO Medical_condition (medical_cond_id, treatment_id) VALUES (seq_med.NEXTVAL, 1);
INSERT INTO Medical_condition (medical_cond_id, treatment_id) VALUES (seq_med.NEXTVAL, 3);
INSERT INTO Medical_condition (medical_cond_id, treatment_id) VALUES (seq_med.NEXTVAL, 2);
SELECT * FROM Medical_condition;
INSERT INTO Drug (drug_code, treatment_id, drug_name, drug_manufacturer, drug_start, drug_end, period)
VALUES (seq_drug.NEXTVAL, 1, 'Ibuprofen', 'Alkem Pharmaceuticals', TO_TIMESTAMP('2023-03-25 10:00:00',
'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-04-25 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 30);
INSERT INTO Drug (drug_code, treatment_id, drug_name, drug_manufacturer, drug_start, drug_end, period)
VALUES (seq_drug.NEXTVAL, 1, 'CRNX', 'Lupin Pharmaceuticals', TO_TIMESTAMP('2023-01-02 10:00:00',
'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-11-25 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 30);
INSERT INTO Drug (drug_code, treatment_id, drug_name, drug_manufacturer, drug_start, drug_end, period)
VALUES (seq_drug.NEXTVAL, 1, 'HEM10', 'H Pharma', TO_TIMESTAMP('2023-01-15 10:00:00', 'YYYY-MM-DD
HH24:MI:SS'), TO_TIMESTAMP('2025-10-25 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 30);
SELECT * FROM Drug;
INSERT INTO InPatient (patient_no, period_of_stay) VALUES (1, 10);
INSERT INTO InPatient (patient_no, period_of_stay) VALUES (2, 20);
SELECT * FROM InPatient;
INSERT INTO OutPatient (patient_no, treatment_type) VALUES (4, 'Xray');
INSERT INTO OutPatient (patient_no, treatment_type) VALUES (3, 'Root Canal');
SELECT * FROM OutPatient;
