/* Alex Davila
   CSE182 Database Managemnet Systems
*/

/* Finds the ID for all animals that are in the North Sector of the zoo. 
No duplicates should appear with this query. */

/* Version 1
DISTINCT is not needed because an animalID is associated with only one cage.
*/

SELECT a.animalID
FROM Animals a, Cages c
WHERE a.cageID = c.cageID
  AND c.cageSector = 'N';

/* Version 2
DISTINCT is not needed because each animalID is considered only once.
*/
SELECT animalID
FROM Animals 
WHERE cageID IN ( SELECT cageID 
		     FROM Cages 
		     WHERE  cageSector = 'N');

