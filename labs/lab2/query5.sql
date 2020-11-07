/* Alex Davila
   CSE182 Database Managemnet Systems
*/

/* This query will:
For each animal for which all of the following are true:
a) the animal’s speciesName has an ‘a’ (lowercase) in it, and
b) the genus of the animal’s species isn't NULL, and
c) the keeper of the animal’s cage was hired between January 2, 2019 and December 30, 2019 (including those dates), and
d) somebody visited that animal’s cage and did not like the cage visit.
*/

/*
DISTINCT is necessary, because the same animal might be visited multiple times, with all WHERE clause conditions satisfied.
*/
  

SELECT DISTINCT a.animalID AS theAnimalID, a.cageID AS theCageID, a.animalAge AS theAge, k.keeperID AS theKeeperID, k.hireDate AS theHireDate 
FROM Animals a, Species s, Keepers k, CageVisits cv, Cages c
WHERE a.speciesID = s.speciesID
  AND s.speciesName LIKE '%a%'
  AND s.genus IS NOT NULL
  AND a.cageID = c.cageID
  AND c.keeperID = k.keeperID
  AND k.hireDate >= DATE '2019-01-02' AND k.hireDate <= DATE '2019-12-30'
  AND c.cageID = cv.cageID
  AND cv.likedVisit = FALSE;
