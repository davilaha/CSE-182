/* Alex Davila
   CSE182 Database Managemnet Systems
   Lab 3
*/

/*Animal Count Misreports for Each Species*/

/* Could use name of table/view instead of tuple variables */

SELECT s.speciesID, s.speciesName, s.animalCount, vc.computedAnimalCount
FROM Species s, viewComputedCount vc
WHERE s.speciesID = vc.speciesID
  AND s.animalCount != vc.computedAnimalCount;

/* Okay to write either <> or !=  in the WHERE clause */
/* DISTINCT is not necessary because there can only be at most one tuples per speciesID in the table and in the view.*/


-- query result before deletion:
/*
 speciesid | speciesname | animalcount | computedanimalcount 
-----------+-------------+-------------+---------------------
       404 | lion        |           2 |                   3
       405 | panther     |           0 |                   4
       407 | small cat   |           2 |                   4
(3 rows)
*/


DELETE FROM Animals 
WHERE animalID = 10014; 

DELETE FROM Animals 
WHERE animalID = 10015;



-- Run query again  
/*
It is okay if you don't repeat this query.
*/
SELECT s.speciesID, s.speciesName, s.animalCount, vc.computedAnimalCount
FROM Species s, viewComputedCount vc
WHERE s.speciesID = vc.speciesID
  AND s.animalCount != vc.computedAnimalCount;

-- query result after two deletions
/*
 speciesid | speciesname | animalcount | computedanimalcount 
-----------+-------------+-------------+---------------------
       401 | tiger       |           4 |                   3
       405 | panther     |           0 |                   4
       407 | small cat   |           2 |                   4
(3 rows)
*/