
#!/bin/bash

docker exec ibm-mysql sh -c 'mysqldump -uroot -p"$MYSQL_ROOT_PASSWORD" sales sales_data' > sales_data.sql
