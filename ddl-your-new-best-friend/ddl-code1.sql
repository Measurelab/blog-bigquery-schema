SELECT 
date,
count(distinct(visitid)) as unique_visits
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_20170801`  #public dataset
Group by 1
order by 1
