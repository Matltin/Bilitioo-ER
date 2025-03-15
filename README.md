# Bilitioo-ER

## 📖 Overview
Welcome to Bilitioo, the ultimate platform for booking train, bus, and airplane tickets for all your internal travel needs. Whether you're planning a quick getaway, a business trip, or a long-distance journey, Bilitioo makes it easy to find and book the best travel options in just a few clicks.

## 🛠️ Technologies Used
- **Databased:** Postgresql
- **Schema Modeling:** [DBML](https://dbml.dbdiagram.io/home)

## 📋 Database Schema
This project uses **DBML** for database schema design. Below is the schema generated from [dbdiagram.io](https://dbdiagram.io), and uses [draw.io](https://app.diagrams.net), [lucidchart](https://lucid.app/documents/#/home) for design ERD

### Diagram 
you can find uml [here](https://dbdocs.io/ma1383ahmadi/Bilitioo_ER)

### 1. Install dbdocs via terminal

First, ensure that `npm` is installed on your Linux system:

```sh
sudo apt update
sudo apt install npm -y

sudo npm install -g dbdocs

dbdocs --version
```

### 2. Define your database with DBML
``` sh
database.dbml
```

### 3. Login to dbdocs
``` sh
$ dbdocs login
? Choose a login method: Email
? Your email: <your email address>
✔ Request email authentication
? Please input OTP code sent to the email:
```

### 4. Generate dbdocs project
``` sh
$ dbdocs build <path to your dbml file>/database.dbml --project Ecommerce
Pushing new database schema to project Ecommerce...
✔ Done. Visit: https://dbdocs.io/khanh-tran-quoc/Ecommerce
```
