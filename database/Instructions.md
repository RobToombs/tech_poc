Build a postgres database image from database Dockerfile

1. Bring up a console and locate the 'quarkus_poc/database' folder, then run the following command

    `docker build -t postgres-db .`


2. Verify that the image has been created

    `docker image list -a`


3. Create a Docker container from our new image

    `docker create -p 5432:5432 --name postgres-db postgres-db`

    This creates a container where the container's TCP port 5432 will be mapped to port 5432 on the Docker host. For clarity, -p 8080:80 would map TCP port 80 in the container to port 8080 on the Docker host.


4. Verify that the container has been created

    `docker container list -a`


5. Start our Postgres DB container

    `docker start postgres-db`


6. Verify that the container has started

    `docker container list -a`


7. Stop your docker container
   
    `docker stop postgres-db`