-- 1. Doctors Table
CREATE TABLE Doctors (
    DoctorID INTEGER PRIMARY KEY AUTOINCREMENT,
    DoctorName TEXT NOT NULL,
    Specialization TEXT
);

-- 2. Patients Table
CREATE TABLE Patients (
    PatientID INTEGER PRIMARY KEY AUTOINCREMENT,
    Name TEXT NOT NULL,
    Age INTEGER NOT NULL,
    TokenNo TEXT UNIQUE NOT NULL,
    Disease TEXT,
    DoctorID INTEGER,
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

-- 3. Medicines Table
CREATE TABLE Medicines (
    MedicineID INTEGER PRIMARY KEY AUTOINCREMENT,
    MedicineName TEXT NOT NULL
);

-- 4. Prescriptions Table (Many-to-many between Patients and Medicines)
CREATE TABLE Prescriptions (
    PrescriptionID INTEGER PRIMARY KEY AUTOINCREMENT,
    PatientID INTEGER,
    MedicineID INTEGER,
    Dosage TEXT,
    Frequency TEXT,
    Duration TEXT,
    Notes TEXT,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (MedicineID) REFERENCES Medicines(MedicineID)
);

-- 5. Billing Table
CREATE TABLE Billing (
    BillID INTEGER PRIMARY KEY AUTOINCREMENT,
    PatientID INTEGER,
    Amount REAL NOT NULL,
    Status TEXT CHECK(Status IN ('Paid', 'Pending')),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);

-- Insert Doctors
INSERT INTO Doctors (DoctorName, Specialization) VALUES 
('Dr. Williams', 'Cardiology'),
('Dr. Smith', 'Endocrinology'),
('Dr. Johnson', 'Pulmonology');

-- Insert Patients
INSERT INTO Patients (Name, Age, TokenNo, Disease, DoctorID) VALUES 
('John Smith', 45, 'TK-1024', 'Hypertension', 1),
('Sarah Johnson', 32, 'TK-1025', 'Diabetes', 2),
('Michael Brown', 58, 'TK-1026', 'Asthma', 3),
('Emily Davis', 29, 'TK-1027', 'Migraine', 1),
('Robert Wilson', 64, 'TK-1028', 'Arthritis', 2);

-- Insert Medicines
INSERT INTO Medicines (MedicineName) VALUES 
('Lisinopril'),
('Metformin'),
('Albuterol'),
('Sumatriptan'),
('Ibuprofen'),
('Hydrochlorothiazide');

-- Insert Prescriptions
INSERT INTO Prescriptions (PatientID, MedicineID, Dosage, Frequency, Duration, Notes) VALUES
(1, 1, '10mg', '1x daily', '30 days', 'Take AM'),
(1, 6, '12.5mg', '1x daily', '30 days', 'Take AM');

-- Insert Billing
INSERT INTO Billing (PatientID, Amount, Status) VALUES
(1, 150, 'Paid'),
(2, 200, 'Paid'),
(3, 125, 'Pending'),
(4, 175, 'Paid'),
(5, 90, 'Pending');

SELECT 
    p.PatientID AS SNo,
    p.Name AS PatientName,
    p.Age,
    p.TokenNo,
    p.Disease,
    d.DoctorName,
    GROUP_CONCAT(m.MedicineName, ', ') AS Medicines,
    b.Amount AS BillAmount,
    b.Status
FROM Patients p
LEFT JOIN Doctors d ON p.DoctorID = d.DoctorID
LEFT JOIN Prescriptions pr ON p.PatientID = pr.PatientID
LEFT JOIN Medicines m ON pr.MedicineID = m.MedicineID
LEFT JOIN Billing b ON p.PatientID = b.PatientID
GROUP BY p.PatientID;



