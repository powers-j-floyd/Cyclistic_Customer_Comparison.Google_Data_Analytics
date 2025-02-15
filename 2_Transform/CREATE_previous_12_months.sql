-- inserts the raw data from each monthly csv file into one raw data table for the entire year 12/2023 through 11/2024

INSERT INTO
  `argon-fx-421902.cyclistic_historical_data.previous_12_months`

SELECT
  *

-- Change the name of table to correspond to each monthly csv file
FROM 
  `argon-fx-421902.cyclistic_historical_data.Nov_24`;