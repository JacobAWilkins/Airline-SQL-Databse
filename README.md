# Airline-SQL-Databse
This database stores information about flight schedules for an airline company and uses JDBC to interact with it in Java.

### Categories
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
 
