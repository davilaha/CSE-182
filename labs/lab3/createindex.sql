/* Alex Davila
   CSE182 Database Managemnet Systems
   Lab 3
*/

/*Create an index named FindMembers over the name and address columns (in that order) of the Members table*/
CREATE INDEX FindMembers 
  ON Members(name, address);