/*H***************************************************************
* FILENAME :        create_tables.sql
*
* DESCRIPTION :
*       Random data is inserted into the airline database
*
* NOTES :
*       The tables were created in create_tables.sql
*
*       Copyright 2018, Jacob Wilkins.  All rights reserved.
* 
* AUTHOR :    Jacob Wilkins        START DATE :    31 Jan 18
*
*H*/

INSERT INTO `Airport` (`Code`, `City`, `State`) VALUES ('DFW', 'Dallas', 'TX');
INSERT INTO `Airport` (`Code`, `City`, `State`) VALUES ('LOG', 'Boston', 'MA');
INSERT INTO `Airport` (`Code`, `City`, `State`) VALUES ('ORD', 'Chicago', 'IL');
INSERT INTO `Airport` (`Code`, `City`, `State`) VALUES ('MDW', 'Chicago', 'IL');
INSERT INTO `Airport` (`Code`, `City`, `State`) VALUES ('JFK', 'New York', 'NY');
INSERT INTO `Airport` (`Code`, `City`, `State`) VALUES ('LGA', 'New York', 'NY');
INSERT INTO `Airport` (`Code`, `City`, `State`) VALUES ('INT', 'Houston', 'TX');
INSERT INTO `Airport` (`Code`, `City`, `State`) VALUES ('LAX', 'Los Angeles', 'CA');

INSERT INTO `Flight` (`FLNO`, `Meal`, `Smoking`) VALUES (1000, 'Bistro', 'Y');
INSERT INTO `Flight` (`FLNO`, `Meal`, `Smoking`) VALUES (1010, 'Meal', 'N');
INSERT INTO `Flight` (`FLNO`, `Meal`, `Smoking`) VALUES (1020, 'Meal', 'Y');
INSERT INTO `Flight` (`FLNO`, `Meal`, `Smoking`) VALUES (1030, 'Snack', 'N');
INSERT INTO `Flight` (`FLNO`, `Meal`, `Smoking`) VALUES (1040, 'Meal', 'N');

INSERT INTO `FlightInstance` (`FLNO`, `FDate`) VALUES (1000, '10/5/2002');
INSERT INTO `FlightInstance` (`FLNO`, `FDate`) VALUES (1000, '10/6/2002');
INSERT INTO `FlightInstance` (`FLNO`, `FDate`) VALUES (1000, '10/7/2002');
INSERT INTO `FlightInstance` (`FLNO`, `FDate`) VALUES (1010, '10/5/2002');
INSERT INTO `FlightInstance` (`FLNO`, `FDate`) VALUES (1010, '10/6/2002');
INSERT INTO `FlightInstance` (`FLNO`, `FDate`) VALUES (1020, '10/5/2002');
INSERT INTO `FlightInstance` (`FLNO`, `FDate`) VALUES (1030, '10/5/2002');
INSERT INTO `FlightInstance` (`FLNO`, `FDate`) VALUES (1040, '10/7/2002');

INSERT INTO `PlaneType` (`Maker`, `Model`, `FlyingSpeed`, `GroundSpeed`) VALUES ('MD', 'MD11', 600, 180);
INSERT INTO `PlaneType` (`Maker`, `Model`, `FlyingSpeed`, `GroundSpeed`) VALUES ('MD', 'SUPER80', 600, 180);
INSERT INTO `PlaneType` (`Maker`, `Model`, `FlyingSpeed`, `GroundSpeed`) VALUES ('BOEING', '727', 600, 180);
INSERT INTO `PlaneType` (`Maker`, `Model`, `FlyingSpeed`, `GroundSpeed`) VALUES ('BOEING', '757', 600, 180);
INSERT INTO `PlaneType` (`Maker`, `Model`, `FlyingSpeed`, `GroundSpeed`) VALUES ('AIRBUS', 'A300', 600, 180);
INSERT INTO `PlaneType` (`Maker`, `Model`, `FlyingSpeed`, `GroundSpeed`) VALUES ('AIRBUS', 'A320', 600, 180);

