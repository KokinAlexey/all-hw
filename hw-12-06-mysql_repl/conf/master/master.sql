CREATE DATABASE test_db;
CREATE USER 'repl'@'%' IDENTIFIED BY 'slavepass';
GRANT REPLICATION SLAVE ON *.* TO 'repl'@'%';
SET GLOBAL caching_sha2_password_allow_insecure_plaintext_password = ON;
