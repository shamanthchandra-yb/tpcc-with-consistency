# Steps to run TPCC

### 1. Login to YSQLSH
Use the following command: ./ysqlsh -h <IP-of-tserver>

```sh
./bin/ysqlsh -h
```

### 2. Create tables in Yugabyte using script

```sh
\i yb-tpcc.sql
```

### 3. Create tables in Postgres using script

```sh
\i pg-tpcc.sql
```

### 4. Create a DB stream ID using yb-admin

```sh
./yb-admin --master_address <csv-ip-addresses> ysql.yugabyte
```

### 5. Deploy the source connector without consistency mode

This is to ensure that load phase finishes as quickly as possible.

```sh
curl -i -X POST -H "Accept:application/json" -H "Content-Type:application/json" localhost:8083/connectors/ -d '{
  "name": "ybconnector",
  "config": {
    "tasks.max":"8",
    "connector.class": "io.debezium.connector.yugabytedb.YugabyteDBConnector",
    "database.hostname":"",
    "database.master.addresses":"",
    "database.port":"5433",
    "database.user": "yugabyte",
    "database.password":"Yugabyte@123",
    "database.dbname":"yugabyte",
    "database.server.name":"dbserver1",
    "snapshot.mode":"never",
    "database.streamid":"312590bebfa0443d98f8215945015bd9",
    "table.include.list":"public.oorder,public.district,public.item,public.customer,public.order_line,public.new_order,public.stock,public.warehouse",
    "transforms":"Reroute",
    "transforms.Reroute.topic.regex":"(.*)",
    "transforms.Reroute.topic.replacement":"dbserver1_all_events",
    "transforms.Reroute.type":"io.debezium.transforms.ByLogicalTableRouter",
    "transforms.Reroute.key.field.regex":"dbserver1.public.(.*)",
    "transforms.Reroute.key.field.replacement":"$1"
  }
}'
```

### 6. Deploy JDBC sinks

```sh
curl -i -X POST -H "Accept:application/json" -H "Content-Type:application/json" localhost:8083/connectors/ -d '{
"name": "jdbc-sink",
"config": {
    "connector.class": "io.confluent.connect.jdbc.JdbcSinkConnector",
    "tasks.max": "1",
    "topics": "dbserver1_all_events",
    "dialect.name": "PostgreSqlDatabaseDialect",
    "connection.url": "jdbc:postgresql://pg:5432/postgres?user=postgres&password=postgres&sslMode=require",
    "insert.mode": "upsert",
    "pk.mode": "record_key",
    "delete.enabled":"true",
    "transforms": "KeyFieldExample,unwrap",
    "transforms.KeyFieldExample.type": "io.aiven.kafka.connect.transforms.ExtractTopic$Key",
    "transforms.KeyFieldExample.field.name": "__dbz__physicalTableIdentifier",
    "transforms.KeyFieldExample.skip.missing.or.null": "true",
    "transforms.unwrap.type": "io.debezium.connector.yugabytedb.transforms.YBExtractNewRecordState",
    "transforms.unwrap.drop.tombstones": "false"
  }
}'
```

### 7. Change the config of Kafka topic to ensure lower retention

Setting it to 30 minutes here.

```sh
./kafka-configs --bootstrap-server broker:9092 --alter --entity-type topics --entity-name dbserver1_all_events --add-config 'retention.ms=1800000'
```

### 8. Start TPCC run

```sh
./tpccbenchmark --load=true --warehouses=10 --nodes=csv-of-nodes --enable-foreign-keys=true
```

### 9. Delete the existing connector once load phase finishes

```sh
curl -X DELETE localhost:8083/connectors/ybconnector
```

### 10. Deploy connector with consistency mode

```sh
curl -i -X POST -H "Accept:application/json" -H "Content-Type:application/json" localhost:8083/connectors/ -d '{
  "name": "ybconnector",
  "config": {
    "tasks.max":"1",
    "connector.class": "io.debezium.connector.yugabytedb.YugabyteDBConnector",
    "database.hostname":"",
    "database.master.addresses":"",
    "database.port":"5433",
    "database.user": "yugabyte",
    "database.password":"Yugabyte@123",
    "database.dbname":"yugabyte",
    "database.server.name":"dbserver1",
    "snapshot.mode":"never",
    "database.streamid":"312590bebfa0443d98f8215945015bd9",
    "consistency.mode":"global",
    "table.include.list":"public.oorder,public.district,public.item,public.customer,public.order_line,public.new_order,public.stock,public.warehouse",
    "transforms":"Reroute",
    "transforms.Reroute.topic.regex":"(.*)",
    "transforms.Reroute.topic.replacement":"dbserver1_all_events",
    "transforms.Reroute.type":"io.debezium.transforms.ByLogicalTableRouter",
    "transforms.Reroute.key.field.regex":"dbserver1.public.(.*)",
    "transforms.Reroute.key.field.replacement":"$1"
  }
}'
```

### 12. Add constraints in YugabyteDB now

```sql
\i yb-functions.sql
\i yb-tpcc-fk.sql
```

### 13. Create constraints in Postgres now

```sql
\i pg-tpcc-fk.sql
```

### 14. Start the execute phase - DO NOT forget to check config/workload-all.xml for the runtime configurations

```sh
./tpccbenchmark --execute=true --warehouses=10 --nodes=csv-of-nodes --enable-foreign-keys=true --clear=false --vv
```

### 15. Sample command to print the columns of all the tables

```sql
select (select count(*) from warehouse) as warehouse, (select count(*) from district) as district, (select count(*) from item) as item, (select count(*) from stock) as stock, (select count(*) from new_order) as new_order, (select count(*) from oorder) as oorder, (select count(*) from order_line) as order_line;
```
