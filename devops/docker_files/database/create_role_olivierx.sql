CREATE ROLE olivierx LOGIN;
ALTER ROLE olivierx CREATEDB;
CREATE DATABASE perso OWNER olivierx;
ALTER ROLE olivierx WITH ENCRYPTED PASSWORD 'XXXX';
GRANT ALL PRIVILEGES ON DATABASE perso TO olivierx;