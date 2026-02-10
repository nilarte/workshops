SELECT * FROM `helical-math-347004.zoomcamp.yellow_tripdata_2024_ext` LIMIT 10;

-- Create a non partitioned table from external table
-- CREATE TABLE helical-math-347004.zoomcamp.yellow_tripdata_24_non_partitioned AS
-- SELECT * FROM `helical-math-347004.zoomcamp.yellow_tripdata_2024_ext`;


--select count(*) from zoomcamp.yellow_tripdata_24_non_partitioned where fare_amount=0

select count(*) from zoomcamp.yellow_tripdata_24_non_partitioned;


SELECT DISTINCT vendor_id
FROM zoomcamp.yellow_tripdata_24_partitioned_clustered
WHERE tpep_dropoff_datetime >= TIMESTAMP '2024-03-01'
  AND tpep_dropoff_datetime <  TIMESTAMP '2024-03-16';


-- Create a partitioned table from external table
CREATE OR REPLACE TABLE zoomcamp.yellow_tripdata_24_partitioned_clustered
PARTITION BY
  DATE(tpep_dropoff_datetime) 
CLUSTER BY 
  vendor_id
AS
SELECT * FROM `zoomcamp.yellow_tripdata_24_non_partitioned`;
