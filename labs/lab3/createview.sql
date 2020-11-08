/* Alex Davila
   CSE182 Database Managemnet Systems
   Lab 3
*/

/*
This query creates a view called viewComputedCount that has 2 attributes, speciesID and computedAnimalCount. 
This view has a tuple for each speciesID in the Species table that gives the computedAnimalCount 
for that speciesID. This view should have no duplicates in it.
*/


CREATE VIEW viewComputedCount AS 

    SELECT a.speciesID, COUNT(a.animalID) as computedAnimalCount
	FROM  Animals a
	GROUP BY a.speciesID 
	HAVING COUNT(a.animalID) >=3;

/* Solution #2, using join tables that gets computed count for each species that
   has animals.

   We could write COUNT(DISTINCT a.animalID). But DISTINCT is not necessary.
   Checking IS NOT NULL would be redundant
*/
/*
CREATE VIEW viewComputedCount AS 

    SELECT s.speciesID, COUNT(a.animalID) AS computedAnimalCount
	FROM  Species s, Animals a
	WHERE  a.speciesID = s.speciesID
	GROUP BY s.speciesID 
	HAVING COUNT(a.animalID) >=3;

*/
/* There are other correct solutions for this query.
*/



