Create database PetFinder
Go

Use PetFinder

Create table PetFinder_Staging
(
	
	PetID int not null primary key,
	Type varchar(3),
	Age int,
	Breed1 varchar(255),
	Breed2 varchar(255),
	Gender varchar(6),
	Color1 varchar(255),
	Color2 varchar(255),
	Color3 varchar(255),
	MaturitySize varchar(13),
	FurLength varchar(13),
	Vaccinated varchar(8),
	Dewormed varchar(8),
	Sterilized varchar(8),
	Health varchar(14),
	Quantity int,
	Fee int,
	State varchar(255),
	RescuerID int,
	TypeID int,
	BreedID1 int,
	BreedID2 int,
	GenderID int,
	ColorID1 int,
	ColorID2 int,
	ColorID3 int,
	MaturitySizeID int,
	FurLengthID int,
	VaccinatedID int,
	DewormedID int,
	SterilizedID int,
	HealthID int,
	StateID int
)
GO


Create table Type_DIM
 (
	TypeID int not null primary key identity(1,1),
	Type varchar(3)
 )
Go

Create table Breed_DIM
 (
	BreedID int not null primary key identity(1,1),
	Breed varchar(255)
 )
Go

Create table Gender_DIM
 (
	GenderID int not null primary key identity(1,1),
	Gender varchar(6)
 )
Go

Create table Color_DIM
 (
	ColorID int not null primary key identity(1,1),
	Color varchar(255)
 )
Go

Create table MaturitySize_DIM
 (
	MaturitySizeID int not null primary key identity(1,1),
	MaturitySize varchar(13)
 )
Go

Create table FurLength_DIM
 (
	FurLengthID int not null primary key identity(1,1),
	FurLength varchar(13)
 )
Go

Create table Vaccinated_DIM
 (
	VaccinatedID int not null primary key identity(1,1),
	Vaccinated varchar(8)
 )
Go

Create table Dewormed_DIM
 (
	DewormedID int not null primary key identity(1,1),
	Dewormed varchar(8)
 )
Go

Create table Sterilized_DIM
 (
	SterilizedID int not null primary key identity(1,1),
	Sterilized varchar(8)
 )
Go

Create table Health_DIM
 (
	HealthID int not null primary key identity(1,1),
	Health varchar(14)
 )
Go

Create table State_DIM
 (
	StateID int not null primary key identity(1,1),
	State varchar(255)
 )
Go


Create table PetFinder_Fact
 (
	PetID int not null primary key,
	Age int,
	Quantity int,
	Fee int,
	RescuerID int,
	TypeID int,
	BreedID1 int,
	BreedID2 int,
	GenderID int,
	ColorID1 int,
	ColorID2 int,
	ColorID3 int,
	MaturitySizeID int,
	FurLengthID int,
	VaccinatedID int,
	DewormedID int,
	SterilizedID int,
	HealthID int,
	StateID int
	
 Constraint FK_PetFinder_Fact_Type_DIM foreign key (TypeID) references Type_DIM(TypeID),
 Constraint FK_PetFinder_Fact_Breed1_DIM foreign key (BreedID1) references Breed_DIM(BreedID),
 Constraint FK_PetFinder_Fact_Breed2_DIM foreign key (BreedID2) references Breed_DIM(BreedID),
 Constraint FK_PetFinder_Fact_Gender_DIM foreign key (GenderID) references Gender_DIM(GenderID),
 Constraint FK_PetFinder_Fact_Color1_DIM foreign key (ColorID1) references Color_DIM(ColorID),
 Constraint FK_PetFinder_Fact_Color2_DIM foreign key (ColorID2) references Color_DIM(ColorID),
 Constraint FK_PetFinder_Fact_Color3_DIM foreign key (ColorID3) references Color_DIM(ColorID),
 Constraint FK_PetFinder_Fact_MaturitySize_DIM foreign key (MaturitySizeID) references MaturitySize_DIM(MaturitySizeID),
 Constraint FK_PetFinder_Fact_FurLength_DIM foreign key (FurLengthID) references FurLength_DIM(FurLengthID),
 Constraint FK_PetFinder_Fact_Vaccinated_DIM foreign key (VaccinatedID) references Vaccinated_DIM(VaccinatedID),
 Constraint FK_PetFinder_Fact_Dewormed_DIM foreign key (DewormedID) references Dewormed_DIM(DewormedID),
 Constraint FK_PetFinder_Fact_Sterilized_DIM foreign key (SterilizedID) references Sterilized_DIM(SterilizedID),
 Constraint FK_PetFinder_Fact_Health_DIM foreign key (HealthID) references Health_DIM(HealthID),
 Constraint FK_PetFinder_Fact_State_DIM foreign key (StateID) references State_DIM(StateID)
 
 )

