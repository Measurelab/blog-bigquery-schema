CREATE TABLE
  `testing.insert` (date DATE OPTIONS( description='date' ),
    unique_visits INT64 OPTIONS( description='counts' ))
PARTITION BY
  date
CLUSTER BY
  unique_visits OPTIONS ( description="A table with a date partition",
    labels=[("testing",
      "measurelab_is_great")],
      expiration_timestamp=TIMESTAMP "2023-01-01 00:00:00 UTC"
    ) AS (
  SELECT
    DATE(TIMESTAMP_SECONDS( visitStartTime)) AS date,
    COUNT(DISTINCT(visitid)) AS unique_visits
  FROM
    `bigquery-public-data.google_analytics_sample.ga_sessions_*`
  WHERE
    _table_suffix = '20170801'
  GROUP BY
    1);
    
