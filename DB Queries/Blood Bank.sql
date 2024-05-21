--=+=+=CREATING DATABASE=+=+=	
create database BloodBank;



--=+=+=CREATING TABLES=+=+=
create table DONOR (
					NationalID int primary key not null,
					FName varchar(300),
					LName varchar(300),
					Gender varchar(300),
					BirthDate date,
					City varchar(300),
					Government varchar(300),
					DonationAmount int,
					DonationDate date,
					BloodType varchar(10),
					RH_Factor varchar(10),
					DateOfLastDonation date);

create table PHONE (
					DonorID int foreign key references DONOR(NationalID),
					PhoneNumber int);

create table EMAIL (
					DonorID int foreign key references DONOR(NationalID),
					EMail varchar(300));

create table FAMILY_MEDICAL_HISTORY (
									DonorID int foreign key references DONOR(NationalID),
									FamilyMedicalHistory varchar(300));

create table EMERGENCY_CONTACT (
								DonorID int foreign key references DONOR(NationalID),
								FName varchar(300),
								LName varchar(300),
								PhoneNumder int,
								City varchar(300),
								Government varchar(300));

create table MEDICAL_CONDITIONS (
								DonorID int foreign key references DONOR(NationalID),
								MedicalConditions varchar(300));

create table ALERGIES (
						DonorID int foreign key references DONOR(NationalID),
						AlergiesHistory varchar(300));

create table PRIVIOUS_SURGERIES (
								DonorID int foreign key references DONOR(NationalID),
								SurgeriesHistory varchar(300));

create table BLOOD_BANK (
						DepartmentID int primary key not null,
						OperatingHours int,
						HeadName varchar(300),
						HeadID int,
						Phone int,
						Location varchar(300));

create table AVAILABLE_BLOOD_TYPES (
									DepartmentID int foreign key references BLOOD_BANK(DepartmentID),
									BloodType varchar(10),
									RH_Factor varchar(10));

create table DONATES_BLOOD (
							DonorID int foreign key references DONOR(NationalID),
							DepartmentID int foreign key references BLOOD_BANK(DepartmentID));

create Table INVENTORY (
						InventoryID int primary key not null,
						UnitID int,
						ReceivedDate date,
						StorageLocation varchar(30));

create table MEDICAL_STAFF (
					NationalID int primary key not null,
					FName varchar(300),
					LName varchar(300),
					Gender varchar(300),
					BirthDate date,
					City varchar(300),
					Government varchar(300),
					CurrentPosition varchar(300),
					DepartmentID int foreign key references BLOOD_BANK(DepartmentID),
					HireDate date,
					University varchar(300),
					GraduationYear int,
					MedicalDegree varchar(300),
					Specialization varchar(300),
					Salary decimal(8,2),
					UserName varchar(300),
					Password varchar(300));

create table M_PHONE (
					StaffID int foreign key references MEDICAL_STAFF(NationalID),
					PhoneNumber int);

create table M_EMAIL (
					StaffID int foreign key references MEDICAL_STAFF(NationalID),
					EMail varchar(300));

create table CERTIFICATIONS (
							StaffID int foreign key references MEDICAL_STAFF(NationalID),
							Certificate varchar(300));

create table SUPERVISION (
						  StaffID int foreign key references MEDICAL_STAFF(NationalID));

create table BLOOD_UNIT (
						 UnitID int primary key not null,
						 DonorID int,      
						 BloodType varchar(10),
						 DonationDate date,
						 RH_Factor varchar(10),
						 ExpirationDate date,
						 InventoryID int foreign key references INVENTORY(InventoryID),
						 StorageCondition varchar(300));

create table TESTING_RESULTS (
							  TestID int primary key not null,
							  UnitID int foreign key references BLOOD_UNIT(UnitID),
							  BloodTypeConfirmationResult varchar(300),
							  InfectionDiseaseResult varchar(300));

create table OTHER_MEDICAL_TEST_RESULTS (
										 TestID int foreign key references TESTING_RESULTS(TestID),
										 MedicalResults varchar(300));

create table EXAMINS (
					   StaffID int foreign key references MEDICAL_STAFF(NationalID),
					   TestID int foreign key references TESTING_RESULTS(TestID));

create table RECIPIENT (
						NationalID int primary key not null,
						FName varchar(300),
						LName varchar(300),
						Gender varchar(300),
						BirthDate date,
						City varchar(300),
						Government varchar(300),
						BloodType varchar(10),
						RH_Factor varchar(10));

create table R_PHONE (
					RecipientID int foreign key references RECIPIENT(NationalID),
					PhoneNumber int);

create table R_EMAIL (
					RecipientID int foreign key references RECIPIENT(NationalID),
					EMail varchar(300));

create table R_MEDICAL_CONDITIONS (
									RecipientID int foreign key references RECIPIENT(NationalID),
									MedicalConditions varchar(300));

create table R_ALERGIES (
						RecipientID int foreign key references RECIPIENT(NationalID),
						AlergiesHistory varchar(300));

create table R_PRIVIOUS_SURGERIES (
									RecipientID int foreign key references RECIPIENT(NationalID),
									SurgeriesHistory varchar(300));

create table DATE_OF_PREVIOUS_TRANSFUSIONS (
											RecipientID int foreign key references RECIPIENT(NationalID),
											Date date);

create table INDECATION_FOR_TRANSFUSIONS (
											RecipientID int foreign key references RECIPIENT(NationalID),
											Indications varchar(300));

create table TESTS_BLOOD (
						  TestID int foreign key references TESTING_RESULTS(TestID),
						  UnitID int foreign key references BLOOD_UNIT(UnitID));

create table TRANSFUSION_RECORDS (
								  RecordID int primary key not null,
								  RecipientID int,
								  UnitID int,
								  TransfusionDate date,
								  InventoryID int foreign key references INVENTORY(InventoryID));

create table MEDICAL_STAFF_INVOLVED (
									 RecordID int foreign key references TRANSFUSION_RECORDS(RecordID),
									 Staff varchar(30));

create table DELIVERS (
					    RecordID int foreign key references TRANSFUSION_RECORDS(RecordID),
						StaffID int foreign key references MEDICAL_STAFF(NationalID));

create table RECEIVES (
					   RecipientID int foreign key references RECIPIENT(NationalID),
					   StaffID int foreign key references MEDICAL_STAFF(NationalID),
					   RecordID int foreign key references TRANSFUSION_RECORDS(RecordID));

create table BLOOD_DISPOSAL_DEPARTMENT (
										DepartmentID int primary key not null,
										HeadName varchar(300),
										HeadID int,
										QualityAssurance varchar(300));

create table DISPOSAL_PROCEDURES (
								  DepartmentID int foreign key references BLOOD_DISPOSAL_DEPARTMENT(DepartmentID),
								  DisposalProcedures varchar(300));

create table BLOOD_EXECUTION (
							  DepartmentID int foreign key references BLOOD_DISPOSAL_DEPARTMENT(DepartmentID),
							  UnitID int foreign key references BLOOD_UNIT(UnitID),
							  InventoryID int foreign key references INVENTORY(InventoryID));
							  


--=+=+=FILLING TABLES=+=+=

