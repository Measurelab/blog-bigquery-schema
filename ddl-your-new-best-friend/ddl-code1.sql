SELECT 
date,
count(distinct(visitid)) as unique_visits
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*` 
WHERE _table_suffix = '20170801'   # use date_sub to programmatically select your table
Group by 1
order by 1
