/*H***************************************************************
* FILENAME :        drop_tables.sql
*
* DESCRIPTION :
*       Each table in the airport database are dropped
*
* NOTES :
*       Copyright 2018, Jacob Wilkins.  All rights reserved.
* 
* AUTHOR :    Jacob Wilkins        START DATE :    31 Jan 18
*
*H*/

DROP TABLE IF EXISTS `Airport`;
DROP TABLE IF EXISTS `Flight`;
DROP TABLE IF EXISTS `FlightInstance`;
DROP TABLE IF EXISTS `PlaneType`;
DROP TABLE IF EXISTS `PlaneSeats`;
DROP TABLE IF EXISTS `Plane`;
DROP TABLE IF EXISTS `FlightLeg`;
DROP TABLE IF EXISTS `Pilot`;
DROP TABLE IF EXISTS `FlightLegInstance`;
DROP TABLE IF EXISTS `Passenger`;
DROP TABLE IF EXISTS `Reservation`;
