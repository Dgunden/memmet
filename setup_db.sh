su - postgres && psql -c "CREATE ROLE vagrant WITH CREATEDB LOGIN PASSWORD password" && psql -c "CREATE DATABASE memmet"
