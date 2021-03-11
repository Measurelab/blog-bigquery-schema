CREATE TABLE
  `testing.insert` (date STRING,
    unique_visits INT64) AS (
  SELECT
    date,
    COUNT(DISTINCT(visitid)) AS unique_visits
  FROM
    `bigquery-public-data.google_analytics_sample.ga_sessions_*`
  WHERE
    _table_suffix = '20170801'
  GROUP BY
    1);
    
    
INSERT
  `testing.insert` (date,
    unique_visits ) (
  SELECT
    date,
    COUNT(DISTINCT(visitid)) AS unique_visits
  FROM
    `bigquery-public-data.google_analytics_sample.ga_sessions_*`
  WHERE
    _table_suffix = '20170801'
  GROUP BY
    1);
    
  CREATE OR REPLACE TABLE `testing.insert` AS
  (
  SELECT *
  FROM (
  SELECT
    date,
    COUNT(DISTINCT(visitid)) AS unique_visits
  FROM
    `bigquery-public-data.google_analytics_sample.ga_sessions_*`
  WHERE
    _table_suffix = '20170801'
  GROUP BY
    1)
    UNION ALL
    (SELECT * FROM  `testing.insert`) );
     
    
CREATE TABLE IF NOT EXISTS `testing.insert` AS
  (
  SELECT *
  FROM (
  SELECT
    date,
    COUNT(DISTINCT(visitid)) AS unique_visits
  FROM
    `bigquery-public-data.google_analytics_sample.ga_sessions_*`
  WHERE
    _table_suffix = '20170801'
  GROUP BY
    1)
    UNION ALL
    (SELECT * FROM  `testing.insert`) ));
