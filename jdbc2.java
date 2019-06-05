/*H***********************************************************************
* FILENAME :        jdbc2.java
*
* DESCRIPTION :
*       Uses jdbc to produce different views of the airline database
*
* NOTES :
*       For the user, password, db, and jdbc variables,
*       you must enter your own personal information.
*
*       Copyright 2018, Jacob Wilkins.  All rights reserved.
* 
* AUTHOR :    Jacob Wilkins        START DATE :    22 Apr 18
*
*H*/

import java.sql.*;
import java.util.Scanner;

final class mysql {
    
    final static String user = "username";
    final static String password = "password";
    final static String db = "databaseName";
    final static String jdbc = "connectionURL" + db + "?user=" + user + "&password=" + password;

    public static void main(String[] args) throws Exception {
        
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        Connection con = DriverManager.getConnection(jdbc);

        boolean bool = true;
        Scanner in = new Scanner(System.in);
        int a, ID, Seq;
        String name = "", dateHired = "", FLNO = "", FDate = "";

        while (bool) {
            
            System.out.println("1. Check if Pilot is busy on a certain day and show the pilot assignments for this day");
            System.out.println("2. Assign a Pilot to a flight leg instance");
            System.out.println("3. Add a Pilot");
            System.out.println("4. Quit");
            System.out.print("Enter a Number: ");
            a = in .nextInt();
            System.out.print("\n");
            
            int count = 0;
            ResultSet rs = null;
            Statement st = null;
            Statement stmt = null;
            
            switch (a) {
                    
                case 1:
                    System.out.print("Enter a name: ");
                    name = in.next();
                    System.out.print("Enter a date: ");
                    FDate = in.next();
                    System.out.print("\n");
                    count = 0;
                    
                    st = con.createStatement();
                    rs = st.executeQuery("SELECT p.ID, p.Name, fli.FLNO, fl.FromA, fl.ToA, fli.FDate FROM FlightLegInstance fli, FlightLeg fl, Pilot p WHERE fli.Pilot = p.ID AND fl.Seq = fli.Seq AND fl.FLNO = fli.FLNO AND p.Name = '" + name + "' AND fli.FDate = '" + FDate + "'");
                    
                    System.out.println("  \tID\tName\tFLNO\tFromA\tToA\tFDate");
                    System.out.println("       ---------------------------------------------------");
                    while(rs.next()) {
                        count++;
                        String str = rs.getString("p.ID") + "\t" + rs.getString("p.Name") + "\t" + rs.getString("fli.FLNO") + "\t" + rs.getString("fl.FromA") + "\t" + rs.getString("fl.ToA") + "\t" + rs.getString("fli.FDate");
                        System.out.println(count + ".\t" + str);
                    }
                    if (count > 0) {
                        System.out.println("\n" + name + " is busy this day!\n");
                    } else {
                        System.out.println("\n" + name + " is free this day!\n");
                    }

                    st.close();
                    break;

                case 2:
                    System.out.print("Enter new Pilot ID: ");
                    ID = in.nextInt();
                    System.out.print("Enter FLNO: ");
                    FLNO = in.next();
                    System.out.print("Enter Seq: ");
                    Seq = in.nextInt();
                    System.out.print("Enter Flight Date: ");
                    FDate = in.next();
                    
                    st = con.createStatement();
                    st.executeUpdate("UPDATE FlightLegInstance SET Pilot = '" + ID + "' WHERE FLNO = '" + FLNO + "' AND Seq = '" + Seq + "' AND FDate = '" + FDate + "'");

                    st.close();
                    break;

                case 3:
                    System.out.print("Enter an ID: ");
                    ID = in.nextInt();
                    System.out.print("Enter a name: ");
                    name = in.next();
                    System.out.print("Enter date hired: ");
                    dateHired = in.next();
                    
                    st = con.createStatement();
                    st.executeUpdate("INSERT INTO Pilot VALUES('" + ID + "', '" + name + "', '" + dateHired + "')");

                    st.close();
                    break;

                case 4:
                    bool = false;
                    break;
            }
        }

        con.close();
    }
}
