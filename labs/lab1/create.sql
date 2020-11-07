-- Axex Davila
-- CSE182 Database Management
-- Spring 20
-- Lab 1 Zoo Database



DROP SCHEMA Lab1 CASCADE;
CREATE SCHEMA Lab1;
-- Create Tables

--Keepers(keeperID, name, hireDate, keeperLevel, keeperSalary)
CREATE TABLE Keepers (
    keeperID INTEGER,
    name VARCHAR(30),
    hireDate DATE,
    keeperLevel CHAR(1),
    keeperSalary NUMERIC(7,2),
    PRIMARY KEY (keeperID) 
);

--Cages(cageID, cageSector, keeperID)
CREATE TABLE Cages (
    cageID INTEGER,
    cageSector CHAR(1),
    keeperID INTEGER,
    PRIMARY KEY (cageID),
    FOREIGN KEY (keeperID) REFERENCES Keepers
);

--Species(speciesID, speciesName, genus, animalCount)
CREATE TABLE Species (
    speciesID INTEGER,
    speciesName VARCHAR(40),
    genus VARCHAR(40),
    animalCount INTEGER,
    PRIMARY KEY (speciesID)
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
    FOREIGN KEY (cageID) REFERENCES Cages
);

--Members(memberID, name, address, memberStatus, joinDate, expirationDate)
CREATE TABLE Members (
    memberID INTEGER,
    name VARCHAR(30),
    address VARCHAR(40),
    memberStatus CHAR(1),
    joinDate DATE,
    expirationDate DATE,
    PRIMARY KEY (memberID)
);

--CageVisits(memberID, cageID, visitDate, likedVisit)
CREATE TABLE CageVisits (
    memberID INTEGER,
    cageID INTEGER,
    visitDate DATE,
    likedVisit BOOLEAN,
    PRIMARY KEY (memberID, cageID, visitDate)
    FOREIGN KEY (memberID) REFERENCES Members,
    FOREIGN KEY (cageID) REFERENCES Cages
);
