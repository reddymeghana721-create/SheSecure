# SheSecure Database

Professional database system for **SheSecure**, a women’s safety platform designed for emergency assistance, SOS alerts, trusted contacts, live location sharing, unsafe area reporting, communication, and complaint management.

---

## Tech Stack

* MySQL / PostgreSQL
* Firebase (Realtime Features)
* Backend API Integration Ready

---

## Project Structure

```bash id="q4g0w2"
database/
├── schema/
│   ├── 001_users.sql
│   ├── 002_trusted_contacts.sql
│   ├── 003_sos_alerts.sql
│   ├── 004_live_locations.sql
│   ├── 005_unsafe_area_reports.sql
│   ├── 006_chats.sql
│   ├── 007_complaints.sql
│   └── 008_admins.sql
├── migrations/
├── seed/
└── README.md
```

---

## Main Tables

* **users** – User registration and authentication
* **trusted_contacts** – Emergency contact records
* **sos_alerts** – SOS trigger logs and status
* **live_locations** – Real-time location records
* **unsafe_area_reports** – Safety issue reports
* **chats** – Messaging records
* **complaints** – Complaint tracking system
* **admins** – Administrative access control

---

## Setup Instructions

```sql id="q6sbn0"
CREATE DATABASE shesecure_db;
USE shesecure_db;
```

Run all SQL schema files in sequence from the `schema/` folder.

---

## Security Standards

* Passwords stored in hashed format
* Foreign key constraints enabled
* Prepared statements recommended
* Secure role-based access support

---

## Purpose

This database is designed to support a scalable and secure women’s safety application with efficient emergency response features.