--DONOR
INSERT INTO DONOR (NationalID, FName, LName, Gender, BirthDate, City, Government, DonationAmount, DonationDate, BloodType, RH_Factor, DateOfLastDonation)
VALUES
(1001, 'John', 'Doe', 'Male', '1980-01-01', 'New York', 'NY', 500, '2024-01-15', 'O', '+', '2024-01-15'),
(1002, 'Jane', 'Smith', 'Female', '1990-02-02', 'Los Angeles', 'CA', 450, '2024-01-20', 'A', '-', '2024-01-20'),
(1003, 'Mike', 'Johnson', 'Male', '1985-03-03', 'Chicago', 'IL', 600, '2024-01-25', 'B', '+', '2024-01-25'),
(1004, 'Emily', 'Davis', 'Female', '1992-04-04', 'Houston', 'TX', 550, '2024-01-30', 'AB', '-', '2024-01-30'),
(1005, 'Chris', 'Brown', 'Male', '1983-05-05', 'Phoenix', 'AZ', 500, '2024-02-04', 'O', '-', '2024-02-04'),
(1006, 'Sarah', 'Wilson', 'Female', '1988-06-06', 'Philadelphia', 'PA', 450, '2024-02-09', 'A', '+', '2024-02-09'),
(1007, 'David', 'Moore', 'Male', '1981-07-07', 'San Antonio', 'TX', 600, '2024-02-14', 'B', '-', '2024-02-14'),
(1008, 'Laura', 'Taylor', 'Female', '1984-08-08', 'San Diego', 'CA', 550, '2024-02-19', 'AB', '+', '2024-02-19'),
(1009, 'James', 'Anderson', 'Male', '1982-09-09', 'Dallas', 'TX', 500, '2024-02-24', 'O', '+', '2024-02-24'),
(1010, 'Karen', 'Thomas', 'Female', '1993-10-10', 'San Jose', 'CA', 450, '2024-03-01', 'A', '-', '2024-03-01'),
(1011, 'Tom', 'Jackson', 'Male', '1986-11-11', 'Austin', 'TX', 600, '2024-03-06', 'B', '+', '2024-03-06'),
(1012, 'Linda', 'White', 'Female', '1991-12-12', 'Fort Worth', 'TX', 550, '2024-03-11', 'AB', '-', '2024-03-11'),
(1013, 'Robert', 'Harris', 'Male', '1989-01-13', 'Columbus', 'OH', 500, '2024-03-16', 'O', '-', '2024-03-16'),
(1014, 'Nancy', 'Martin', 'Female', '1987-02-14', 'Charlotte', 'NC', 450, '2024-03-21', 'A', '+', '2024-03-21'),
(1015, 'Charles', 'Martinez', 'Male', '1994-03-15', 'Indianapolis', 'IN', 600, '2024-03-26', 'B', '-', '2024-03-26'),
(1016, 'Lisa', 'Garcia', 'Female', '1982-04-16', 'San Francisco', 'CA', 550, '2024-03-31', 'AB', '+', '2024-03-31'),
(1017, 'Paul', 'Martinez', 'Male', '1980-05-17', 'Jacksonville', 'FL', 500, '2024-04-05', 'O', '+', '2024-04-05'),
(1018, 'Donna', 'Clark', 'Female', '1990-06-18', 'Seattle', 'WA', 450, '2024-04-10', 'A', '-', '2024-04-10'),
(1019, 'Daniel', 'Rodriguez', 'Male', '1985-07-19', 'Denver', 'CO', 600, '2024-04-15', 'B', '+', '2024-04-15'),
(1020, 'Susan', 'Lewis', 'Female', '1992-08-20', 'Boston', 'MA', 550, '2024-04-20', 'AB', '-', '2024-04-20');


--PHONE NUMBERS
ALTER TABLE PHONE
ALTER COLUMN PhoneNumber BIGINT;

INSERT INTO PHONE (DonorID, PhoneNumber)
VALUES
(1001, 12345678901),
(1002, 12345678902),
(1003, 12345678903),
(1004, 12345678904),
(1005, 12345678905),
(1006, 12345678906),
(1007, 12345678907),
(1008, 12345678908),
(1009, 12345678909),
(1010, 12345678910),
(1011, 12345678911),
(1012, 12345678912),
(1013, 12345678913),
(1014, 12345678914),
(1015, 12345678915),
(1016, 12345678916),
(1017, 12345678917),
(1018, 12345678918),
(1019, 12345678919),
(1020, 12345678920);

--E-MAILS
INSERT INTO EMAIL (DonorID, EMail)
VALUES
(1001, 'john.doe@example.com'),
(1002, 'jane.smith@example.com'),
(1003, 'mike.johnson@example.com'),
(1004, 'emily.davis@example.com'),
(1005, 'chris.brown@example.com'),
(1006, 'sarah.wilson@example.com'),
(1007, 'david.moore@example.com'),
(1008, 'laura.taylor@example.com'),
(1009, 'james.anderson@example.com'),
(1010, 'karen.thomas@example.com'),
(1011, 'tom.jackson@example.com'),
(1012, 'linda.white@example.com'),
(1013, 'robert.harris@example.com'),
(1014, 'nancy.martin@example.com'),
(1015, 'charles.martinez@example.com'),
(1016, 'lisa.garcia@example.com'),
(1017, 'paul.martinez@example.com'),
(1018, 'donna.clark@example.com'),
(1019, 'daniel.rodriguez@example.com'),
(1020, 'susan.lewis@example.com');


--FAMILY MEDICAL HISTORY
INSERT INTO FAMILY_MEDICAL_HISTORY (DonorID, FamilyMedicalHistory)
VALUES
(1001, 'No history of genetic diseases'),
(1002, 'History of hypertension'),
(1003, 'History of diabetes'),
(1004, 'No significant medical history'),
(1005, 'History of heart disease'),
(1006, 'No history of genetic diseases'),
(1007, 'History of cancer'),
(1008, 'History of asthma'),
(1009, 'No significant medical history'),
(1010, 'History of hypertension'),
(1011, 'No history of genetic diseases'),
(1012, 'History of diabetes'),
(1013, 'No significant medical history'),
(1014, 'History of heart disease'),
(1015, 'History of cancer'),
(1016, 'History of asthma'),
(1017, 'No significant medical history'),
(1018, 'History of hypertension'),
(1019, 'History of diabetes'),
(1020, 'No history of genetic diseases');


--EMERGENCY CONTACT
ALTER TABLE EMERGENCY_CONTACT
ALTER COLUMN PhoneNumder BIGINT;

INSERT INTO EMERGENCY_CONTACT (DonorID, FName, LName, PhoneNumder, City, Government)
VALUES
(1001, 'Anna', 'Doe', 12345678901, 'New York', 'NY'),
(1002, 'Tom', 'Smith', 10345678901, 'Los Angeles', 'CA'),
(1003, 'Sara', 'Johnson', 12045678901, 'Chicago', 'IL'),
(1004, 'Michael', 'Davis', 12305678901, 'Houston', 'TX'),
(1005, 'Laura', 'Brown', 12340678901, 'Phoenix', 'AZ'),
(1006, 'David', 'Wilson', 12345078901, 'Philadelphia', 'PA'),
(1007, 'Susan', 'Moore', 12345678001, 'San Antonio', 'TX'),
(1008, 'John', 'Taylor', 12345670001, 'San Diego', 'CA'),
(1009, 'Karen', 'Anderson', 12225678901, 'Dallas', 'TX'),
(1010, 'Chris', 'Thomas', 12345578901, 'San Jose', 'CA'),
(1011, 'Linda', 'Jackson', 12347778901, 'Austin', 'TX'),
(1012, 'James', 'White', 12345688901, 'Fort Worth', 'TX'),
(1013, 'Nancy', 'Harris', 11345678901, 'Columbus', 'OH'),
(1014, 'Charles', 'Martin', 12245678901, 'Charlotte', 'NC'),
(1015, 'Lisa', 'Martinez', 12345679901, 'Indianapolis', 'IN'),
(1016, 'Robert', 'Garcia', 12445678901, 'San Francisco', 'CA'),
(1017, 'Emily', 'Martinez', 10045678901, 'Jacksonville', 'FL'),
(1018, 'Paul', 'Clark', 12341578901, 'Seattle', 'WA'),
(1019, 'Donna', 'Rodriguez', 12345678978, 'Denver', 'CO'),
(1020, 'Daniel', 'Lewis', 12342078901, 'Boston', 'MA');


