#! /bin/bash

BLUE='\033[0;36m'
NC='\033[0m'

# parameters=""

# if [ "$#" -ne 1 ]; then
#     for arg in "$@" 
#     do
#         parameters+=$arg
#         parameters+=' '
#     done
# fi

echo -e "${BLUE}Cleaning tables in Databases ... ${NC}"
echo -e "${BLUE}IRIS LOCAL :${NC}"
java -cp ycsb-0.15.0/jdbc-binding/lib/jdbc-binding-0.17.0.jar:ycsb-0.15.0/jdbc-binding/lib/intersystems-jdbc-3.0.0.jar com.yahoo.ycsb.db.JdbcDBCli \
-P ycsb-0.15.0/jdbc-binding/conf/iris_local.properties \
-c "TRUNCATE TABLE usertable"

echo -e "${BLUE}IRIS DOCKER :${NC}"
java -cp ycsb-0.15.0/jdbc-binding/lib/jdbc-binding-0.17.0.jar:ycsb-0.15.0/jdbc-binding/lib/intersystems-jdbc-3.0.0.jar com.yahoo.ycsb.db.JdbcDBCli \
-P ycsb-0.15.0/jdbc-binding/conf/iris_docker.properties \
-c "TRUNCATE TABLE usertable"

echo -e "${BLUE}PostgreSQL LOCAL :${NC}"
java -cp ycsb-0.15.0/jdbc-binding/lib/jdbc-binding-0.17.0.jar:ycsb-0.15.0/jdbc-binding/lib/postgresql-42.2.5.jar com.yahoo.ycsb.db.JdbcDBCli \
-P ycsb-0.15.0/jdbc-binding/conf/postgres_local.properties \
-c "TRUNCATE TABLE usertable"

echo -e "${BLUE}PostgreSQL DOCKER:${NC}"
java -cp ycsb-0.15.0/jdbc-binding/lib/jdbc-binding-0.17.0.jar:ycsb-0.15.0/jdbc-binding/lib/postgresql-42.2.5.jar com.yahoo.ycsb.db.JdbcDBCli \
-P ycsb-0.15.0/jdbc-binding/conf/postgres_docker.properties \
-c "TRUNCATE TABLE usertable"

# echo -e "${BLUE}Creating tables:${NC}"
# SELECT %SYSTEM.SQL_TableExists('usertable')

echo -e "${BLUE}\nTesting with Intersystems IRIS LOCAL${NC}"
ycsb-0.15.0/bin/ycsb load jdbc \
-P ycsb-0.15.0/workloads/workloada \
-P ycsb-0.15.0/jdbc-binding/conf/iris_local.properties \
-cp ycsb-0.15.0/jdbc-binding/lib/intersystems-jdbc-3.0.0.jar

ycsb-0.15.0/bin/ycsb run jdbc \
-P ycsb-0.15.0/workloads/workloada \
-P ycsb-0.15.0/jdbc-binding/conf/iris_local.properties \
-cp ycsb-0.15.0/jdbc-binding/lib/intersystems-jdbc-3.0.0.jar

echo -e "${BLUE}\nTesting with Intersystems IRIS DOCKER${NC}"
ycsb-0.15.0/bin/ycsb load jdbc \
-P ycsb-0.15.0/workloads/workloada \
-P ycsb-0.15.0/jdbc-binding/conf/iris_docker.properties \
-cp ycsb-0.15.0/jdbc-binding/lib/intersystems-jdbc-3.0.0.jar

ycsb-0.15.0/bin/ycsb run jdbc \
-P ycsb-0.15.0/workloads/workloada \
-P ycsb-0.15.0/jdbc-binding/conf/iris_docker.properties \
-cp ycsb-0.15.0/jdbc-binding/lib/intersystems-jdbc-3.0.0.jar

echo -e "${BLUE}\nTesting with PostgreSQL LOCAL${NC}"
ycsb-0.15.0/bin/ycsb load jdbc \
-P ycsb-0.15.0/workloads/workloada \
-P ycsb-0.15.0/jdbc-binding/conf/postgres_local.properties \
-cp ycsb-0.15.0/jdbc-binding/lib/postgresql-42.2.5.jar

ycsb-0.15.0/bin/ycsb run jdbc \
-P ycsb-0.15.0/workloads/workloada \
-P ycsb-0.15.0/jdbc-binding/conf/postgres_local.properties \
-cp ycsb-0.15.0/jdbc-binding/lib/postgresql-42.2.5.jar

echo -e "${BLUE}\nTesting with PostgreSQL DOCKER${NC}"
ycsb-0.15.0/bin/ycsb load jdbc \
-P ycsb-0.15.0/workloads/workloada \
-P ycsb-0.15.0/jdbc-binding/conf/postgres_docker.properties \
-cp ycsb-0.15.0/jdbc-binding/lib/postgresql-42.2.5.jar

ycsb-0.15.0/bin/ycsb run jdbc \
-P ycsb-0.15.0/workloads/workloada \
-P ycsb-0.15.0/jdbc-binding/conf/postgres_docker.properties \
-cp ycsb-0.15.0/jdbc-binding/lib/postgresql-42.2.5.jar