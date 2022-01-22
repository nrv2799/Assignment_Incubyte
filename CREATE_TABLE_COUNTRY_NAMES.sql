--Assumption:Customer Data loaded in "Customer_Data" table

-- APPROACH 1


-- getting list of distinct countries which will decide the total no. of tables in my final output
select distinct country from Customer_Data;

--For eg. if we get below output:
--IND
--AU
--US
--PHIL
--ENG

Create table Table_IND
as
select *
from Customer_Data
where country = 'IND';

Create table Table_AU
as
select *
from Customer_Data
where country = 'AU';

Create table Table_US
as
select *
from Customer_Data
where country = 'US';

Create table Table_PHIL
as
select *
from Customer_Data
where country = 'PHIL';

Create table Table_ENG
as
select *
from Customer_Data
where country = 'ENG';

--------------------------------------------------------------------------------------------------------
-- APPROACH 2


-- alternate stored procedure
create or replace procedure customer_bifurcation

BEGIN
  FOR countryName IN (
    SELECT distinct country FROM Customer_Data )
  LOOP
create table 'Table_'||countryName.country
as
select *
from Customer_data
where country = countryName.country
  END LOOP;
END;