--MEDICAL CONDITIONS
INSERT INTO MEDICAL_CONDITIONS (DonorID, MedicalConditions)
VALUES
(1001, 'None'),
(1002, 'Hypertension'),
(1003, 'Diabetes'),
(1004, 'None'),
(1005, 'Heart Disease'),
(1006, 'None'),
(1007, 'Cancer'),
(1008, 'Asthma'),
(1009, 'None'),
(1010, 'Hypertension'),
(1011, 'None'),
(1012, 'Diabetes'),
(1013, 'None'),
(1014, 'Heart Disease'),
(1015, 'Cancer'),
(1016, 'Asthma'),
(1017, 'None'),
(1018, 'Hypertension'),
(1019, 'Diabetes'),
(1020, 'None');


--ALERGIES
INSERT INTO ALERGIES (DonorID, AlergiesHistory)
VALUES
(1001, 'Peanuts'),
(1002, 'None'),
(1003, 'None'),
(1004, 'Shellfish'),
(1005, 'None'),
(1006, 'None'),
(1007, 'Penicillin'),
(1008, 'None'),
(1009, 'Peanuts'),
(1010, 'None'),
(1011, 'None'),
(1012, 'Shellfish'),
(1013, 'None'),
(1014, 'None'),
(1015, 'Penicillin'),
(1016, 'None'),
(1017, 'Peanuts'),
(1018, 'None'),
(1019, 'None'),
(1020, 'Shellfish');


--PRIVIOUS SURGERIES
INSERT INTO PRIVIOUS_SURGERIES (DonorID, SurgeriesHistory)
VALUES
(1001, 'Appendectomy'),
(1002, 'None'),
(1003, 'Gallbladder removal'),
(1004, 'None'),
(1005, 'Heart bypass surgery'),
(1006, 'None'),
(1007, 'Cancer treatment'),
(1008, 'None'),
(1009, 'Appendectomy'),
(1010, 'None'),
(1011, 'Gallbladder removal'),
(1012, 'None'),
(1013, 'Heart bypass surgery'),
(1014, 'None'),
(1015, 'Cancer treatment'),
(1016, 'None'),
(1017, 'Appendectomy'),
(1018, 'None'),
(1019, 'Gallbladder removal'),
(1020, 'None');


--BLOOD BANK
INSERT INTO BLOOD_BANK (DepartmentID, OperatingHours, HeadName, HeadID, Phone, Location)
VALUES
(1, 24, 'Dr. Alice Brown', 2001, 98210, 'New York'),
(2, 24, 'Dr. Bob Smith', 2002, 95211, 'Los Angeles'),
(3, 24, 'Dr. Carol Johnson', 2003, 93212, 'Chicago'),
(4, 24, 'Dr. Dave Davis', 2004, 93213, 'Houston'),
(5, 24, 'Dr. Eve Wilson', 2005, 98714, 'Phoenix'),
(6, 24, 'Dr. Frank Taylor', 2006, 98215, 'Philadelphia'),
(7, 24, 'Dr. Grace Moore', 2007, 98716, 'San Antonio'),
(8, 24, 'Dr. Henry Jackson', 2008, 96217, 'San Diego'),
(9, 24, 'Dr. Irene Thomas', 2009, 98218, 'Dallas'),
(10, 24, 'Dr. Jack White', 2010, 93219, 'San Jose'),
(11, 24, 'Dr. Karen Harris', 2011, 96520, 'Austin'),
(12, 24, 'Dr. Larry Martin', 2012, 96221, 'Fort Worth'),
(13, 24, 'Dr. Mary Garcia', 2013, 98222, 'Columbus'),
(14, 24, 'Dr. Nick Martinez', 2014, 73223, 'Charlotte'),
(15, 24, 'Dr. Olivia Clark', 2015, 96224, 'Indianapolis'),
(16, 24, 'Dr. Paul Rodriguez', 2016, 54225, 'San Francisco'),
(17, 24, 'Dr. Quinn Lewis', 2017, 95226, 'Jacksonville'),
(18, 24, 'Dr. Rachel Lee', 2018, 98727, 'Seattle'),
(19, 24, 'Dr. Sam Walker', 2019, 98428, 'Denver'),
(20, 24, 'Dr. Tina Young', 2020, 95429, 'Boston');


--AVAILABLE BLOOD TYPES
INSERT INTO AVAILABLE_BLOOD_TYPES (DepartmentID, BloodType, RH_Factor)
VALUES
(1, 'O', '+'),
(1, 'A', '-'),
(1, 'B', '+'),
(1, 'AB', '-'),
(2, 'O', '-'),
(2, 'A', '+'),
(2, 'B', '-'),
(2, 'AB', '+'),
(3, 'O', '+'),
(3, 'A', '-'),
(3, 'B', '+'),
(3, 'AB', '-'),
(4, 'O', '-'),
(4, 'A', '+'),
(4, 'B', '-'),
(4, 'AB', '+'),
(5, 'O', '+'),
(5, 'A', '-'),
(5, 'B', '+'),
(5, 'AB', '-');


