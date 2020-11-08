/* Alex Davila
   CSE182 Database Managemnet Systems
   Lab 3
*/

/*
Each cage in the CageVisits table must appear in the Cages table. (Explanation of what that means appear in the above paragraph.) 
If a Cages tuple is deleted and there are CageVisits for that cage, the deletion should be rejected. 
Also, if the Primary Key of a Cages tuple is updated, and there are CageVisits for that cage, then the update should be rejected. 
*/

/* Foreign Key constraints do not have to be named.  */

/* For all Foreign Key constraints, could explicitly indicated Referenced column, 
   e.g., writing:
        REFERENCES Cage(cageID) 
    for first constraint
*/

/* First Foreign Key Constraint */
ALTER TABLE CageVisits 
	ADD FOREIGN KEY(cageID) 
	REFERENCES Cages;


/* First equivalent way to write first Foreign Key Constraint */
/*ALTER TABLE CageVisits 
	ADD CONSTRAINT cage_constraint FOREIGN KEY(cageID) 
	REFERENCES Cages;
*/

/* Second equivalent way to write first Foreign Key Constraint */
/*ALTER TABLE CageVisits 
	ADD FOREIGN KEY(cageID) 
	REFERENCES Cages
		ON DELETE RESTRICT 
		ON UPDATE RESTRICT;
*/

/* Could write DEFAULT instead of RESTRICT */


/* Second Foreign Key Constraint */
/*
Each member that’s in the CageVisits table must appear in the Members table. If a tuple in the Members table is deleted, 
then all CageVisits for the corresponding memberID should also be deleted. If memberID for a tuple in the Members table is updated, 
then all CageVisits tuples for that memberID should be updated the same way.
*/
ALTER TABLE CageVisits 
	ADD FOREIGN KEY(memberID) 
	REFERENCES Members 
		ON DELETE CASCADE 
		ON UPDATE CASCADE;

/*An equivalent way to write first Foreign Key Constraint*/
/*
ALTER TABLE CageVisits 
	ADD CONSTRAINT member_constraint FOREIGN KEY(memberID) 
	REFERENCES Members 
		ON DELETE CASCADE 
		ON UPDATE CASCADE;

*/