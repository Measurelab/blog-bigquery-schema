#DDL to replace table - you can also add table and column descriptions in this part of the query

CREATE OR REPLACE TABLE
  `analytics_1111111111.events101` AS

#Selecting the table (generally in this case we will select * as we are reverting back but it is a opportunity to remove unused columns
SELECT
  *
FROM
  `analytics_1111111111.events101` FOR system_time AS OF 

#You can adjust this to varying time intervals within GCPs retention policy 
  TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL 75 second)