INSERT INTO `PlaneSeats` (`Maker`, `Model`, `SeatType`, `NoOfSeats`) VALUES ('MD', 'MD11', 'F', 20);
INSERT INTO `PlaneSeats` (`Maker`, `Model`, `SeatType`, `NoOfSeats`) VALUES ('MD', 'MD11', 'E', 150);
INSERT INTO `PlaneSeats` (`Maker`, `Model`, `SeatType`, `NoOfSeats`) VALUES ('MD', 'SUPER80', 'F', 10);
INSERT INTO `PlaneSeats` (`Maker`, `Model`, `SeatType`, `NoOfSeats`) VALUES ('MD', 'SUPER80', 'E', 90);
INSERT INTO `PlaneSeats` (`Maker`, `Model`, `SeatType`, `NoOfSeats`) VALUES ('BOEING', '727', 'F', 10);
INSERT INTO `PlaneSeats` (`Maker`, `Model`, `SeatType`, `NoOfSeats`) VALUES ('BOEING', '727', 'E', 110);
INSERT INTO `PlaneSeats` (`Maker`, `Model`, `SeatType`, `NoOfSeats`) VALUES ('BOEING', '757', 'F', 20);
INSERT INTO `PlaneSeats` (`Maker`, `Model`, `SeatType`, `NoOfSeats`) VALUES ('BOEING', '757', 'E', 160);
INSERT INTO `PlaneSeats` (`Maker`, `Model`, `SeatType`, `NoOfSeats`) VALUES ('AIRBUS', 'A300', 'F', 20);
INSERT INTO `PlaneSeats` (`Maker`, `Model`, `SeatType`, `NoOfSeats`) VALUES ('AIRBUS', 'A300', 'E', 160);
INSERT INTO `PlaneSeats` (`Maker`, `Model`, `SeatType`, `NoOfSeats`) VALUES ('AIRBUS', 'A320', 'F', 30);
INSERT INTO `PlaneSeats` (`Maker`, `Model`, `SeatType`, `NoOfSeats`) VALUES ('AIRBUS', 'A320', 'E', 200);

INSERT INTO `Plane` (`ID`, `Maker`, `Model`, `LastMaint`, `LastMaintA`) VALUES (1, 'MD', 'MD11', '09/03/2002', 'DFW');
INSERT INTO `Plane` (`ID`, `Maker`, `Model`, `LastMaint`, `LastMaintA`) VALUES (2, 'MD', 'MD11', '09/04/2002', 'MDW');
INSERT INTO `Plane` (`ID`, `Maker`, `Model`, `LastMaint`, `LastMaintA`) VALUES (3, 'MD', 'SUPER80', '09/01/2002', 'LAX');
INSERT INTO `Plane` (`ID`, `Maker`, `Model`, `LastMaint`, `LastMaintA`) VALUES (4, 'MD', 'SUPER80', '09/03/2002', 'ORD');
INSERT INTO `Plane` (`ID`, `Maker`, `Model`, `LastMaint`, `LastMaintA`) VALUES (5, 'MD', 'SUPER80', '09/06/2002', 'LGA');
INSERT INTO `Plane` (`ID`, `Maker`, `Model`, `LastMaint`, `LastMaintA`) VALUES (6, 'BOEING', '727', '09/01/2002', 'DFW');
INSERT INTO `Plane` (`ID`, `Maker`, `Model`, `LastMaint`, `LastMaintA`) VALUES (7, 'BOEING', '757', '09/02/2002', 'LAX');
INSERT INTO `Plane` (`ID`, `Maker`, `Model`, `LastMaint`, `LastMaintA`) VALUES (8, 'AIRBUS', 'A300', '09/01/2002', 'INT');
INSERT INTO `Plane` (`ID`, `Maker`, `Model`, `LastMaint`, `LastMaintA`) VALUES (9, 'AIRBUS', 'A320', '09/04/2002', 'LOG');

