# docker-mysql
DockerでmySQLを

% docker pull mysql
Using default tag: latest
latest: Pulling from library/mysql
Digest: sha256:4fcf5df6c46c80db19675a5c067e737c1bc8b0e78e94e816a778ae2c6577213d
Status: Image is up to date for mysql:latest
docker.io/library/mysql:latest

% docker run -it --name test-world-mysql -e MYSQL_ROOT_PASSWOED=mysql -d mysql:latest
62877f31f6492aa5a5e0de9c578aedc1f439361bdb04a22373d6529b0cca2b80

% mysql -u root -p -h 127.0.0.1
Enter password:
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 15
Server version: 8.0.26 MySQL Community Server - GPL

Copyright (c) 2000, 2021, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> mysql
mysql> exit
Bye

% docker run -it --name test-world-mysql -e MYSQL_ROOT_PASSWORD=mysql -d mysql:latest
5f82967e343c7a1a6dd6f5f6d8bd701b1a434c48994ad0333c45c026f2927b06

% docker exec -it test-world-mysql bash -p
root@5f82967e343c:/# mysql -u root -p -h 127.0.0.1
Enter password:
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.26 MySQL Community Server - GPL

Copyright (c) 2000, 2021, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
version: "3"
affiliates. Other names may be trademarks of their respective
owners.

-- MySQL dump 10.13 Distrib 5.1.51, for pc-linux-gnu (i686)
Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

FROM mysql
mysql> mysql
[mysqld]
    -> ^C
mysql> exit
Bye
root@5f82967e343c:/# exit
exit
onokishio@KishionoMacBook-Pro ~ % mkdir Docker-Compose
onokishio@KishionoMacBook-Pro ~ % cd Docker-Compose
onokishio@KishionoMacBook-Pro Docker-Compose % mkdir docker-mysql
onokishio@KishionoMacBook-Pro Docker-Compose % cd docker-mysql
onokishio@KishionoMacBook-Pro docker-mysql % mkdir mysql
onokishio@KishionoMacBook-Pro docker-mysql % cd mysql
onokishio@KishionoMacBook-Pro mysql % mkdir DB
onokishio@KishionoMacBook-Pro mysql % cd DB
onokishio@KishionoMacBook-Pro DB % cd ../
onokishio@KishionoMacBook-Pro mysql % cd ../
onokishio@KishionoMacBook-Pro docker-mysql % cd ../
onokishio@KishionoMacBook-Pro Docker-Compose % cd docker-mysql
onokishio@KishionoMacBook-Pro docker-mysql % vim docker-compose.yml
onokishio@KishionoMacBook-Pro docker-mysql % cd mysql
onokishio@KishionoMacBook-Pro mysql % cd DB
onokishio@KishionoMacBook-Pro DB % vim world.sql
onokishio@KishionoMacBook-Pro DB % cd ../
onokishio@KishionoMacBook-Pro mysql % vim Dockerfile
onokishio@KishionoMacBook-Pro mysql % vim my.cnf
onokishio@KishionoMacBook-Pro mysql % cd ../

docker-mysql % Docker-Compose build
Building mysql
[+] Building 0.4s (7/7) FINISHED
 => [internal] load build definition from Dockerfile                       0.0s
 => => transferring dockerfile: 122B                                       0.0s
 => [internal] load .dockerignore                                          0.0s
 => => transferring context: 2B                                            0.0s
 => [internal] load metadata for docker.io/library/mysql:latest            0.0s
 => [internal] load build context                                          0.1s
 => => transferring context: 142B                                          0.0s
 => [1/2] FROM docker.io/library/mysql                                     0.2s
 => [2/2] ADD ./my.cnf /etc/mysql/conf.d/my.cnf                            0.1s
 => exporting to image                                                     0.0s
 => => exporting layers                                                    0.0s
 => => writing image sha256:6a7df381ebc376080b87627b0b65535930ddc891282ee  0.0s
 => => naming to docker.io/library/original_mysql_world                    0.0s
Successfully built 6a7df381ebc376080b87627b0b65535930ddc891282ee6af3142577ba8db4c73

docker-mysql % Docker-Compose up -d
Creating network "docker-mysql_default" with the default driver
Creating docker-mysql_mysql_1 ... done

docker-mysql % Docker-Compose build
Building mysql
[+] Building 0.2s (7/7) FINISHED
 => [internal] load build definition from Dockerfile                       0.0s
 => => transferring dockerfile: 111B                                       0.0s
 => [internal] load .dockerignore                                          0.0s
 => => transferring context: 2B                                            0.0s
 => [internal] load metadata for docker.io/library/mysql:latest            0.0s
 => [internal] load build context                                          0.0s
 => => transferring context: 27B                                           0.0s
 => CACHED [1/2] FROM docker.io/library/mysql                              0.0s
 => [2/2] ADD ./my.cnf /mysql/my.cnf                                       0.0s
 => exporting to image                                                     0.0s
 => => exporting layers                                                    0.0s
 => => writing image sha256:68e416b61e5ebd7d77e9f90895fea3b98c7b38c480efc  0.0s
 => => naming to docker.io/library/original_mysql_world                    0.0s
Successfully built 68e416b61e5ebd7d77e9f90895fea3b98c7b38c480efc4b0151ec9753c458203

docker-mysql % Docker-Compose up -d
Recreating docker-mysql_mysql_1 ... done

docker-mysql % docker exec -it test-world-mysql bash -p
version: "3"
root@5f82967e343c:/# mysql -u root -p -h 127.0.0.1
Enter password:
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 9
Server version: 8.0.26 MySQL Community Server - GPL

    build: ./mysql/
Copyright (c) 2000, 2021, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> ^C
mysql> ^C
mysql> exit
Bye
root@5f82967e343c:/# exit
exit

docker-mysql % docker run -it --name Docker-mysql_mysql_1 -e MYSQL_ROOT_PASSWORD=mysql01 -d mysql:latest
1e52c5b390e55b6d9897d41b190419e53608f06c115ca4fbc092eafc0d84ba09

docker-mysql % docker exec -it Docker-mysql_mysql_1 bash -p
root@1e52c5b390e5:/# mysql -u root -p -h 127.0.0.1
Enter password:
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 9
Server version: 8.0.26 MySQL Community Server - GPL

Copyright (c) 2000, 2021, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> mysql
    -> ^C
mysql> exit
Bye
root@1e52c5b390e5:/# exit
exit

docker-mysql %

https://camo.qiitausercontent.com/3a1260bb0b01be972c82fdfc5de638e99935da88/68747470733a2f2f71696974612d696d6167652d73746f72652e73332e61702d6e6f727468656173742d312e616d617a6f6e6177732e636f6d2f302f3338343131312f36333739626639392d353264342d363737382d326162662d3865623763333138346238662e706e67

