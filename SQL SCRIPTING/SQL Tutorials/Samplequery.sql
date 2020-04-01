select * from DimCustomer 

select * from DimCustomer where LastName='Yang';

select * from DimCustomer where FirstName='Jon' and LastName='Yang';


select count(*) as males from DimCustomer where Gender = 'M'


select * from DimCustomer where LastName like upper('y%');

select concat(FirstName,LastName)as fullname, BirthDate,GeographyKey,Title,Gender from DimCustomer where LastName like
lower('%ar%') and Title is not null order by BirthDate desc, GeographyKey desc;



