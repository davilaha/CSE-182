/* Alex Davila
   CSE182 Database Managemnet Systems
*/


/* This query finds the ID and name of each member whose name ends in ‘th’ (lowercase), 
and who VISITED a cage that has a lion inside. No duplicates appear in the result. */

/* Version 1: 
DISTINCT is needed because a member may visit cage containing a lion multiple times.*/

SELECT DISTINCT m.memberID, m.name 
FROM Members m, CageVisits cv, Animals a, Species s
WHERE  m.name LIKE '%th'
  AND  m.memberID = cv.memberID
  AND cv.cageID = a.cageID
  AND a.speciesID = s.speciesID
  AND s.speciesName = 'lion';

/* Version 2: 
DISTINCT is not needed because we only consider each member in the Members table once, and memberID is different for each member.
*/

SELECT m.memberID, m.name
FROM Members m
WHERE  EXISTS ( SELECT * 
  FROM CageVisits cv, Animals a, Species s
  WHERE  m.name LIKE '%th' 
  AND  m.memberID = cv.memberID
  AND cv.cageID = a.cageID
  AND a.speciesID = s.speciesID
  AND s.speciesName = 'lion'
   );
