/* Alex Davila
 * CSE182 Database Management
 * Spring 2020
 */

import java.sql.*;
import java.io.*;
import java.util.*;

/**
 * A class that connects to PostgreSQL and disconnects.
 * You will need to change your credentials below, to match the usename and password of your account
 * in the PostgreSQL server.
 * The name of your database in the server is the same as your username.
 * You are asked to include code that tests the methods of the ZooApplication class
 * in a similar manner to the sample RunFilmsApplication.java program.
*/


public class RunZooApplication{
    public static void main(String[] args) {
    	
    	Connection connection = null;
    	try {
    	    //Register the driver
    		Class.forName("org.postgresql.Driver"); 
    	    // Make the connection.
            // You will need to fill in your real username (twice) and password for your
            // Postgres account in the arguments of the getConnection method below.
            connection = DriverManager.getConnection(
                                                     "jdbc:postgresql://cse182-db.lt.ucsc.edu/hdavilac",
                                                     "hdavilac",
                                                     "P@ssw*rdZZZ");
            
            if (connection != null)
                System.out.println("Connected to the database!");

            /* Include your code below to test the methods of the ZooApplication class.
             * The sample code in RunFilmsApplication.java should be useful.
             * That code tests other methods for a different database schema.
             * Your code below: */
			ZooApplication app = new ZooApplication(connection);
			
			// test of the getMemberStatusCount method 
			String memberStatus = "H";
			Integer statusCount = app.getMemberStatusCount(memberStatus);
			System.out.println("The count is "+statusCount);
			/*
			* Output of getMemberStatusCount
			* when the parameter theMemberStatus is ‘H’.
 			< The count is 5 >
			*/
			
			//test1 for the updateMemberAddress method
			Integer theMemberID_1 = 1006;
			String newMemberAddress_1 = "200 Rocky Road";
			Integer updateResult_1 = app.updateMemberAddress(theMemberID_1, newMemberAddress_1);
			System.out.println("Updated rows for memeberID 1006: "+updateResult_1);
			/*
			* Output of updateMemberAddress when theMemberID is 1006
			* and newMemberAddress is ‘200 Rocky Road’
 			< Updated rows 1>
			*/

			//test2 for the updateMemberAddress method
			Integer theMemberID_2 = 1011;
			String newMemberAddress_2 = "300 Rocky Road";
			Integer updateResult_2 = app.updateMemberAddress(theMemberID_2, newMemberAddress_2);
			System.out.println("Updated rows for memberID 1011: "+updateResult_2);
			/*
			* Output of updateMemberAddress when theMemberID is 10011
			* and newMemberAddress is ‘300 Rocky Road’
 			< Updated rows 0>
			*/

			//My Test
			Integer theMemberID_3 = 1001;
			String newMemberAddress_3 = "1245 Parkington Ave";
			Integer updateResult_3 = app.updateMemberAddress(theMemberID_3, newMemberAddress_3);
			System.out.println("Updated rows for memeberID 1001: "+updateResult_3);
			/*
			* Output of updateMemberAddress when theMemberID is 1001
			* and newMemberAddress is ‘1245 Parkington Ave’
 			< Updated rows 1>
			*/
			
			// test 1 for the increaseSomeKeeperSalaries method
			Integer maxAmount_1 = 451;
			Integer increasesResult_1 = app.increaseSomeKeeperSalaries(maxAmount_1);
			System.out.println("Output for increases result is "+increasesResult_1);

			// test 2 for the increaseSomeKeeperSalaries method
			Integer maxAmount_2 = 132;
			Integer increasesResult_2 = app.increaseSomeKeeperSalaries(maxAmount_2);
			System.out.println("Output for increases result is "+increasesResult_2);
            
            /*******************
            * Your code ends here */  
		}
		
    	catch (SQLException | ClassNotFoundException e) {
    		System.out.println("Error while connecting to database: " + e);
    		e.printStackTrace();
		}
		
    	finally {
    		if (connection != null) {
    			// Closing Connection
    			try {
					connection.close();
				} catch (SQLException e) {
					System.out.println("Failed to close connection: " + e);
					e.printStackTrace();
				}
    		}
    	}
    }
}