INSERT INTO `FlightLeg` (`FLNO`, `Seq`, `FromA`, `ToA`, `DeptTime`, `ArrTime`, `Plane`) VALUES (1000, 1, 'DFW', 'LOG', '1/1/2001 10:20', '1/1/2001 13:40', 7);
INSERT INTO `FlightLeg` (`FLNO`, `Seq`, `FromA`, `ToA`, `DeptTime`, `ArrTime`, `Plane`) VALUES (1010, 1, 'LAX', 'ORD', '1/1/2001 13:10', '1/1/2001 16:20', 3);
INSERT INTO `FlightLeg` (`FLNO`, `Seq`, `FromA`, `ToA`, `DeptTime`, `ArrTime`, `Plane`) VALUES (1010, 2, 'ORD', 'JFK', '1/1/2001 17:10', '1/1/2001 20:20', 3);
INSERT INTO `FlightLeg` (`FLNO`, `Seq`, `FromA`, `ToA`, `DeptTime`, `ArrTime`, `Plane`) VALUES (1020, 1, 'LOG', 'JFK', '1/1/2001 5:40', '1/1/2001 6:20', 9);
INSERT INTO `FlightLeg` (`FLNO`, `Seq`, `FromA`, `ToA`, `DeptTime`, `ArrTime`, `Plane`) VALUES (1020, 2, 'JFK', 'DFW', '1/1/2001 7:20', '1/1/2001 10:20', 9);
INSERT INTO `FlightLeg` (`FLNO`, `Seq`, `FromA`, `ToA`, `DeptTime`, `ArrTime`, `Plane`) VALUES (1020, 3, 'DFW', 'INT', '1/1/2001 11:10', '1/1/2001 11:40', 7);
INSERT INTO `FlightLeg` (`FLNO`, `Seq`, `FromA`, `ToA`, `DeptTime`, `ArrTime`, `Plane`) VALUES (1020, 4, 'INT', 'LAX', '1/1/2001 12:20', '1/1/2001 15:10', 7);
INSERT INTO `FlightLeg` (`FLNO`, `Seq`, `FromA`, `ToA`, `DeptTime`, `ArrTime`, `Plane`) VALUES (1030, 1, 'LAX', 'INT', '1/1/2001 11:20', '1/1/2001 16:10', 6);
INSERT INTO `FlightLeg` (`FLNO`, `Seq`, `FromA`, `ToA`, `DeptTime`, `ArrTime`, `Plane`) VALUES (1030, 2, 'INT', 'DFW', '1/1/2001 17:20', '1/1/2001 18:00', 6);
INSERT INTO `FlightLeg` (`FLNO`, `Seq`, `FromA`, `ToA`, `DeptTime`, `ArrTime`, `Plane`) VALUES (1040, 1, 'LAX', 'LGA', '1/1/2001 15:30', '1/1/2001 21:00', 1);

INSERT INTO `Pilot` (`ID`, `Name`, `DateHired`) VALUES (1, 'Jones', '5/10/1990');
INSERT INTO `Pilot` (`ID`, `Name`, `DateHired`) VALUES (2, 'Adams', '6/1/1990');
INSERT INTO `Pilot` (`ID`, `Name`, `DateHired`) VALUES (3, 'Walker', '7/2/1991');
INSERT INTO `Pilot` (`ID`, `Name`, `DateHired`) VALUES (4, 'Flores', '4/1/1992');
INSERT INTO `Pilot` (`ID`, `Name`, `DateHired`) VALUES (5, 'Thompson', '4/10/1992');
INSERT INTO `Pilot` (`ID`, `Name`, `DateHired`) VALUES (6, 'Dean', '9/2/1993');
INSERT INTO `Pilot` (`ID`, `Name`, `DateHired`) VALUES (7, 'Carter', '8/1/1994');
INSERT INTO `Pilot` (`ID`, `Name`, `DateHired`) VALUES (8, 'Mango', '5/2/1995');

