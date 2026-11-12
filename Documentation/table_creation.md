# IBM Data Engineering Capstone – Module 1

## Task 1: Create the Sales Database

**SQL Statements:**

```sql
CREATE DATABASE sales;

USE sales;

CREATE TABLE sales_data (
    product_id INTEGER,
    customer_id INTEGER,
    price DECIMAL(10,2),
    quantity INTEGER,
    `timestamp` DATETIME
);

SHOW TABLES;
```

**Purpose:**
- `CREATE DATABASE` creates the sales database.
- `USE sales` selects the database.
- `CREATE TABLE` creates the sales_data table and defines its columns and data types.
- `SHOW TABLES` displays the tables inside the selected database.

**Result:** Database and table created successfully.

---

## Task 2: Import CSV Data and Count Records

The provided `oltpdata.csv` file was imported into the `sales_data` table using DBeaver's Import Data wizard.

**SQL Statements:**

```sql
USE sales;

SELECT COUNT(*)
FROM sales_data;
```

**Output:**

```text
2604
```

**Result:** 2,604 records successfully imported into the sales_data table.

---

## Task 3: Create and Verify an Index

**SQL Statement:**

```sql
CREATE INDEX ts
ON sales_data (`timestamp`);
```

**Purpose:**

Created an index named `ts` on the `timestamp` column to help MySQL locate records more efficiently when searching or filtering by timestamp.

**Verification SQL:**

```sql
SHOW INDEX FROM sales_data;
```

**Verification Output:**

- Table: sales_data
- Key_name: ts
- Column_name: timestamp
- Index_type: BTREE

**Result:** Index created and verified successfully.
