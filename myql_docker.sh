function mysql(){
docker run --name  mysql  -e MYSQL_ROOT_PASSWORD=admin -d -p=3306:3306 mysql

# docker-proxy process allocates port 3306 to forward traffic to container
netstat -tulpn | grep 3306
docker port $1

# starting container
docker start mysql

# going to bash shell of container
docker exec -i -t mysql /bin/bash 

# removing unused docker containers

# cool way to remove containers which are unused  for weeks
##docker ps -a | grep 'weeks ago' | awk '{print $1}' | xargs --no-run-if-empty docker rm
}

mysql