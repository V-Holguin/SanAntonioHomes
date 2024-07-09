-- Check for all listings that aren't in San Antonio
SELECT * FROM sanantonio
WHERE Location NOT LIKE '%San Antonio%';

-- Delete the results not in San Antonio
DELETE FROM sanantonio
WHERE Location NOT LIKE '%San Antonio%';

-- Check if `Link` and `Propery URL` ever differ (0 results)
SELECT * FROM sanantonio
WHERE Link != `Property URL`;

-- Drop `Property URL`
ALTER TABLE sanantonio
DROP Column `Property URL`;

-- Check for missing prices (0 results)
SELECT * FROM sanantonio
WHERE Price IS NULL OR Price = '';

-- Check for missing bed info (0 results)
SELECT * FROM sanantonio
WHERE BD IS NULL OR BD = '';

-- Check for missing bath info (3 results)
SELECT * FROM sanantonio
WHERE BA IS NULL OR BA = '';

-- Delete rows missing bath info
DELETE FROM sanantonio
WHERE BA IS NULL;

-- Check for missing sqft info (0 results)
SELECT * FROM sanantonio
WHERE `sq. ft.` IS NULL OR `sq. ft.` = '';

-- Trim text off BD, BA, sq.ft.
UPDATE sanantonio
SET BD = LEFT(BD, 1),
	BA = LEFT(BA, 1),
    `sq. ft.` = REPLACE(`sq. ft.`, ',', ''), # Remove commas
    `sq. ft.` = SUBSTRING(`sq. ft.`, 1, CHAR_LENGTH(`sq. ft.`) - 5); # Trim text

-- Check BD, BA, sq.ft. for non-numeric values
-- BD (0 Results)
SELECT * FROM sanantonio
WHERE BD NOT REGEXP '^[0-9]+$';
-- BA (0 Results)
SELECT * FROM sanantonio
WHERE BA NOT REGEXP '^[0-9]+$';
-- sq.ft. (1 Result)
SELECT * FROM sanantonio
WHERE `sq. ft.` NOT REGEXP '^[0-9]+$';

-- Delete row without sq.ft. values
DELETE FROM sanantonio
WHERE `sq. ft.` = '--';

-- Check Price for any values without a $ (0 Results)
SELECT * FROM sanantonio
WHERE Price NOT LIKE '$%';

-- Remove text from Price
UPDATE sanantonio
SET Price = REPLACE(Price, ',', ''), # Remove commas
	Price = RIGHT(Price, CHAR_LENGTH(Price) - 1); # Remove $
    
-- Check Price for non-numeric values (2 Results)
SELECT * FROM sanantonio
WHERE Price NOT REGEXP '^[0-9]+$';

-- Delete the row missing a price
DELETE FROM sanantonio
WHERE Price = '4000+' OR Price = '84000+';


-- Rename columns
ALTER TABLE sanantonio
CHANGE COLUMN BD Bedrooms INT,
CHANGE COLUMN BA Bathrooms INT,
CHANGE COLUMN `sq. ft.` SqFt INT,
MODIFY Price INT; # Keep name, change type

-- Add a new columns for locations
ALTER TABLE sanantonio
ADD Zip VARCHAR(5),
ADD State TEXT,
ADD City TEXT,
Add Temp TEXT # Temporary column to work off
;

-- Set Temp to Location
UPDATE sanantonio
SET Temp = Location;
------------------------------------------------------------------
-- Populate `Zip` using `Temp` information
UPDATE sanantonio
SET Zip = RIGHT(Temp, 5);

-- Check rows that don't have a zip code (0 results)
SELECT * FROM sanantonio
WHERE Zip NOT REGEXP '^[0-9]+$';

-- Trim the zipcode from `Temp`
UPDATE sanantonio
SET Temp = SUBSTRING(Temp, 1, CHAR_LENGTH(Temp) - 6);
------------------------------------------------------------------
-- Populate `State` using `Temp` information
UPDATE sanantonio
SET State = RIGHT(Temp, 2);

-- Check rows that don't have state TX (0 results)
SELECT * FROM sanantonio
WHERE State != 'TX';

-- Trim the State from `Temp`
UPDATE sanantonio
SET Temp = SUBSTRING(Temp, 1, CHAR_LENGTH(Temp) - 4);
------------------------------------------------------------------
-- Populate `City` using `Temp` information
UPDATE sanantonio
SET City = RIGHT(Temp, 11);

-- Check rows that don't have City San Antonio (0 results)
SELECT * FROM sanantonio
WHERE City != 'San Antonio';

-- Trim the State from `Temp`
UPDATE sanantonio
SET Temp = SUBSTRING(Temp, 1, CHAR_LENGTH(Temp) - 13);
------------------------------------------------------------------
-- Only left with address, so rename Temp
ALTER TABLE sanantonio
RENAME COLUMN Temp TO Address;