--MEDICAL STAFF
INSERT INTO MEDICAL_STAFF (NationalID, FName, LName, Gender, BirthDate, City, Government, CurrentPosition, DepartmentID, HireDate, University, GraduationYear, MedicalDegree, Specialization, Salary, UserName, Password)
VALUES
(3001, 'Alice', 'Brown', 'Female', '1970-01-01', 'New York', 'NY', 'Head Doctor', 1, '2010-06-01', 'NYU', 1995, 'MD', 'Hematology', 120000.00, 'alice.brown', 'password123'),
(3002, 'Bob', 'Smith', 'Male', '1975-02-02', 'Los Angeles', 'CA', 'Senior Doctor', 2, '2011-07-01', 'UCLA', 1997, 'MD', 'Hematology', 115000.00, 'bob.smith', 'password123'),
(3003, 'Carol', 'Johnson', 'Female', '1980-03-03', 'Chicago', 'IL', 'Junior Doctor', 3, '2012-08-01', 'UChicago', 2000, 'MD', 'Hematology', 110000.00, 'carol.johnson', 'password123'),
(3004, 'Dave', 'Davis', 'Male', '1985-04-04', 'Houston', 'TX', 'Resident Doctor', 4, '2013-09-01', 'UTHealth', 2005, 'MD', 'Hematology', 105000.00, 'dave.davis', 'password123'),
(3005, 'Eve', 'Wilson', 'Female', '1990-05-05', 'Phoenix', 'AZ', 'Consultant', 5, '2014-10-01', 'UA', 2010, 'MD', 'Hematology', 100000.00, 'eve.wilson', 'password123'),
(3006, 'Frank', 'Taylor', 'Male', '1970-06-06', 'Philadelphia', 'PA', 'Head Doctor', 6, '2015-11-01', 'UPenn', 1995, 'MD', 'Hematology', 120000.00, 'frank.taylor', 'password123'),
(3007, 'Grace', 'Moore', 'Female', '1975-07-07', 'San Antonio', 'TX', 'Senior Doctor', 7, '2016-12-01', 'UTHSCSA', 1997, 'MD', 'Hematology', 115000.00, 'grace.moore', 'password123'),
(3008, 'Henry', 'Jackson', 'Male', '1980-08-08', 'San Diego', 'CA', 'Junior Doctor', 8, '2017-01-01', 'UCSD', 2000, 'MD', 'Hematology', 110000.00, 'henry.jackson', 'password123'),
(3009, 'Irene', 'Thomas', 'Female', '1985-09-09', 'Dallas', 'TX', 'Resident Doctor', 9, '2018-02-01', 'UTSW', 2005, 'MD', 'Hematology', 105000.00, 'irene.thomas', 'password123'),
(3010, 'Jack', 'White', 'Male', '1990-10-10', 'San Jose', 'CA', 'Consultant', 10, '2019-03-01', 'Stanford', 2010, 'MD', 'Hematology', 100000.00, 'jack.white', 'password123'),
(3011, 'Karen', 'Harris', 'Female', '1970-11-11', 'Austin', 'TX', 'Head Doctor', 11, '2020-04-01', 'UT Austin', 1995, 'MD', 'Hematology', 120000.00, 'karen.harris', 'password123'),
(3012, 'Larry', 'Martin', 'Male', '1975-12-12', 'Fort Worth', 'TX', 'Senior Doctor', 12, '2021-05-01', 'TCU', 1997, 'MD', 'Hematology', 115000.00, 'larry.martin', 'password123'),
(3013, 'Mary', 'Garcia', 'Female', '1980-01-13', 'Columbus', 'OH', 'Junior Doctor', 13, '2022-06-01', 'OSU', 2000, 'MD', 'Hematology', 110000.00, 'mary.garcia', 'password123'),
(3014, 'Nick', 'Martinez', 'Male', '1985-02-14', 'Charlotte', 'NC', 'Resident Doctor', 14, '2023-07-01', 'Duke', 2005, 'MD', 'Hematology', 105000.00, 'nick.martinez', 'password123'),
(3015, 'Olivia', 'Clark', 'Female', '1990-03-15', 'Indianapolis', 'IN', 'Consultant', 15, '2024-08-01', 'IU', 2010, 'MD', 'Hematology', 100000.00, 'olivia.clark', 'password123'),
(3016, 'Paul', 'Rodriguez', 'Male', '1970-04-16', 'San Francisco', 'CA', 'Head Doctor', 16, '2010-09-01', 'UCSF', 1995, 'MD', 'Hematology', 120000.00, 'paul.rodriguez', 'password123'),
(3017, 'Quinn', 'Lewis', 'Female', '1975-05-17', 'Jacksonville', 'FL', 'Senior Doctor', 17, '2011-10-01', 'UF', 1997, 'MD', 'Hematology', 115000.00, 'quinn.lewis', 'password123'),
(3018, 'Rachel', 'Lee', 'Female', '1980-06-18', 'Seattle', 'WA', 'Junior Doctor', 18, '2012-11-01', 'UW', 2000, 'MD', 'Hematology', 110000.00, 'rachel.lee', 'password123'),
(3019, 'Sam', 'Walker', 'Male', '1985-07-19', 'Denver', 'CO', 'Resident Doctor', 19, '2013-12-01', 'CU', 2005, 'MD', 'Hematology', 105000.00, 'sam.walker', 'password123'),
(3020, 'Tina', 'Young', 'Female', '1990-08-20', 'Boston', 'MA', 'Consultant', 20, '2014-01-01', 'Harvard', 2010, 'MD', 'Hematology', 100000.00, 'tina.young', 'password123');


--M PHONE
ALTER TABLE M_PHONE
ALTER COLUMN PhoneNumber BIGINT;

INSERT INTO M_PHONE (StaffID, PhoneNumber)
VALUES
(3001, 100096543210),
(3002, 100096543211),
(3003, 100096543212),
(3004, 100098543213),
(3005, 100098543214),
(3006, 100098543215),
(3007, 100098543216),
(3008, 100098543217),
(3009, 100098543218),
(3010, 100098543219),
(3011, 100098543220),
(3012, 100098543221),
(3013, 100098543222),
(3014, 100098543223),
(3015, 100098543224),
(3016, 100098543225),
(3017, 100098543226),
(3018, 100098543227),
(3019, 100098543228),
(3020, 100098543229);


--M EMAIL
INSERT INTO M_EMAIL (StaffID, EMail)
VALUES
(3001, 'alice.brown@example.com'),
(3002, 'bob.smith@example.com'),
(3003, 'carol.johnson@example.com'),
(3004, 'dave.davis@example.com'),
(3005, 'eve.wilson@example.com'),
(3006, 'frank.taylor@example.com'),
(3007, 'grace.moore@example.com'),
(3008, 'henry.jackson@example.com'),
(3009, 'irene.thomas@example.com'),
(3010, 'jack.white@example.com'),
(3011, 'karen.harris@example.com'),
(3012, 'larry.martin@example.com'),
(3013, 'mary.garcia@example.com'),
(3014, 'nick.martinez@example.com'),
(3015, 'olivia.clark@example.com'),
(3016, 'paul.rodriguez@example.com'),
(3017, 'quinn.lewis@example.com'),
(3018, 'rachel.lee@example.com'),
(3019, 'sam.walker@example.com'),
(3020, 'tina.young@example.com');


--CERTIFICATIONS
INSERT INTO CERTIFICATIONS (StaffID, Certificate)
VALUES
(3001, 'Board Certified Hematologist'),
(3002, 'Advanced Trauma Life Support'),
(3003, 'Pediatric Advanced Life Support'),
(3004, 'Basic Life Support'),
(3005, 'Advanced Cardiac Life Support'),
(3006, 'Neonatal Resuscitation Program'),
(3007, 'Certified Hematologist'),
(3008, 'Clinical Hematology Certification'),
(3009, 'Hematology Specialist'),
(3010, 'Advanced Hematology Certification'),
(3011, 'Hematology Consultant Certification'),
(3012, 'Expert Hematologist'),
(3013, 'Hematology and Oncology Certification'),
(3014, 'Pediatric Hematology Certification'),
(3015, 'Hematology and Transfusion Medicine'),
(3016, 'Advanced Hematology Specialist'),
(3017, 'Certified Blood Bank Specialist'),
(3018, 'Hematology and Blood Transfusion'),
(3019, 'Hematology and Clinical Pathology'),
(3020, 'Certified Hematology Consultant');


