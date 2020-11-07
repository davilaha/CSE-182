-- Alex Davila
-- CSE182 Database Management
-- Spring 20
-- Lab 2 Zoo Database Modified



DROP SCHEMA Lab1 CASCADE;
CREATE SCHEMA Lab1;

-- Script file te Create a Zoo DB
-- Create Tables
CREATE TABLE Keepers (
    keeperID INTEGER NOT NULL,
    name VARCHAR(30),
    hireDATE DATE NOT NULL,
    keeperLevel CHAR(1),
    keeperSalary NUMERIC(7,2),
    PRIMARY KEY (keeperID) 
);

CREATE TABLE Cages (
    cageID INTEGER NOT NULL,
    cageSector CHAR(1) NOT NULL,
    keeperID INTEGER,
    PRIMARY KEY (cageID),
    FOREIGN KEY (keeperID) REFERENCES Keepers
);

CREATE TABLE Species (
    speciesID INTEGER NOT NULL,
    speciesName VARCHAR(40) NOT NULL,
    genus VARCHAR(40),
    animalCount INTEGER,
    UNIQUE (speciesName),
    PRIMARY KEY (speciesID)
);

CREATE TABLE Animals (
    animalID INTEGER NOT NULL,
    name VARCHAR(30),
    speciesID INTEGER,
    animalAge INTEGER,
    cageID INTEGER,
    UNIQUE (name),
    UNIQUE (speciesID),
    PRIMARY KEY (animalID),
    FOREIGN KEY (speciesID) REFERENCES Species,
    FOREIGN KEY (cageID) REFERENCES Cages
);

CREATE TABLE Members (
    memberID INTEGER NOT NULL,
    name VARCHAR(30),
    address VARCHAR(40),
    memberStatus CHAR(1),
    joinDATE DATE,
    expirationDATE DATE,
    UNIQUE (name),
    UNIQUE (address),
    PRIMARY KEY (memberID)
);

CREATE TABLE CageVisits (
    memberID INTEGER NOT NULL,
    cageID INTEGER NOT NULL,
    visitDATE DATE NOT NULL,
    likedVisit BOOLEAN,
    PRIMARY KEY (memberID, cageID, visitDATE),
    FOREIGN KEY (memberID) REFERENCES Members,
    FOREIGN KEY (cageID) REFERENCES Cages
);

