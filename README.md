# Airline-SQL-Databse
This SQL database stores information about an airline company and uses JDBC to interact with it in Java.

### Introduction
This project builds a databse using mySQL and the uses jdbc to control the database in Java. There are 4 sql files that do the following tasks: ceate tables, insert information into tables, drop tables, and query tables. There are 2 jdbc Java files that allow you to view certain information about the database by using sequences of queries. These tasks are selected with a command line interface.

The tables in the database are connected by various foreign key references. This ensures referential integrity of the data. Each table also has a primary key to uniquely identify each record in the table. Some tables have a primary key with a single attribute and other tables have a primary key with muliple attributes.

### Attrubutes
- Airport(Code, City, State)
- Flight(FLNO, Meal, Smoking)
- FlightInstance(FLNO, FDate)
- PlaneType(Maker, Model, FlyingSpeed, GroundSpeed)
- PlaneSeats(Maker, Model, SeatType, NoOfSeats)
- Plane(ID, Maker, Model, LastMaint, LastMaintA)
- FlightLeg(FLNO, Seq, FromA, ToA, DeptTime, ArrTime, Plane)
- Pilot(ID, Name, DateHired)
- FlightLegInstance(Seq, FLNO, FDATE, ActDept, ActArr, Pilot)
- Passenger(ID, Name, Phone)
- Reservation(PassID, FLNO, FDate, FromA, ToA, SeatClass, DateBooked, DateCanceled)

### JDBC
For files related to Java Database Connectivity (JDBC), you must edit the code to include the data for your own database.
- **user** String should be your, you guessed it, username
- **password** String should be your password
- **jdbc** String should be the connection URL
  - Ex: jdbc:mysql://omega.uta.edu:3306/ + db + "?user=" + user + "&password=" + password;
 