--RECIPIENT
INSERT INTO RECIPIENT (NationalID, FName, LName, Gender, BirthDate, City, Government, BloodType, RH_Factor)
VALUES
(4001, 'Liam', 'Johnson', 'Male', '1980-01-01', 'New York', 'NY', 'O', '+'),
(4002, 'Emma', 'Williams', 'Female', '1985-02-02', 'Los Angeles', 'CA', 'A', '-'),
(4003, 'Noah', 'Brown', 'Male', '1990-03-03', 'Chicago', 'IL', 'B', '+'),
(4004, 'Olivia', 'Jones', 'Female', '1995-04-04', 'Houston', 'TX', 'AB', '-'),
(4005, 'William', 'Garcia', 'Male', '2000-05-05', 'Phoenix', 'AZ', 'O', '-'),
(4006, 'Ava', 'Martinez', 'Female', '1975-06-06', 'Philadelphia', 'PA', 'A', '+'),
(4007, 'James', 'Rodriguez', 'Male', '1985-07-07', 'San Antonio', 'TX', 'B', '-'),
(4008, 'Sophia', 'Hernandez', 'Female', '1995-08-08', 'San Diego', 'CA', 'AB', '+'),
(4009, 'Benjamin', 'Lopez', 'Male', '2005-09-09', 'Dallas', 'TX', 'O', '+'),
(4010, 'Isabella', 'Gonzalez', 'Female', '1970-10-10', 'San Jose', 'CA', 'A', '-'),
(4011, 'Elijah', 'Wilson', 'Male', '1980-11-11', 'Austin', 'TX', 'B', '+'),
(4012, 'Mia', 'Anderson', 'Female', '1990-12-12', 'Fort Worth', 'TX', 'AB', '-'),
(4013, 'Lucas', 'Thomas', 'Male', '2000-01-13', 'Columbus', 'OH', 'O', '-'),
(4014, 'Amelia', 'Taylor', 'Female', '1975-02-14', 'Charlotte', 'NC', 'A', '+'),
(4015, 'Mason', 'Lee', 'Male', '1985-03-15', 'Indianapolis', 'IN', 'B', '-'),
(4016, 'Harper', 'Perez', 'Female', '1995-04-16', 'San Francisco', 'CA', 'AB', '+'),
(4017, 'Ethan', 'White', 'Male', '2005-05-17', 'Jacksonville', 'FL', 'O', '+'),
(4018, 'Evelyn', 'Harris', 'Female', '1970-06-18', 'Seattle', 'WA', 'A', '-'),
(4019, 'Alexander', 'Clark', 'Male', '1980-07-19', 'Denver', 'CO', 'B', '+'),
(4020, 'Abigail', 'Lewis', 'Female', '1990-08-20', 'Boston', 'MA', 'AB', '-');


--R PHONE
ALTER TABLE R_PHONE
ALTER COLUMN PhoneNumber BIGINT;

INSERT INTO R_PHONE (RecipientID, PhoneNumber)
VALUES
(4001, 98765432101),
(4002, 98765432102),
(4003, 98765432103),
(4004, 98765432104),
(4005, 98765432105),
(4006, 98765432106),
(4007, 98765432107),
(4008, 98765432108),
(4009, 98765432109),
(4010, 98765432110),
(4011, 98765432111),
(4012, 98765432112),
(4013, 98765432113),
(4014, 98765432114),
(4015, 98765432115),
(4016, 98765432116),
(4017, 98765432117),
(4018, 98765432118),
(4019, 98765432119),
(4020, 98765432120);


--R EMAIL
INSERT INTO R_EMAIL (RecipientID, EMail)
VALUES
(4001, 'liam.johnson@example.com'),
(4002, 'emma.williams@example.com'),
(4003, 'noah.brown@example.com'),
(4004, 'olivia.jones@example.com'),
(4005, 'william.garcia@example.com'),
(4006, 'ava.martinez@example.com'),
(4007, 'james.rodriguez@example.com'),
(4008, 'sophia.hernandez@example.com'),
(4009, 'benjamin.lopez@example.com'),
(4010, 'isabella.gonzalez@example.com'),
(4011, 'elijah.wilson@example.com'),
(4012, 'mia.anderson@example.com'),
(4013, 'lucas.thomas@example.com'),
(4014, 'amelia.taylor@example.com'),
(4015, 'mason.lee@example.com'),
(4016, 'harper.perez@example.com'),
(4017, 'ethan.white@example.com'),
(4018, 'evelyn.harris@example.com'),
(4019, 'alexander.clark@example.com'),
(4020, 'abigail.lewis@example.com');


--INVENTORY
INSERT INTO INVENTORY (InventoryID, UnitID, ReceivedDate, StorageLocation)
VALUES
(1, 1001, '2024-01-15', 'Refrigerator A'),
(2, 1002, '2024-01-20', 'Refrigerator B'),
(3, 1003, '2024-01-25', 'Refrigerator C'),
(4, 1004, '2024-01-30', 'Refrigerator D'),
(5, 1005, '2024-02-04', 'Refrigerator E'),
(6, 1006, '2024-02-09', 'Refrigerator F'),
(7, 1007, '2024-02-14', 'Refrigerator G'),
(8, 1008, '2024-02-19', 'Refrigerator H'),
(9, 1009, '2024-02-24', 'Refrigerator I'),
(10, 1010, '2024-03-01', 'Refrigerator J'),
(11, 1011, '2024-03-06', 'Refrigerator K'),
(12, 1012, '2024-03-11', 'Refrigerator L'),
(13, 1013, '2024-03-16', 'Refrigerator M'),
(14, 1014, '2024-03-21', 'Refrigerator N'),
(15, 1015, '2024-03-26', 'Refrigerator O'),
(16, 1016, '2024-03-31', 'Refrigerator P'),
(17, 1017, '2024-04-05', 'Refrigerator Q'),
(18, 1018, '2024-04-10', 'Refrigerator R'),
(19, 1019, '2024-04-15', 'Refrigerator S'),
(20, 1020, '2024-04-20', 'Refrigerator T');

UPDATE INVENTORY SET UnitID = 50001 WHERE UnitID = 1001;
UPDATE INVENTORY SET UnitID = 50002 WHERE UnitID = 1002;
UPDATE INVENTORY SET UnitID = 50003 WHERE UnitID = 1003;
UPDATE INVENTORY SET UnitID = 50004 WHERE UnitID = 1004;
UPDATE INVENTORY SET UnitID = 50005 WHERE UnitID = 1005;
UPDATE INVENTORY SET UnitID = 50006 WHERE UnitID = 1006;
UPDATE INVENTORY SET UnitID = 50007 WHERE UnitID = 1007;
UPDATE INVENTORY SET UnitID = 50008 WHERE UnitID = 1008;
UPDATE INVENTORY SET UnitID = 50009 WHERE UnitID = 1009;
UPDATE INVENTORY SET UnitID = 50010 WHERE UnitID = 1010;
UPDATE INVENTORY SET UnitID = 50011 WHERE UnitID = 1011;
UPDATE INVENTORY SET UnitID = 50012 WHERE UnitID = 1012;
UPDATE INVENTORY SET UnitID = 50013 WHERE UnitID = 1013;
UPDATE INVENTORY SET UnitID = 50014 WHERE UnitID = 1014;
UPDATE INVENTORY SET UnitID = 50015 WHERE UnitID = 1015;
UPDATE INVENTORY SET UnitID = 50016 WHERE UnitID = 1016;
UPDATE INVENTORY SET UnitID = 50017 WHERE UnitID = 1017;
UPDATE INVENTORY SET UnitID = 50018 WHERE UnitID = 1018;
UPDATE INVENTORY SET UnitID = 50019 WHERE UnitID = 1019;
UPDATE INVENTORY SET UnitID = 50020 WHERE UnitID = 1020;





--CERTIFICATIONS
INSERT INTO CERTIFICATIONS (StaffID, Certificate)
VALUES
(3001, 'Hematology Board Certification'),
(3002, 'Hematology Board Certification'),
(3003, 'Hematology Fellowship Certification'),
(3004, 'Hematology Residency Certification'),
(3005, 'Hematology Fellowship Certification'),
(3006, 'Hematology Board Certification'),
(3007, 'Hematology Board Certification'),
(3008, 'Hematology Fellowship Certification'),
(3009, 'Hematology Residency Certification'),
(3010, 'Hematology Fellowship Certification'),
(3011, 'Hematology Board Certification'),
(3012, 'Hematology Board Certification'),
(3013, 'Hematology Fellowship Certification'),
(3014, 'Hematology Residency Certification'),
(3015, 'Hematology Fellowship Certification'),
(3016, 'Hematology Board Certification'),
(3017, 'Hematology Board Certification'),
(3018, 'Hematology Fellowship Certification'),
(3019, 'Hematology Residency Certification'),
(3020, 'Hematology Fellowship Certification');


