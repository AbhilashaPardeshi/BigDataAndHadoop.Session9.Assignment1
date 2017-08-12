/** This script is to find top 10 distributer ids for selling petrol**/

-- Load PetrolDataset.txt
petrolDataset = LOAD 'PetrolDataset.txt' USING PigStorage(',') AS (distributerID:chararray, distributerName:chararray, buyRate:chararray, sellRate:chararray, volIn:int, volOut:int, year:int );

-- We need top 10 distributer IDs so ordering them by volume of petrol sold
orderedData = ORDER petrolDataset by volOut DESC;

--We need only 10 records, so limiting the data
limitedData = LIMIT  orderedData 10;

--We need only distributer id and volume
result = FOREACH limitedData GENERATE  distributerID, volOut;

--dump result on console
dump result;


