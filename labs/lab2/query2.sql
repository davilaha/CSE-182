/* Alex Davila
   CSE182 Database Managemnet Systems
*/

/* This query outputs the name and address and cageID whenever a member who has that 
   name and address VISITED the cage with that cageID and LIKED that cage visit
*/

/* 
Note matching of Primary Key attribute of Members to corresponding Foreign Key attribute of CageVisits.

DISTINCT is not used because query tells you not to eliminate duplicates.
*/

SELECT  m.name, m.address, cv.cageID 
FROM Members m, CageVisits cv
WHERE m.memberID =  cv.memberID
  AND cv.likedVisit = TRUE;

                 