INSERT INTO `FlightLegInstance` (`Seq`, `FLNO`, `FDate`, `ActDept`, `ActArr`, `Pilot`) VALUES (1, 1000, '10/5/2002', '1/1/2002 10:10', '1/1/2002 13:10', 3);
INSERT INTO `FlightLegInstance` (`Seq`, `FLNO`, `FDate`, `ActDept`, `ActArr`, `Pilot`) VALUES (1, 1000, '10/6/2002', '1/1/2002 10:30', '1/1/2002 14:20', 8);
INSERT INTO `FlightLegInstance` (`Seq`, `FLNO`, `FDate`, `ActDept`, `ActArr`, `Pilot`) VALUES (1, 1010, '10/5/2002', '1/1/2002 13:20', '1/1/2002 17:10', 1);
INSERT INTO `FlightLegInstance` (`Seq`, `FLNO`, `FDate`, `ActDept`, `ActArr`, `Pilot`) VALUES (2, 1010, '10/5/2002', '1/1/2002 18:00', '1/1/2002 21:00', 1);
INSERT INTO `FlightLegInstance` (`Seq`, `FLNO`, `FDate`, `ActDept`, `ActArr`, `Pilot`) VALUES (1, 1010, '10/6/2002', '1/1/2002 13:10', '1/1/2002 16:10', 3);
INSERT INTO `FlightLegInstance` (`Seq`, `FLNO`, `FDate`, `ActDept`, `ActArr`, `Pilot`) VALUES (2, 1010, '10/6/2002', '1/1/2002 17:00', '1/1/2002 20:30', 6);
INSERT INTO `FlightLegInstance` (`Seq`, `FLNO`, `FDate`, `ActDept`, `ActArr`, `Pilot`) VALUES (1, 1020, '10/5/2002', '1/1/2002 5:40', '1/1/2002 6:30', 5);
INSERT INTO `FlightLegInstance` (`Seq`, `FLNO`, `FDate`, `ActDept`, `ActArr`, `Pilot`) VALUES (2, 1020, '10/5/2002', '1/1/2002 7:30', '1/1/2002 10:40', 5);
INSERT INTO `FlightLegInstance` (`Seq`, `FLNO`, `FDate`, `ActDept`, `ActArr`, `Pilot`) VALUES (3, 1020, '10/5/2002', '1/1/2002 11:30', '1/1/2002 12:20', 5);
INSERT INTO `FlightLegInstance` (`Seq`, `FLNO`, `FDate`, `ActDept`, `ActArr`, `Pilot`) VALUES (4, 1020, '10/5/2002', '1/1/2002 13:00', '1/1/2002 16:00', 2);
INSERT INTO `FlightLegInstance` (`Seq`, `FLNO`, `FDate`, `ActDept`, `ActArr`, `Pilot`) VALUES (1, 1030, '10/5/2002', '1/1/2002 11:20', '1/1/2002 16:10', 8);
INSERT INTO `FlightLegInstance` (`Seq`, `FLNO`, `FDate`, `ActDept`, `ActArr`, `Pilot`) VALUES (2, 1030, '10/5/2002', '1/1/2002 17:20', '1/1/2002 18:40', 8);
INSERT INTO `FlightLegInstance` (`Seq`, `FLNO`, `FDate`) VALUES (1, 1000, '10/7/2002');
INSERT INTO `FlightLegInstance` (`Seq`, `FLNO`, `FDate`) VALUES (1, 1040, '10/7/2002');

INSERT INTO `Passenger` (`ID`, `Name`, `Phone`) VALUES (1, 'Jones', '(972)999-1111');
INSERT INTO `Passenger` (`ID`, `Name`, `Phone`) VALUES (2, 'James', '(214)111-9999');
INSERT INTO `Passenger` (`ID`, `Name`, `Phone`) VALUES (3, 'Henry', '(972)222-1111');
INSERT INTO `Passenger` (`ID`, `Name`, `Phone`) VALUES (4, 'Luis', '(972)111-3333');
INSERT INTO `Passenger` (`ID`, `Name`, `Phone`) VALUES (5, 'Howard', '(972)333-1111');
INSERT INTO `Passenger` (`ID`, `Name`, `Phone`) VALUES (6, 'Frank', '(214)111-5555');
INSERT INTO `Passenger` (`ID`, `Name`, `Phone`) VALUES (7, 'Frankel', '(972)111-2222');
INSERT INTO `Passenger` (`ID`, `Name`, `Phone`) VALUES (8, 'Bushnell', '(214)111-4444');
INSERT INTO `Passenger` (`ID`, `Name`, `Phone`) VALUES (9, 'Camden', '(214)222-5555');
INSERT INTO `Passenger` (`ID`, `Name`, `Phone`) VALUES (10, 'Max', '(972)444-1111');
INSERT INTO `Passenger` (`ID`, `Name`, `Phone`) VALUES (11, 'Flores', '(214)333-6666');
INSERT INTO `Passenger` (`ID`, `Name`, `Phone`) VALUES (12, 'Clinton', '(214)222-5555');

