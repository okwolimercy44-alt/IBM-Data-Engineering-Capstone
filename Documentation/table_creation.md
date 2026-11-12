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

## Task 4: Exporting MySQL Data Using a Bash Script

### Objective
Create a Bash script that exports the `sales_data` table from the MySQL database into an SQL file saved on the local computer.

### Step 1: Create the Bash Script

Created a file named `datadump.sh` inside the local project repository.

### Step 2: Write the Script

```bash
#!/bin/bash

docker exec ibm-mysql sh -c 'mysqldump -uroot -p"$MYSQL_ROOT_PASSWORD" sales sales_data' > sales_data.sql
```

### Step 3: Understand the Command

- `#!/bin/bash` specifies that Bash should interpret the script.
- `docker exec ibm-mysql` runs a command inside the running MySQL container.
- `mysqldump` exports the database table structure and its data.
- `sales sales_data` specifies the database and table to export.
- `>` redirects the exported SQL output into a file named `sales_data.sql` on the local computer.

### Step 4: Execute the Script

Ran the following command in Git Bash:

```bash
bash datadump.sh
```

### Step 5: Verify the Export

Used the following command to confirm that the SQL file was created:

```bash
ls -lh sales_data.sql
```

**Output:**

```text
-rw-r--r-- 1 Mercy 197121 172K Nov 12 11:21 sales_data.sql
```

The output confirmed that `sales_data.sql` was successfully generated in the local project repository.

### What I Learned

This task introduced me to basic automation using Bash scripts.

Instead of manually entering the MySQL container to export data, I created a reusable script that coordinates the process:

1. Git Bash executes the script.
2. Docker runs the export command inside the MySQL container.
3. MySQL's `mysqldump` utility extracts the table structure and data.
4. Bash redirects the output into an SQL file saved on my local computer.

**Important:** The script runs when I execute it manually using `bash datadump.sh`. It does not automatically run whenever new records are added. I must execute it again to generate
