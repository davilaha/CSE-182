/* Alex Davila
   CSE182 Database Managemnet Systems
   Lab 3
*/

/*1.In Species, animalCount must be greater or equal to zero. Name of constraint is needed. 
*/

/* Name is needed for this constraint. Any name works. */

ALTER TABLE Species 
ADD CONSTRAINT ani 
    CHECK(animalCount >= 0);


/*2. In Members, expirationDate must not be before joinDate.*/
/* Name is not required for this constraint, but okay to have name. */

ALTER TABLE Members 
ADD CONSTRAINT expirationDate_constraint 
  CHECK(expirationDate >= joinDate);

/* 
   Could also write:   CHECK( NOT(expirationDate < joinDate) )  
*/


/*3. In Keepers, if keeperLevel is NULL, then keeperSalary must also be NULL.*/
/* Name is not required for this constraint, but okay to have name. */
/* IF A THEN B logically correspond to (NOT A) OR B */

ALTER TABLE Keepers 
ADD CHECK( (keeperLevel IS NOT NULL) OR (keeperSalary IS NULL) );

/* 
  There are other logically equivalent ways to write this constraint, such as
	CHECK( (keeperLevel IS NOT NULL AND keeperSalary IS NOT NULL) OR (keeperSalary IS NULL) 
*/