INSERT INTO `Reservation` (`PassID`, `FLNO`, `FDate`, `FromA`, `ToA`, `SeatClass`, `DateBooked`) VALUES (1, 1000, '10/5/2002', 'DFW', 'LOG', 'E', '9/5/2002');
INSERT INTO `Reservation` (`PassID`, `FLNO`, `FDate`, `FromA`, `ToA`, `SeatClass`, `DateBooked`) VALUES (1, 1020, '10/5/2002', 'LOG', 'JFK', 'E', '9/14/2002');
INSERT INTO `Reservation` (`PassID`, `FLNO`, `FDate`, `FromA`, `ToA`, `SeatClass`, `DateBooked`) VALUES (2, 1020, '10/5/2002', 'LOG', 'INT', 'E', '9/4/2002');
INSERT INTO `Reservation` (`PassID`, `FLNO`, `FDate`, `FromA`, `ToA`, `SeatClass`, `DateBooked`) VALUES (3, 1020, '10/5/2002', 'JFK', 'LAX', 'E', '9/19/2002');
INSERT INTO `Reservation` (`PassID`, `FLNO`, `FDate`, `FromA`, `ToA`, `SeatClass`, `DateBooked`) VALUES (4, 1020, '10/5/2002', 'LOG', 'LAX', 'E', '9/10/2002');
INSERT INTO `Reservation` (`PassID`, `FLNO`, `FDate`, `FromA`, `ToA`, `SeatClass`, `DateBooked`) VALUES (5, 1020, '10/5/2002', 'LOG', 'DFW', 'F', '9/29/2002');
INSERT INTO `Reservation` (`PassID`, `FLNO`, `FDate`, `FromA`, `ToA`, `SeatClass`, `DateBooked`) VALUES (6, 1010, '10/5/2002', 'LAX', 'JFK', 'E', '9/19/2002');
INSERT INTO `Reservation` (`PassID`, `FLNO`, `FDate`, `FromA`, `ToA`, `SeatClass`, `DateBooked`) VALUES (7, 1010, '10/5/2002', 'LAX', 'ORD', 'E', '9/27/2002');
INSERT INTO `Reservation` (`PassID`, `FLNO`, `FDate`, `FromA`, `ToA`, `SeatClass`, `DateBooked`) VALUES (8, 1030, '10/5/2002', 'LAX', 'DFW', 'F', '10/5/2002');
INSERT INTO `Reservation` (`PassID`, `FLNO`, `FDate`, `FromA`, `ToA`, `SeatClass`, `DateBooked`) VALUES (3, 1010, '10/6/2002', 'LAX', 'JFK', 'E', '9/14/2002');
INSERT INTO `Reservation` (`PassID`, `FLNO`, `FDate`, `FromA`, `ToA`, `SeatClass`, `DateBooked`) VALUES (9, 1010, '10/6/2002', 'LAX', 'JFK', 'E', '9/9/2002');
INSERT INTO `Reservation` (`PassID`, `FLNO`, `FDate`, `FromA`, `ToA`, `SeatClass`, `DateBooked`) VALUES (10, 1010, '10/6/2002', 'ORD', 'JFK', 'E', '9/7/2002');
INSERT INTO `Reservation` (`PassID`, `FLNO`, `FDate`, `FromA`, `ToA`, `SeatClass`, `DateBooked`) VALUES (11, 1000, '10/6/2002', 'DFW', 'LOG', 'E', '9/9/2002');
INSERT INTO `Reservation` (`PassID`, `FLNO`, `FDate`, `FromA`, `ToA`, `SeatClass`, `DateBooked`) VALUES (12, 1000, '10/6/2002', 'DFW', 'LOG', 'E', '9/19/2002');
INSERT INTO `Reservation` (`PassID`, `FLNO`, `FDate`, `FromA`, `ToA`, `SeatClass`, `DateBooked`) VALUES (1, 1010, '10/6/2002', 'ORD', 'JFK', 'E', '9/15/2002');
INSERT INTO `Reservation` (`PassID`, `FLNO`, `FDate`, `FromA`, `ToA`, `SeatClass`, `DateBooked`) VALUES (1, 1040, '10/7/2002', 'LAX', 'LGA', 'E', '10/1/2002');
