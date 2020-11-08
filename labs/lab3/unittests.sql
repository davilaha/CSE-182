/* Alex Davila
   CSE182 Database Managemnet Systems
   Lab 3
*/



/* This test inserts commands that violate Foreign Key constraints. */

/* Violates Foreign key constraint #1.  There is no such CageId in Cage*/
INSERT INTO CageVisits(memberID, cageID, visitDate, likedVisit)
  VALUES(1009, 215, DATE '4/5/20', TRUE);


/* Violates Foreign key constraint #2. There is no such memberID in Members */
INSERT INTO CageVisits(memberID, cageID, visitDate, likedVisit)
	VALUES(1015, 202, DATE '4/5/20', TRUE);


/* General constraints */

/* animalCount, okay */
UPDATE Species
SET animalCount = 100
WHERE speciesID= 401;


/* animalCount less than 0, violation */
UPDATE Species
SET animalCount = -1
WHERE speciesID= 401;

/* expirationDate, okay */
UPDATE Members
SET expirationDate = DATE '2020-05-03'
WHERE memberID = 1009;

/* expirationDate less than joinDate, violation */
UPDATE Members
SET expirationDate = DATE '2020-05-01'
WHERE memberID = 1009;

/* Keepers (Both of keeperSalary and keeperLevel are null), okay */
UPDATE Keepers
SET keeperSalary = NULL, keeperLevel = NULL
WHERE keeperID = 1;

/* Keepers: keeperLevel is null, but keeperSalary is not null, violation */
UPDATE Keepers
SET keeperSalary = '1111'
WHERE keeperLevel IS NULL;
