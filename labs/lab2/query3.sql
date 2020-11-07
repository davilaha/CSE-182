/* Alex Davila
   CSE182 Database Managemnet Systems
*/

/* This query finds the ID, name and salary for each keeper who is the keeper for a cage which has both 
a lion and a tiger inside. The tuples with the biggest salary appear first; 
result tuples that have the same salary, appear alphabetized by name.
*/

/* 
DISTINCT is needed because there may be more than one cage kept by a keeper that has both a lion and a tiger in it. 
*/

SELECT DISTINCT k.keeperID, k.name, k.keeperSalary
FROM Keepers AS k, Animals AS a1, Animals AS a2, Cages AS c, Species AS s1, Species AS s2
WHERE k.keeperID = c.keeperID 
  AND c.cageID = a1.cageID
  AND a1.speciesID = s1.speciesID
  AND s1.speciesName = 'lion'
  AND c.cageID = a2.cageID
  AND a1.animalID != a2.animalID
  AND a2.speciesID = s2.speciesID
  AND s2.speciesName = 'tiger'
ORDER BY k.keeperSalary DESC, k.name ASC;

/* It's okay not to write ASC in either version, since the default is ASCENDING. */