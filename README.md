# Bilitioo-ER

# 🌍 Travel Reservation System Database Schema  

## 📖 Overview
Welcome to Bilitioo, the ultimate platform for booking train, bus, and airplane tickets for all your internal travel needs. Whether you're planning a quick getaway, a business trip, or a long-distance journey, Bilitioo makes it easy to find and book the best travel options in just a few clicks.

## 🛠️ Technologies Used
- **Databased:** Postgresql
- **Schema Modeling:** [DBML](https://dbml.dbdiagram.io/home)

## 📋 Database Schema
This project uses **DBML** for database schema design. Below is the schema generated from [dbdiagram.io](https://dbdiagram.io), and uses [draw.io](https://app.diagrams.net), [lucidchart](https://lucid.app/documents/#/home) for design ERD

### Diagram 
you can find uml [here](https://dbdocs.io/ma1383ahmadi/Bilitioo_ER)


---

## 📖 Table of Contents  
- [📑 Enums](#-enums)  
- [🗄 Tables](#-tables)  
- [🔗 Relationships](#-relationships)  
- [⚡️ Indexes](#-indexes)  
- [🚀 Usage](#-usage)  
- [📜 License](#-license)  

---

## 🔢 Enums  
The schema uses ENUMs to standardize values for specific fields:  

| Category         | Values  |
|----------------------|------------|
| User Role        | ADMIN, USER  |
| User Status      | ACTIVE, NON-ACTIVE  |
| Payment Type     | CASH, CREDIT_CARD, WALLET, BANK_TRANSFER, CRYPTO  |
| Ticket Status    | RESERVED, RESERVING, CANCELED, CANCELED-BY-TIME  |
| Payment Status   | PENDING, COMPLETED, FAILED, REFUNDED  |
| Vehicle Type     | BUS, TRAIN, AIRPLANE  |
| Flight Class     | ECONOMY, PREMIUM-ECONOMY, BUSINESS, FIRST  |
| Activity Status  | PENDING, REMINDER-SENT, PURCHASED  |
| Notification Log | SENT, FAILED  |

---

## 🗄 Tables  

### 👤 User Management  
- `user` → Stores authentication data (email, phone, password, role, status).  
- `profile` → Stores user details (name, city, national code).  
- `report` → Logs user reports & admin responses.  

### 🎟 Reservation & Ticketing  
- `reservation` → Manages reservations (user, ticket, payment, status).  
- `ticket` → Holds ticket details (vehicle, seat, route, departure/arrival time, price).  
- `payment` → Manages payment transactions (type, status, details).  
- `admin_change_reservation` → Tracks admin changes to reservations.  

### 🚏 Travel Information  
- `route` → Stores route details (origin, destination, terminals).  
- `city` → Stores city details (province, county).  
- `terminal` → Stores terminal information (name, address).  

### 🚍 Vehicles & Seating  
- `company` → Stores transportation company details.  
- `vehicle` → Stores vehicle details (company, capacity, features).  
- `bus, train, airplane` → Store specific details for each vehicle type.  
- `seat` → Stores seat details (vehicle, seat number, availability).  
- `bus_seat, train_seat, airplane_seat` → Specialized seat details per vehicle type.  

### ⚡️ Additional Features  
- `penalty` → Tracks penalties for vehicles.  
- `user_activity` → Logs user interactions (route, vehicle type, status).  
- `notification_log` → Tracks notifications sent to users.  
- `send_email_sms` → Logs sent emails & SMS messages.  
- `send_verification_code` → Stores verification codes sent to users.  

---

## 🔗 Relationships  

| Table | Related To |
|-----------|---------------|
| profile | user (user_id) |
| report | user (both user & admin) |
| reservation | user, ticket, payment |
| ticket | vehicle, seat, route |
| route | city, terminal |
| vehicle | company |
| seat | vehicle |
| user_activity | user, route |
| notification_log | user, send_email_sms, user_activity |
| send_verification_code | user, send_email_sms |

---

## ⚡️ Indexes  

To enhance query performance, indexes are applied to:  

- ✅ `email`, `phone_number` → in user table  
- ✅ `user_id` → in profile table  
- ✅ `route_id`, `departure_time` → in ticket table  
- ✅ `origin_city_id`, `destination_city_id` → in route table  

---

## 🚀 Usage  

This schema supports a full-featured travel reservation system, allowing users to:  
✔️ Book tickets  
✔️ Make payments  
✔️ Manage reservations  
✔️ Receive notifications  

For detailed SQL queries and implementation, refer to the provided SQL scripts.  

---