--SUPERVISION
INSERT INTO SUPERVISION (StaffID)
VALUES
(3001),
(3006),
(3011),
(3016);


--BLOOD_UNIT
INSERT INTO BLOOD_UNIT (UnitID, DonorID, BloodType, DonationDate, RH_Factor, ExpirationDate, InventoryID, StorageCondition)
VALUES
(50001, 1001, 'O', '2024-01-15', '+', '2024-07-15', 1, 'Refrigerated'),
(50002, 1002, 'A', '2024-01-20', '-', '2024-07-20', 11, 'Refrigerated'),
(50003, 1003, 'B', '2024-01-25', '+', '2024-07-25', 2, 'Refrigerated'),
(50004, 1004, 'AB', '2024-01-30', '-', '2024-07-30', 18, 'Refrigerated'),
(50005, 1005, 'O', '2024-02-04', '-', '2024-08-04', 3, 'Refrigerated'),
(50006, 1006, 'A', '2024-02-09', '+', '2024-08-09', 19, 'Refrigerated'),
(50007, 1007, 'B', '2024-02-14', '-', '2024-08-14', 4, 'Refrigerated'),
(50008, 1008, 'AB', '2024-02-19', '+', '2024-08-19', 16, 'Refrigerated'),
(50009, 1009, 'O', '2024-02-24', '+', '2024-08-24', 5, 'Refrigerated'),
(50010, 1010, 'A', '2024-03-01', '-', '2024-09-01', 17, 'Refrigerated'),
(50011, 1011, 'B', '2024-03-06', '+', '2024-09-06', 6, 'Refrigerated'),
(50012, 1012, 'AB', '2024-03-11', '-', '2024-09-11', 14, 'Refrigerated'),
(50013, 1013, 'O', '2024-03-16', '-', '2024-09-16', 7, 'Refrigerated'),
(50014, 1014, 'A', '2024-03-21', '+', '2024-09-21', 15, 'Refrigerated'),
(50015, 1015, 'B', '2024-03-26', '-', '2024-09-26', 8, 'Refrigerated'),
(50016, 1016, 'AB', '2024-03-31', '+', '2024-09-30', 13, 'Refrigerated'),
(50017, 1017, 'O', '2024-04-05', '+', '2024-10-05', 9, 'Refrigerated'),
(50018, 1018, 'A', '2024-04-10', '-', '2024-10-10', 12, 'Refrigerated'),
(50019, 1019, 'B', '2024-04-15', '+', '2024-10-15', 10, 'Refrigerated');

INSERT INTO BLOOD_UNIT (UnitID, DonorID, BloodType, DonationDate, RH_Factor, ExpirationDate, InventoryID, StorageCondition)
VALUES
(50020, 1020, 'AB', '2024-04-20', '-', '2024-10-20', 20, 'Refrigerated');




--DATE OF PREVIOUS TRANSFUSIONS
INSERT INTO DATE_OF_PREVIOUS_TRANSFUSIONS
VALUES
(4001, '1979-01-01'),
(4002, '1985-01-02'),
(4003, '1990-02-03'),
(4004, '1993-04-04'),
(4005, '2000-04-05'),
(4006, '1970-06-06'),
(4007, '1985-05-07'),
(4008, '1995-04-08'),
(4009, '2004-09-09'),
(4010, '1968-10-10'),
(4011, '1980-9-11'),
(4012, '1990-10-12'),
(4013, '2000-01-10'),
(4014, '1975-02-10'),
(4015, '1985-03-12'),
(4016, '1993-04-16'),
(4017, '2005-03-17'),
(4018, '1970-02-18'),
(4019, '1980-05-19'),
(4020, '1990-08-10');


--TESTING RESULTS
INSERT INTO TESTING_RESULTS (TestID, UnitID, BloodTypeConfirmationResult, InfectionDiseaseResult)
VALUES
(1, 50001, 'Confirmed', 'Negative'),
(2, 50002, 'Confirmed', 'Negative'),
(3, 50003, 'Confirmed', 'Negative'),
(4, 50004, 'Confirmed', 'Negative'),
(5, 50005, 'Confirmed', 'Negative'),
(6, 50006, 'Confirmed', 'Negative'),
(7, 50007, 'Confirmed', 'Negative'),
(8, 50008, 'Confirmed', 'Negative'),
(9, 50009, 'Confirmed', 'Negative'),
(10, 50010, 'Confirmed', 'Negative'),
(11, 50011, 'Confirmed', 'Negative'),
(12, 50012, 'Confirmed', 'Negative'),
(13, 50013, 'Confirmed', 'Negative'),
(14, 50014, 'Confirmed', 'Negative'),
(15, 50015, 'Confirmed', 'Negative'),
(16, 50016, 'Confirmed', 'Negative'),
(17, 50017, 'Confirmed', 'Negative'),
(18, 50018, 'Confirmed', 'Negative'),
(19, 50019, 'Confirmed', 'Negative'),
(20, 50020, 'Confirmed', 'Negative');


--OTHER MEDICAL TEST RESULTS
INSERT INTO OTHER_MEDICAL_TEST_RESULTS (TestID, MedicalResults)
VALUES
(1, 'Normal'),
(2, 'Normal'),
(3, 'Normal'),
(4, 'Normal'),
(5, 'Normal'),
(6, 'Normal'),
(7, 'Normal'),
(8, 'Normal'),
(9, 'Normal'),
(10, 'Normal'),
(11, 'Normal'),
(12, 'Normal'),
(13, 'Normal'),
(14, 'Normal'),
(15, 'Normal'),
(16, 'Normal'),
(17, 'Normal'),
(18, 'Normal'),
(19, 'Normal'),
(20, 'Normal');


--TRANSFUSION RECORDS
INSERT INTO TRANSFUSION_RECORDS (RecordID, RecipientID, UnitID, TransfusionDate, InventoryID)
VALUES
(01, 4001, 50001, '2024-05-01', 1),
(02, 4002, 50002, '2024-05-03', 2),
(03, 4003, 50003, '2024-05-05', 3),
(04, 4004, 50004, '2024-05-07', 4),
(05, 4005, 50005, '2024-05-09', 5),
(06, 4006, 50006, '2024-05-11', 6),
(07, 4007, 50007, '2024-05-13', 7),
(08, 4008, 50008, '2024-05-15', 8),
(09, 4009, 50009, '2024-05-17', 9),
(10, 4010, 50010, '2024-05-19', 10),
(11, 4011, 50011, '2024-05-21', 11),
(12, 4012, 50012, '2024-05-23', 12),
(13, 4013, 50013, '2024-05-25', 13),
(14, 4014, 50014, '2024-05-27', 14),
(15, 4015, 50015, '2024-05-29', 15),
(16, 4016, 50016, '2024-05-31', 16),
(17, 4017, 50017, '2024-06-02', 17),
(18, 4018, 50018, '2024-06-04', 18),
(19, 4019, 50019, '2024-06-06', 19),
(20, 4020, 50020, '2024-06-08', 20);


