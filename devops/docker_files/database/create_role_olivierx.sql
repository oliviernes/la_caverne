CREATE ROLE olivierx LOGIN;
ALTER ROLE olivierx CREATEDB;
ALTER DATABASE perso OWNER TO olivierx;
ALTER ROLE olivierx WITH ENCRYPTED PASSWORD 'XXXX';
GRANT ALL PRIVILEGES ON DATABASE perso TO olivierx;