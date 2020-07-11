# Restore Schema

- CREATE DATABASE hr;(Run in pg admin)
- CREATE SCHEMA public; (If not present)
- RUNNING PSQL COMMAND to restore dump file from host-machine
  - docker exec -i postgres-server psql -U postgres -d dev < /home/tejas/tejas/workspace/vsc/db_sql_practice/db_schema/hr/pgex/pgex_backup.pgsql
- To delete all tables form a particular schema
  - DROP SCHEMA public CASCADE;
  - CREATE SCHEMA public;
  - GRANT ALL ON SCHEMA public TO postgres;
  - GRANT ALL ON SCHEMA public TO public;