--DELIVERS
INSERT INTO DELIVERS (RecordID, StaffID)
VALUES
(01, 3001),
(02, 3002),
(03, 3003),
(04, 3004),
(05, 3005),
(06, 3006),
(07, 3007),
(08, 3008),
(09, 3009),
(10, 3010),
(11, 3011),
(12, 3012),
(13, 3013),
(14, 3014),
(15, 3015),
(16, 3016),
(17, 3017),
(18, 3018),
(19, 3019),
(20, 3020);


--R ALERGIES
INSERT INTO R_ALERGIES (RecipientID, AlergiesHistory)
VALUES
(4001, 'Peanuts'),
(4002, 'None'),
(4003, 'None'),
(4004, 'Shellfish'),
(4005, 'None'),
(4006, 'None'),
(4007, 'Penicillin'),
(4008, 'None'),
(4009, 'Peanuts'),
(4010, 'None'),
(4011, 'None'),
(4012, 'Shellfish'),
(4013, 'None'),
(4014, 'None'),
(4015, 'Penicillin'),
(4016, 'None'),
(4017, 'Peanuts'),
(4018, 'None'),
(4019, 'None'),
(4020, 'Shellfish');


--R MEDICAL CONDITIONS
INSERT INTO R_MEDICAL_CONDITIONS (RecipientID, MedicalConditions)
VALUES
(4001, 'None'),
(4002, 'Hypertension'),
(4003, 'Diabetes'),
(4004, 'None'),
(4005, 'Heart Disease'),
(4006, 'None'),
(4007, 'Cancer'),
(4008, 'Asthma'),
(4009, 'None'),
(4010, 'Hypertension'),
(4011, 'None'),
(4012, 'Diabetes'),
(4013, 'None'),
(4014, 'Heart Disease'),
(4015, 'Cancer'),
(4016, 'Asthma'),
(4017, 'None'),
(4018, 'Hypertension'),
(4019, 'Diabetes'),
(4020, 'None');


--R PRIVIOUS SURGERIES
INSERT INTO R_PRIVIOUS_SURGERIES (RecipientID, SurgeriesHistory)
VALUES
(4001, 'Appendectomy'),
(4002, 'None'),
(4003, 'Gallbladder removal'),
(4004, 'None'),
(4005, 'Heart bypass surgery'),
(4006, 'None'),
(4007, 'Cancer treatment'),
(4008, 'None'),
(4009, 'Appendectomy'),
(4010, 'None'),
(4011, 'Gallbladder removal'),
(4012, 'None'),
(4013, 'Heart bypass surgery'),
(4014, 'None'),
(4015, 'Cancer treatment'),
(4016, 'None'),
(4017, 'Appendectomy'),
(4018, 'None'),
(4019, 'Gallbladder removal'),
(4020, 'None');


--DONATES BLOOD
INSERT INTO DONATES_BLOOD (DonorID, DepartmentID)
VALUES
(1001, 1),
(1002, 2),
(1003, 3),
(1004, 4),
(1005, 5),
(1006, 6),
(1007, 7),
(1008, 8),
(1009, 9),
(1010, 10),
(1011, 11),
(1012, 12),
(1013, 13),
(1014, 14),
(1015, 15),
(1016, 16),
(1017, 17),
(1018, 18),
(1019, 19),
(1020, 20);


--EXAMINS
INSERT INTO EXAMINS (StaffID, TestID)
VALUES
(3001, 1),
(3002, 2),
(3003, 3),
(3004, 4),
(3005, 5),
(3006, 6),
(3007, 7),
(3008, 8),
(3009, 9),
(3010, 10),
(3011, 11),
(3012, 12),
(3013, 13),
(3014, 14),
(3015, 15),
(3016, 16),
(3017, 17),
(3018, 18),
(3019, 19),
(3020, 20);


--TESTS BLOOD
INSERT INTO TESTS_BLOOD (TestID, UnitID)
VALUES
(1, 50001),
(2, 50002),
(3, 50003),
(4, 50004),
(5, 50005),
(6, 50006),
(7, 50007),
(8, 50008),
(9, 50009),
(10, 50010),
(11, 50011),
(12, 50012),
(13, 50013),
(14, 50014),
(15, 50015),
(16, 50016),
(17, 50017),
(18, 50018),
(19, 50019),
(20, 50020);


--RECEIVES
INSERT INTO RECEIVES (RecordID, RecipientID, StaffID)
VALUES
(01, 4001, 3001),
(02, 4002, 3002),
(03, 4003, 3003),
(04, 4004, 3004),
(05, 4005, 3005),
(06, 4006, 3006),
(07, 4007, 3007),
(08, 4008, 3008),
(09, 4009, 3009),
(10, 4010, 3010),
(11, 4011, 3011),
(12, 4012, 3012),
(13, 4013, 3013),
(14, 4014, 3014),
(15, 4015, 3015),
(16, 4016, 3016),
(17, 4017, 3017),
(18, 4018, 3018),
(19, 4019, 3019),
(20, 4020, 3020);


--MEDICAL STAFF INVOLVED
INSERT INTO MEDICAL_STAFF_INVOLVED (RecordID, Staff)
VALUES
(01, 'John Doe'),
(02, 'Jane Smith'),
(03, 'Michael Johnson'),
(04, 'Emily Brown'),
(05, 'David Wilson'),
(06, 'Jennifer Taylor'),
(07, 'Matthew Martinez'),
(08, 'Jessica Anderson'),
(09, 'Daniel Thomas'),
(10, 'Sarah Garcia'),
(11, 'Christopher Hernandez'),
(12, 'Ashley Young'),
(13, 'Andrew King'),
(14, 'Lauren Lee'),
(15, 'Ryan Gonzalez'),
(16, 'Megan Perez'),
(17, 'James Robinson'),
(18, 'Amanda Lewis'),
(19, 'Joshua Walker'),
(20, 'Nicole Hall');


--INDECATION_FOR_TRANSFUSIONS
INSERT INTO INDECATION_FOR_TRANSFUSIONS (RecipientID, Indications)
VALUES
(4001, 'Anemia'),
(4002, 'Trauma'),
(4003, 'Surgery'),
(4004, 'Blood Disorder'),
(4005, 'Severe Injury'),
(4006, 'Transfusion Reaction'),
(4007, 'Complications from Previous Transfusion'),
(4008, 'Hemorrhage'),
(4009, 'Bone Marrow Disorder'),
(4010, 'Chemotherapy'),
(4011, 'Liver Disease'),
(4012, 'Organ Transplant'),
(4013, 'Autoimmune Disease'),
(4014, 'Dialysis'),
(4015, 'Sickle Cell Disease'),
(4016, 'HIV/AIDS'),
(4017, 'Leukemia'),
(4018, 'Myeloma'),
(4019, 'Liver Failure'),
(4020, 'Thrombocytopenia');


