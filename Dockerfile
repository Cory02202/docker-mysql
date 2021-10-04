FROM mysql

EXPOSE 3306

ADD ./my.cnf /mysql/my.cnf

CMD ["mysqld"]

