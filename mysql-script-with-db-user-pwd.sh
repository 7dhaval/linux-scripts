#!/bin/bash 
echo "Enter dbname:"
read DBNAME
docker exec mysqll  mysql -u root  -pkA8HTxn7gXbwSEpgUuT8ZkzNqGZZwEQD -e "create database $DBNAME;"
echo "Enter username:"
read USERNAME
echo "Enter password:"
read PASSWORD
docker exec mysqll  mysql -u root  -pkA8HTxn7gXbwSEpgUuT8ZkzNqGZZwEQD -e "create user '$USERNAME'@'%' identified by '$PASSWORD';"
sleep 5
docker exec mysqll  mysql -u root  -pkA8HTxn7gXbwSEpgUuT8ZkzNqGZZwEQD -e "grant all privileges on $DBNAME.* to '$USERNAME'@'%';"
docker exec mysqll  mysql -u root  -pkA8HTxn7gXbwSEpgUuT8ZkzNqGZZwEQD -e "flush privileges;"
