\# MongoDB: Querying Data in NoSQL Databases



\## Project Overview



This project demonstrates how to work with a NoSQL database using MongoDB. The exercise uses an e-commerce product catalogue containing information about electronic products.



The objective was to import JSON data into MongoDB, explore the stored documents, perform queries and aggregations, and export selected fields into a CSV file.



\## Tools and Technologies



\- MongoDB 8.0

\- MongoDB Shell (mongosh)

\- MongoDB Database Tools (mongoimport and mongoexport)

\- Docker

\- Git Bash



\## Dataset



\*\*Source file:\*\* `catalog.json`



The dataset contains 438 product documents with the following fields:



\- `type` – Product category

\- `model` – Product model

\- `screen size` – Product screen size



\## Tasks and Implementation



\### 1. Importing JSON Data



Imported the JSON dataset into a MongoDB database named `electronics`, using a collection also named `electronics`.



\*\*Result:\*\* 438 documents imported successfully.



\### 2. Exploring the Database



Used MongoDB commands to:



\- List available databases.

\- Switch to the `electronics` database.

\- List collections.

\- Retrieve the first five documents.



\### 3. Querying Documents



\*\*Count laptops:\*\*



```javascript

db.electronics.countDocuments({ type: "laptop" })

```



Result: 389 laptops.



\*\*Count smartphones with a 6-inch screen:\*\*



```javascript

db.electronics.countDocuments({

&#x20; type: "smart phone",

&#x20; "screen size": 6

})

```



Result: 8 smartphones.



\### 4. Aggregation



Calculated the average screen size of smartphones using MongoDB's aggregation pipeline.



```javascript

db.electronics.aggregate(\[

&#x20; { $match: { type: "smart phone" } },

&#x20; { $group: { \_id: null, averageScreenSize: { $avg: "$screen size" } } }

])

```



Result: 6 inches.



\### 5. Exporting Data



Used `mongoexport` to export selected fields from the collection into CSV format.



\*\*Exported fields:\*\*

\- `\_id`

\- `type`

\- `model`



\*\*Output file:\*\* `electronics.csv`



\## Key Learning Outcomes



\- Understanding the difference between relational and NoSQL databases.

\- Working with MongoDB databases, collections, and documents.

\- Importing newline-delimited JSON data using `mongoimport`.

\- Retrieving and filtering documents using MongoDB queries.

\- Counting documents that match specified conditions.

\- Using aggregation stages such as `$match` and `$group`.

\- Calculating averages using `$avg`.

\- Exporting selected document fields into CSV using `mongoexport`.



\## Project Files



| File | Description |

|---|---|

| `catalog.json` | Original product catalogue dataset |

| `electronics.csv` | Exported MongoDB data |



\## Conclusion



This exercise provided practical experience working with MongoDB as a NoSQL database for product catalogue data. It covered the process of importing, querying, aggregating, and exporting data within a Docker-based local environment.

