Use PetFinder
Go

-- •	Tổng cộng có bao nhiêu vật nuôi trong từng bang?

Select 
		State,
		SUM(quantity) as Pet_Quantity
		

From	PetFinder_Fact a
		join	State_DIM b
on		a.StateID = b.StateID

Group by b.State

Order by Pet_Quantity desc

--•	Tổng cộng có bao nhiêu vật nuôi đã được tiêm phòng tính theo kích cỡ khi trưởng thành?

Select 
		MaturitySize,
		sum(quantity) as Quantity_Pet_Vaccinated
		
From	MaturitySize_DIM a
inner join	PetFinder_Fact b
on		a.MaturitySizeID = b.MaturitySizeID
inner join	Vaccinated_DIM c
on		b.VaccinatedID = c.VaccinatedID

Where	c.Vaccinated = 'Yes'

Group by MaturitySize

Order by 2

-- •	Có bao nhiêu con mèo lông dài?

Select 
		sum(quantity) as Quantity_Long_Cat
		

From	PetFinder_Fact a
		join	FurLength_DIM b
on		a.FurLengthID = b.FurLengthID
		join	Type_DIM c
on		a.TypeID = c.TypeID

Where	c.Type = 'Cat'
		and		b.FurLength = 'Long'

-- •	Có bao nhiêu con chó đã được triệt sản? Chiếm tỷ lệ bao nhiêu phần trăm trên tổng số chó?	
		
Select 
		sum(quantity) as Quantity_Dog_Sterilized,
		Quantity_Dog = (select SUM(quantity) from PetFinder_Fact a join Type_DIM b on a.TypeID = b.TypeID where b.Type = 'Dog' ),
		PersentOfDogSterilized = sum(quantity) / (select Cast(SUM(quantity) AS Decimal(8,2)) from PetFinder_Fact a join Type_DIM b on a.TypeID = b.TypeID where b.Type = 'Dog') * 1.0

From	PetFinder_Fact a
		join	Sterilized_DIM b
on		a.SterilizedID = b.SterilizedID
		join	Type_DIM c
on		a.TypeID = c.TypeID

Where	c.Type = 'Dog'
		and		b.Sterilized = 'Yes'




