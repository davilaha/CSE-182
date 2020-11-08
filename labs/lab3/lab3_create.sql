/* Alex Davila
   CSE182 Database Managemnet Systems
   Lab 3
*/

DROP SCHEMA Lab3 CASCADE; 
CREATE SCHEMA Lab3; 


-- Create Tables for Lab3.

/*
PRIMARY KEY and UNIQUE can appear directly with the attribute 
when applied to a single attribute. 
But if UNIQUE constraint or PRIMARY KEY is on multiple attributes, 
it has to appear as a schema element.
*/

--Keepers(keeperID, name, hireDate, keeperLevel, keeperSalary)
CREATE TABLE Keepers (
	keeperID  INTEGER,  
	name VARCHAR(30),
	hireDate DATE NOT NULL,
	keeperLevel CHAR(1),
	keeperSalary NUMERIC(7,2),
	PRIMARY KEY (keeperID)
);

--Cages(cageID, cageSector, keeperID)
CREATE TABLE Cages (
	cageID INTEGER, 
	cageSector CHAR(1) NOT NULL, 
	keeperID INTEGER,
	PRIMARY KEY (cageID),
	FOREIGN KEY (keeperID) REFERENCES Keepers
);

--Species(speciesID, speciesName, genus, animalCount)
CREATE TABLE Species (
	speciesID INTEGER,  
	speciesName VARCHAR(40) NOT NULL,
	genus VARCHAR(40),
	animalCount INTEGER,
	PRIMARY KEY (speciesID),
	UNIQUE(speciesName)
);


--Animals(animalID, name, speciesID, animalAge, cageID)
CREATE TABLE Animals (
	animalID INTEGER, 
	name VARCHAR(30),
	speciesID INTEGER,
	animalAge INTEGER,
	cageID INTEGER,
	PRIMARY KEY (animalID),
	FOREIGN KEY (speciesID) REFERENCES Species,
	FOREIGN KEY (cageID) REFERENCES Cages,
	UNIQUE(name, speciesID)
);

--Members(memberID, name, address, memberStatus, joinDate, expirationDate)
CREATE TABLE Members (
	memberID INTEGER, 
	name VARCHAR(30),
	address VARCHAR(40),
	memberStatus CHAR(1), 
	joinDate DATE,
	expirationDate DATE,
	PRIMARY KEY (memberID),
	UNIQUE(name, address)
);

--CageVisits(memberID, cageID, visitDate, likedVisit)
CREATE TABLE CageVisits (
	memberID INTEGER,
	cageID INTEGER,
	visitDate DATE,
	likedVisit boolean,
	PRIMARY KEY (memberID, cageID, visitDate)	
);

--We are trying to merge this table into Animals table
--AnimalChanges (animalID, speciesID, cageID)
CREATE TABLE AnimalChanges(
	animalID INTEGER, 
	speciesID INTEGER,
	cageID INTEGER,
	PRIMARY KEY (animalID),
	FOREIGN KEY (speciesID) REFERENCES Species,
	FOREIGN KEY (cageID) REFERENCES Cages
);