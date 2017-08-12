/** This script is to find distributer who sold petrol in least amount**/

-- Load PetrolDataset.txt
petrolDataset = LOAD 'PetrolDataset.txt' USING PigStorage(',') AS (distributerID:chararray, distributerName:chararray, buyRate:chararray, sellRate:chararray, volIn:int, volOut:int, year:int );

-- Sorting data by selling rate
orderedData = ORDER petrolDataset by sellRate ;

--We need only 1 record, so limiting the data
limitedData = LIMIT  orderedData 1;

--We need only distributer name
result = FOREACH limitedData GENERATE distributerName;

--dump result on console
dump result;

