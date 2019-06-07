#! /bin/bash

BLUE='\033[0;36m'
NC='\033[0m'

echo -e "${BLUE}Testing with Intersystems IRIS LOCAL${NC}"
ycsb-0.15.0/bin/ycsb load jdbc \
-P ycsb-0.15.0/workloads/workloada \
-P ycsb-0.15.0/jdbc-binding/conf/iris_local.properties \
-cp ycsb-0.15.0/jdbc-binding/lib/intersystems-jdbc-3.0.0.jar

ycsb-0.15.0/bin/ycsb run jdbc \
-P ycsb-0.15.0/workloads/workloada \
-P ycsb-0.15.0/jdbc-binding/conf/iris_local.properties \
-cp ycsb-0.15.0/jdbc-binding/lib/intersystems-jdbc-3.0.0.jar

# doesnt work 
echo -e "${BLUE}Testing with Intersystems IRIS DOCKER${NC}"
ycsb-0.15.0/bin/ycsb load jdbc \
-P ycsb-0.15.0/workloads/workloada \
-P ycsb-0.15.0/jdbc-binding/conf/iris_docker.properties \
-cp ycsb-0.15.0/jdbc-binding/lib/intersystems-jdbc-3.0.0.jar

ycsb-0.15.0/bin/ycsb run jdbc \
-P ycsb-0.15.0/workloads/workloada \
-P ycsb-0.15.0/jdbc-binding/conf/iris_docker.properties \
-cp ycsb-0.15.0/jdbc-binding/lib/intersystems-jdbc-3.0.0.jar

echo -e "${BLUE}Testing with PostgreSQL LOCAL${NC}"
ycsb-0.15.0/bin/ycsb load jdbc \
-P ycsb-0.15.0/workloads/workloada \
-P ycsb-0.15.0/jdbc-binding/conf/postgres_local.properties \
-cp ycsb-0.15.0/jdbc-binding/lib/postgresql-42.2.5.jar

ycsb-0.15.0/bin/ycsb run jdbc \
-P ycsb-0.15.0/workloads/workloada \
-P ycsb-0.15.0/jdbc-binding/conf/postgres_local.properties \
-cp ycsb-0.15.0/jdbc-binding/lib/postgresql-42.2.5.jar

echo -e "${BLUE}Testing with PostgreSQL DOCKER${NC}"
ycsb-0.15.0/bin/ycsb load jdbc \
-P ycsb-0.15.0/workloads/workloada \
-P ycsb-0.15.0/jdbc-binding/conf/postgres_docker.properties \
-cp ycsb-0.15.0/jdbc-binding/lib/postgresql-42.2.5.jar

ycsb-0.15.0/bin/ycsb run jdbc \
-P ycsb-0.15.0/workloads/workloada \
-P ycsb-0.15.0/jdbc-binding/conf/postgres_docker.properties \
-cp ycsb-0.15.0/jdbc-binding/lib/postgresql-42.2.5.jar