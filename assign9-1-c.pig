/** This script is to find 10 years where comsumption of petrol is more with distributer id who sold it**/

-- Load PetrolDataset.txt
petrolDataset = LOAD 'PetrolDataset.txt' USING PigStorage(',') AS (distributerID:chararray, distributerName:chararray, buyRate:chararray, sellRate:chararray, volIn:int, volOut:int, year:int );

-- We need only top 10 distributer IDs so ordering them by volume of petrol sold
filteredData = FILTER petrolDataset by volOut < volIn;

-- Grouping data by year
grpData = GROUP filteredData by year;


--We need only 10 records, so limiting the data
limitedData = LIMIT  grpData 10;

--We need only year
result = FOREACH limitedData GENERATE group;

--dump result on console
dump result;