--BLOOD DISPOSAL DEPARTMENT
INSERT INTO BLOOD_DISPOSAL_DEPARTMENT (DepartmentID, HeadName, HeadID, QualityAssurance)
VALUES
(001, 'Dr. Alice Brown', 2001, 'Quality control procedures are in place.'),
(002, 'Dr. Bob Smith', 2002, 'Quality control procedures are in place.'),
(003, 'Dr. Carol Johnson', 2003, 'Quality control procedures are in place.'),
(004, 'Dr. Dave Davis', 2004, 'Quality control procedures are in place.'),
(005, 'Dr. Eve Wilson', 2005, 'Quality control procedures are in place.'),
(006, 'Dr. Frank Taylor', 2006, 'Quality control procedures are in place.'),
(007, 'Dr. Grace Moore', 2007, 'Quality control procedures are in place.'),
(008, 'Dr. Henry Jackson', 2008, 'Quality control procedures are in place.'),
(009, 'Dr. Irene Thomas', 2009, 'Quality control procedures are in place.'),
(0010, 'Dr. Jack White', 2010, 'Quality control procedures are in place.'),
(0011, 'Dr. Karen Harris', 2011, 'Quality control procedures are in place.'),
(0012, 'Dr. Larry Martin', 2012, 'Quality control procedures are in place.'),
(0013, 'Dr. Mary Garcia', 2013, 'Quality control procedures are in place.'),
(0014, 'Dr. Nick Martinez', 2014, 'Quality control procedures are in place.'),
(0015, 'Dr. Olivia Clark', 2015, 'Quality control procedures are in place.'),
(0016, 'Dr. Paul Rodriguez', 2016, 'Quality control procedures are in place.'),
(0017, 'Dr. Quinn Lewis', 2017, 'Quality control procedures are in place.'),
(0018, 'Dr. Rachel Lee', 2018, 'Quality control procedures are in place.'),
(0019, 'Dr. Sam Walker', 2019, 'Quality control procedures are in place.'),
(0020, 'Dr. Tina Young', 2020, 'Quality control procedures are in place.');



--DISPOSAL PROCEDURES
INSERT INTO DISPOSAL_PROCEDURES (DepartmentID, DisposalProcedures)
VALUES
(001, 'Incineration of blood bags and needles in dedicated facilities'),
(002, 'Disposal through autoclaving and shredding'),
(003, 'Chemical disinfection followed by disposal in medical waste containers'),
(004, 'Disposal in accordance with local regulations and guidelines'),
(005, 'High-temperature incineration with emissions control'),
(006, 'Sterilization using steam and disposal in biohazard waste containers'),
(007, 'Chemical treatment to denature blood components before disposal'),
(008, 'Separation of blood components followed by disposal in specialized containers'),
(009, 'Disposal through chemical neutralization and landfill deposition'),
(0010, 'Disposal in compliance with federal and state environmental regulations'),
(0011, 'Use of plasma-derived products followed by disposal of remaining components'),
(0012, 'Disposal through alkaline hydrolysis in accordance with biohazard protocols'),
(0013, 'Sterilization using gamma irradiation followed by safe disposal'),
(0014, 'Disposal through encapsulation in concrete and burial in designated areas'),
(0015, 'Utilization of blood fractionation techniques prior to disposal'),
(0016, 'Disposal in secure landfills designed for hazardous medical waste'),
(0017, 'Chemical treatment to deactivate bloodborne pathogens before disposal'),
(0018, 'Incineration using high-efficiency furnaces with pollution control measures'),
(0019, 'Disposal through encapsulation in biodegradable polymers for landfill deposition'),
(0020, 'Use of enzymatic digestion methods for blood component breakdown and disposal');


--BLOOD EXECUTION
INSERT INTO BLOOD_EXECUTION (UnitID, InventoryID, DepartmentID)
VALUES
(50001, 1, 001),
(50002, 2, 002),
(50003, 3, 003),
(50004, 4, 004),
(50005, 5, 005),
(50006, 6, 006),
(50007, 7, 007),
(50008, 8, 008),
(50009, 9, 009),
(50010, 10, 0010),
(50011, 11, 0011),
(50012, 12, 0012),
(50013, 13, 0013),
(50014, 14, 0014),
(50015, 15, 0015),
(50016, 16, 0016),
(50017, 17, 0017),
(50018, 18, 0018),
(50019, 19, 0019),
(50020, 20, 0020);

select UserName, Password from MEDICAL_STAFF Where UserName = 'Alice.Brown' and Password = 'password123'; --check if username and password are stored in database ex: username = Alice.Brown and password = password123

select FName, LName from MEDICAL_STAFF Where UserName = 'Alice.Brown'; --return name of dr with specific username ex: Alice.Brown

select count(UnitID) from BLOOD_UNIT where UnitID not in (select UnitID from BLOOD_EXECUTION); --return number of avaliable units

select count(UnitID) from BLOOD_EXECUTION; --return number of disposal units

select DONOR.FName, DONOR.LName, DONOR.DonationDate, DONOR.DonationAmount, DONOR.BloodType, DONOR.RH_Factor, BLOOD_DISPOSAL_DEPARTMENT.HeadName from BLOOD_DISPOSAL_DEPARTMENT, DONOR, BLOOD_UNIT, BLOOD_EXECUTION where (BLOOD_UNIT.UnitID in (select BLOOD_EXECUTION.UnitID from BLOOD_EXECUTION)) and (BLOOD_UNIT.DonorID = DONOR.NationalID) and (BLOOD_DISPOSAL_DEPARTMENT.DepartmentID = BLOOD_EXECUTION.DepartmentID and BLOOD_UNIT.UnitID = BLOOD_EXECUTION.UnitID) --return details of disposal units

select DONOR.FName, DONOR.LName, DONOR.DonationDate, DONOR.DonationAmount, DONOR.BloodType, DONOR.RH_Factor, BLOOD_BANK.HeadName, BLOOD_BANK.Location from BLOOD_BANK, DONOR, BLOOD_UNIT, INVENTORY where (BLOOD_UNIT.UnitID not in (select BLOOD_EXECUTION.UnitID from BLOOD_EXECUTION)) and (BLOOD_UNIT.DonorID = DONOR.NationalID) and (BLOOD_UNIT.InventoryID = BLOOD_BANK.DepartmentID and BLOOD_UNIT.UnitID = INVENTORY.UnitID) --return details of avaliable units

--insert new donor data
INSERT INTO DONOR (NationalID, FName, LName, Gender, BirthDate, City, Government, DonationAmount, DonationDate, BloodType, RH_Factor, DateOfLastDonation)
VALUES
(100005, 'Toni', 'Kross', 'Male', '1990-01-04', 'Greifswald', 'Mecklenburg Vorpommern', 500, '2024-05-21', 'O', '+', '2024-01-15');
INSERT INTO PHONE (DonorID, PhoneNumber)
VALUES
(100005, 111222333),
(100005, 111333222);
INSERT INTO EMAIL (DonorID, EMail)
VALUES
(100005, 'tk8rm@example.com'),
(100005, 'tk39bm@example.com');
INSERT INTO EMERGENCY_CONTACT (DonorID, FName, LName, PhoneNumder, City, Government)
VALUES
(100005, 'Luka', 'Modric', 100006, 'Zadar', 'Zadar');

--insert new unit
INSERT INTO BLOOD_UNIT (UnitID, DonorID, BloodType, DonationDate, RH_Factor, ExpirationDate, InventoryID, StorageCondition)
VALUES
(51000, 100005, 'O', '2024-05-21', '+', '2024-06-26', 1, 'Refrigerated');

select count(*) from DONOR, BLOOD_UNIT, MEDICAL_STAFF where BLOOD_UNIT.InventoryID = MEDICAL_STAFF.DepartmentID and MEDICAL_STAFF.UserName = 'Alice.Brown' and BLOOD_UNIT.DonorID = DONOR.NationalID --return num of units that a current medical staff worked on ex: Alice.Brown

select DONOR.FName, DONOR.LName, BLOOD_UNIT.DonationDate from DONOR, BLOOD_UNIT, MEDICAL_STAFF where BLOOD_UNIT.InventoryID = MEDICAL_STAFF.DepartmentID and MEDICAL_STAFF.UserName = 'Alice.Brown' and BLOOD_UNIT.DonorID = DONOR.NationalID --return details of units that a current medical staff worked on ex: Alice.Brown
