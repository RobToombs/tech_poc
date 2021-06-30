#!/bin/sh

docker stop postgres-db
docker rm postgres-db

cd database
docker build -t postgres-db .
docker create -p 5432:5432 --name postgres-db postgres-db
docker start postgres-db


