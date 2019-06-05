/*H***********************************************************************
* FILENAME :        jdbc.java
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
        int a;

        while (bool) {
            
            System.out.println("1. View of Unassigned Pilot Flights");
            System.out.println("2. View of Due For Maintenance Planes");
            System.out.println("3. View of Pilot Fly Assignments");
            System.out.println("4. View of Pilot FlightLegs Count");
            System.out.println("5. Quit");
            System.out.print("Enter a Number: ");
            a = in .nextInt();
            System.out.print("\n");
            
            int count = 0;
            ResultSet rs = null;
            Statement st = null;
            Statement stmt = null;
            switch (a) {
                    
                case 1:
                    count = 0;
                    st = con.createStatement();
                    rs = st.executeQuery("SELECT FLNO, Seq, FDate FROM FlightLegInstance WHERE Pilot IS NULL");
                    
                    System.out.println("  \tFLNO\tSeq\tFDate");
                    System.out.println("       -----------------------");
                    while (rs.next()) {
                        count++;
                        String str = rs.getString("FLNO") + "\t" + rs.getString("Seq") + "\t" + rs.getString("FDate");
                        System.out.println(count + ".\t" + str);
                    }
                    System.out.println("\n");
                    rs.close();

                    try {
                        stmt = con.createStatement();
                        String str2 = "CREATE VIEW V1 As SELECT FLNO, Seq, FDate FROM FlightLegInstance WHERE Pilot IS NOT NULL";
                        stmt.executeUpdate(str2);
                        System.out.println("VIEW successfully created!\n");
                    } catch (SQLException e) {
                        System.out.println("VIEW already exists!\n");
                    }
                    st.close();
                    break;

                case 2:
                    count = 0;
                    st = con.createStatement();
                    rs = st.executeQuery("SELECT ID, Maker, Model, LastMaint FROM Plane WHERE LastMaint < DATE_ADD(SYSDATE(), INTERVAL -60 DAY)");
                    
                    System.out.println("  \tID\tMaker\tModel\tLastMaint");
                    System.out.println("       -----------------------------------");
                    while (rs.next()) {
                        count++;
                        String str = rs.getString("ID") + "\t" + rs.getString("Maker") + "\t" + rs.getString("Model") + "\t" + rs.getString("LastMaint");
                        System.out.println(count + ".\t" + str);
                    }
                    System.out.println("\n");
                    rs.close();

                    try {
                        stmt = con.createStatement();
                        String str2 = "CREATE VIEW V2 As SELECT ID, Maker, Model, LastMaint FROM Plane WHERE LastMaint < DATE_ADD(SYSDATE(), INTERVAL -60 DAY)";
                        stmt.executeUpdate(str2);
                        System.out.println("VIEW successfully created!\n");
                    } catch (SQLException e) {
                        System.out.println("VIEW already exists!\n");
                    }
                    st.close();
                    break;

                case 3:
                    
                    count = 0;
                    st = con.createStatement();
                    rs = st.executeQuery("SELECT p.ID, p.Name, fli.FLNO, fl.FromA, fl.ToA, fli.FDate FROM Pilot p, FlightLegInstance fli, FlightLeg fl WHERE fli.FLNO = fl.FLNO AND fli.Seq = fl.Seq AND p.ID = fli.Pilot");
                    
                    System.out.println("  \tID\tName\tFLNO\tFromA\tToA\tFDate");
                    System.out.println("       ---------------------------------------------------");
                    while(rs.next()) {
                        count++;
                        String str = rs.getString("p.ID") + "\t" + rs.getString("p.Name") + "\t" + rs.getString("fli.FLNO") + "\t" + rs.getString("fl.FromA") + "\t" + rs.getString("fl.ToA") + "\t" + rs.getString("fli.FDate");
                        System.out.println(count + ".\t" + str);
                    }
                    System.out.println("\n");
                    rs.close();
                    
                    try {
                        stmt = con.createStatement();
                        String str2 = "CREATE VIEW V3 As SELECT p.ID, p.Name, fli.FLNO, fl.FromA, fl.ToA, fli.FDate FROM Pilot p, FlightLegInstance fli, FlightLeg fl WHERE fli.FLNO = fl.FLNO AND fli.Seq = fl.Seq AND p.ID = fli.Pilot";
                        stmt.executeUpdate(str2);
                        System.out.println("VIEW successfully created!\n");
                    } catch (SQLException e) {
                        System.out.println("VIEW already exists!\n");
                    }
                    st.close();
                    break;

                case 4:
                    count = 0;
                    st = con.createStatement();
                    
                    rs = st.executeQuery("SELECT fli.Pilot, p.Name, fli.FDate, COUNT(*) FROM FlightLegInstance fli, Pilot p WHERE p.ID = fli.Pilot GROUP BY YEAR(fli.FDate) + '-' + MONTH(fli.FDate), fli.Pilot");
                    
                    System.out.println("  \tPilot\tName\tFDate\t\tCount");
                    System.out.println("       ---------------------------------------");
                    while (rs.next()) {
                        count++;
                        String str = rs.getString("fli.Pilot") + "\t" + rs.getString("p.Name") + "\t" + rs.getString("fli.FDate") + "\t" + rs.getString("COUNT(*)");
                        System.out.println(count + ".\t" + str);
                    }
                    System.out.println("\n");
                    rs.close();

                    try {
                        stmt = con.createStatement();
                        String str2 = "CREATE VIEW V4 SELECT fli.Pilot, p.Name, fli.FDate, COUNT(*) FROM FlightLegInstance fli, Pilot p WHERE p.ID = fli.Pilot GROUP BY YEAR(fli.FDate) + '-' + MONTH(fli.FDate), fli.Pilot";
                        stmt.executeUpdate(str2);
                        System.out.println("VIEW successfully created!\n");
                    } catch (SQLException e) {
                        System.out.println("VIEW already exists!\n");
                    }
                    st.close();
                    break;

                case 5:
                    bool = false;
                    break;
            }
        }

        con.close();
    }
}
