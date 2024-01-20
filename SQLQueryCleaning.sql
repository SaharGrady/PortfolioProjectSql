--cleaning Data-----
select*
from NashvilHousing

----Date----
select SaleDate , convert(date,SaleDate) as ConvertDate
from NashvilHousing

update NashvilHousing
set SaleDate =convert(date,SaleDate)

alter table NashvilHousing
add ConvertDate date ;
update NashvilHousing
set ConvertDate =convert(date,SaleDate)


-----Fixing Missing value-------


select IRON.ParcelID ,IRON.PropertyAddress ,lola.ParcelID ,lola.PropertyAddress,isnull(IRON.PropertyAddress ,lola.PropertyAddress)
from NashvilHousing as IRON	
join NashvilHousing as lola
	on Iron.ParcelID = lola.ParcelID
	and iron.[UniqueID ] <> lola.[UniqueID ]
	where iron.PropertyAddress is null

update IRON 
set PropertyAddress = isnull(IRON.PropertyAddress ,lola.PropertyAddress)
from NashvilHousing as IRON	
join NashvilHousing as lola
	on Iron.ParcelID = lola.ParcelID
	and iron.[UniqueID ] <> lola.[UniqueID ]

-------------------------------
------Address Fixing-------
--select CHARINDEX(',' ,PropertyAddress)-1
--from NashvilHousing
select 
SUBSTRING(PropertyAddress,1,CHARINDEX(',' ,PropertyAddress)-1 ) as address
from NashvilHousing

--select CHARINDEX(',' ,PropertyAddress)+1
--from NashvilHousing

select 
SUBSTRING(PropertyAddress,CHARINDEX(',' ,PropertyAddress)+1 ,len(PropertyAddress)) as address
from NashvilHousing

alter table NashvilHousing
add PropertyAddressStreet nvarchar (255)
alter table NashvilHousing
add PropertyAddressCity nvarchar (255)

update NashvilHousing
set PropertyAddressStreet =SUBSTRING(PropertyAddress,1,CHARINDEX(',' ,PropertyAddress)-1 )

update NashvilHousing
set PropertyAddressCity =SUBSTRING(PropertyAddress,CHARINDEX(',' ,PropertyAddress)+1 ,len(PropertyAddress))


select 
PARSENAME(replace(OwnerAddress,',','.'), 3),
PARSENAME(replace(OwnerAddress,',','.'), 2),
PARSENAME(replace(OwnerAddress,',','.'), 1)
from NashvilHousing


alter table NashvilHousing
add OwnerAddressStreet nvarchar (255)
alter table NashvilHousing
add OwnerAddressCity nvarchar (255)
alter table NashvilHousing
add OwnerAddressCountry nvarchar (255)

update NashvilHousing
set OwnerAddressStreet =PARSENAME(replace(OwnerAddress,',','.'), 3)

update NashvilHousing
set OwnerAddressCity =PARSENAME(replace(OwnerAddress,',','.'), 2)

update NashvilHousing
set OwnerAddressCountry =PARSENAME(replace(OwnerAddress,',','.'), 1)

------change Y and N to Yes and NO ------
select distinct(SoldAsVacant),count(SoldAsVacant)
from NashvilHousing
group by SoldAsVacant


update NashvilHousing
set SoldAsVacant = 
	CASE 
	WHEN SoldAsVacant = 'N' THEN 'No'
	WHEN SoldAsVacant = 'Y' THEN 'Yes' 
	end



----Duplicate Value-----
WITH Duplicate_Row_Cte 
AS (
select ParcelID,
		PropertyAddress,
		SaleDate,
		LegalReference,
Rank () over
	(partition by ParcelID,
				PropertyAddress,
				SaleDate,
				LegalReference
				order by UniqueID )
				Duplicate_Row
from NashvilHousing
)

--DELETE 
--from Duplicate_Row_Cte
--where Duplicate_Row = 2 ;

SELECT *
from Duplicate_Row_Cte
where Duplicate_Row = 2 ;

