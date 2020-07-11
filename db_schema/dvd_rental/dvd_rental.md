# PostgreSQL Sample Database Tables

There are 15 tables in the DVD Rental database:

actor – stores actors data including first name and last name.
film – stores films data such as title, release year, length, rating, etc.
film_actor – stores the relationships between films and actors.
category – stores film’s categories data.
film_category- stores the relationships between films and categories.
store – contains the store data including manager staff and address.
inventory – stores inventory data.
rental – stores rental data.
payment – stores customer’s payments.
staff – stores staff data.
customer – stores customers data.
address – stores address data for staff and customers
city – stores the city names.
country – stores the country names.

https://www.postgresqltutorial.com/postgresql-sample-database/

---

# Steps

- CREATE DATABASE dvdrental; (Run in pgadmin)
- Using CLI to pg-restore from .tar file (RUNNING pg_restore COMMAND to restore dump file from host-machine)

  - SYNTAX : docker exec -i container_name pg_restore -U postgres_user -v -d database_name < /dir_backup_outside_container/file_name.tar
  - docker exec -i postgres-server pg_restore -U postgres -v -d dvdrental < /home/tejas/tejas/workspace/vsc/db_sql_practice/db_schema/dvd_rental/dvdrental.tar

- \$ docker container latest
- \$ docker container exec -it postgres-server /bin/bash
  (Jumping into running postgress-server container using bin-bash)
- \$ postgres --version
- \$ psql -U postgres (psql client to run sql queries)
  postgres=# SELECT 1;

(or)

- \$ docker exec -it postgres-server psql -U postgres -W dvdrental
- \$ \dt

---
