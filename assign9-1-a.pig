/** This script is to find volume of petrol sold by each distributer**/

-- Load PetrolDataset.txt
petrolDataset = LOAD 'PetrolDataset.txt' USING PigStorage(',') AS (districtID:chararray, distributerName:chararray, buyRate:chararray, sellRate:chararray, volIn:int, volOut:int, year:int );

--Group the dataset by distributer name
grpDistributer = GROUP petrolDataset by distributerName;

--Find the total of volume for each distributer
sumVolume = FOREACH grpDistributer GENERATE group,SUM(petrolDataset.volOut);

--dump result on console
dump sumVolume;
