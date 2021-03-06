1. 建表

内部表:
CREATE TABLE user_1(id STRING, name STRING, phone STRING) ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';

外部表(地址指向-> hdfs://hadoop:9000/data/user_1):
CREATE EXTERNAL TABLE user_2(id STRING, name STRING, phone STRING) ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' STORED AS TEXTFILE LOCATION '/data/user_1';


2. 加载数据
local:
LOAD DATA LOCAL INPATH '/opt/data/user_1' INTO TABLE user_1;

hdfs:
LOAD DATA INPATH 'hdfs://hadoop:9000/data/user_1' INTO TABLE user_1;
