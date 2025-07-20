# Hospital-Management-System

Overview:

This project is a Hospital Management System Dashboard that visually manages and displays detailed patient information such as doctor assignments, diseases, medicines, billing status, and prescriptions. The goal is to provide a colorful, responsive, and professional medical dashboard using web technologies.

Objectives:

  1. Store and manage patient details, doctor info, diseases, and prescriptions

  2. Display real-time patient stats and medical reports in a visual format

  3. Enable data filtering, billing tracking, and prescription viewing

  4. Provide a clean, animated, and user-friendly frontend design

  5. Normalize data for efficient querying using SQL backend

Key Features:

  1. Medical-themed dashboard with stethoscope, injection, and doctor visuals

  2. Total stats cards for patients, doctors, and today's appointments

  3. Searchable and filterable patient table with status indicators

  4. Interactive prescription pad for individual patients

  5. Quick actions (add appointment, generate bill, view report)

  6. Animated floating elements for modern UI engagement

  7. Fully responsive layout for all device sizes

Project Structure: 

Database Design Entities:

   Patients

   Doctors

   Medicines

   Prescriptions

   Billing

Interrelations:

  1. Each prescription links to one patient and one or more medicines

  2. Each patient is linked to one doctor

  3. Each billing record is linked to one patient

  4. All foreign key relations are enforced to maintain referential integrity

Frontend Design:

  1. Built using HTML5, CSS, and JavaScript

  2. Includes animated visuals (stethoscope, floating pills, doctor illustrations)

  3. Stats cards and table rendered with real data

  4. Prescription section mimics a real doctor’s pad layout

  5. Search and filter options for patient management

Methodology:

🔹 Data Modeling & Normalization

  1. Structured using 3rd Normal Form (3NF)

  2. Primary and Foreign Keys for relationships

  3. Modeled using dbdiagram.io

🔹 Data Population

  Seeded with sample records for:

  1. 5 patients

  2. 3 doctors

  3. Medicines and prescription info

  4. Bill amounts and payment status

🔹 SQL Backend (SQLite)

 Built using DB Browser for SQLite

 Sample SQL Queries:

  1. Get all patients and their doctor, medicine, bill status

  2. Filter by doctor name or payment status

  3. Search patients by name or token number

Technologies Used:

| Layer       | Tools Used                          |
| ----------- | ----------------------------------- |
| Frontend    | HTML5, Tailwind CSS, JavaScript     |
| Animations  | Tailwind transitions, CSS Keyframes |
| Backend     | SQLite / DB Browser for SQLite      |
| ER Modeling | dbdiagram.io                        |
| Assets      | PNG & SVG illustrations (medical)   |

Use Case:

A hospital administrator wants to view all patients with pending bills under Dr. Smith. They can filter patients on the dashboard using the dropdown and instantly view the matching data. They can also print prescriptions or generate bills using the quick action buttons.

