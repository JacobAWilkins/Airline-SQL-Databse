CREATE TABLE `Airport` (
    `Code` CHAR(3) NOT NULL DEFAULT '',
    `City` VARCHAR(50) DEFAULT NULL,
    `State` CHAR(2) DEFAULT NULL,
    PRIMARY KEY (`Code`)
);

CREATE TABLE `Flight` (
    `FLNO` INT NOT NULL DEFAULT 0000,
    `Meal` VARCHAR(50) DEFAULT NULL,
    `Smoking` CHAR DEFAULT 'N',
    PRIMARY KEY (`FLNO`)
);

CREATE TABLE `FlightInstance` (
    `FLNO` INT NOT NULL DEFAULT 0000,
    `FDate` VARCHAR(10) DEFAULT NULL,
    PRIMARY KEY (`FLNO`, `FDate`),
    FOREIGN KEY (`FLNO`) REFERENCES `Flight` (`FLNO`)
);

CREATE TABLE `PlaneType` (
    `Maker` VARCHAR(50) NOT NULL DEFAULT '',
    `Model` VARCHAR(50) NOT NULL DEFAULT '',
    `FlyingSpeed` INT NOT NULL DEFAULT 0,
    `GroundSpeed` INT NOT NULL DEFAULT 0,
    PRIMARY KEY (`Maker`, `Model`)
);

CREATE TABLE `PlaneSeats` (
    `Maker` VARCHAR(50) NOT NULL DEFAULT '',
    `Model` VARCHAR(50) NOT NULL DEFAULT '',
    `SeatType` CHAR NOT NULL DEFAULT 'E',
    `NoOfSeats` INT NOT NULL DEFAULT 0,
    PRIMARY KEY (`Maker`, `Model`, `SeatType`),
    FOREIGN KEY (`Maker`, `Model`) REFERENCES `PlaneType` (`Maker`, `Model`)
);

CREATE TABLE `Plane` (
    `ID` INT NOT NULL DEFAULT 0,
    `Maker` VARCHAR(50) NOT NULL DEFAULT '',
    `Model` VARCHAR(50) NOT NULL DEFAULT '',
    `LastMaint` CHAR(3) NOT NULL DEFAULT '',
    `LastMaintA` CHAR(3) NOT NULL DEFAULT '',
    PRIMARY KEY (`ID`),
    FOREIGN KEY (`Maker`, `Model`) REFERENCES `PlaneType` (`Maker`, `Model`)
);

CREATE TABLE `FlightLeg` (
    `FLNO` INT NOT NULL DEFAULT 0000,
    `Seq` INT NOT NULL DEFAULT 0,
    `FromA` CHAR(3) NOT NULL DEFAULT '',
    `ToA` CHAR(3) NOT NULL DEFAULT '',
    `DeptTime` VARCHAR(16) DEFAULT NULL,
    `ArrTime` VARCHAR(16) DEFAULT NULL,
    `Plane` INT NOT NULL DEFAULT 0,
    PRIMARY KEY (`FLNO`, `Seq`),
    FOREIGN KEY (`FLNO`) REFERENCES `Flight` (`FLNO`),
    FOREIGN KEY (`FromA`) REFERENCES `Airport` (`Code`),
    FOREIGN KEY (`ToA`) REFERENCES `Airport` (`Code`),
    FOREIGN KEY (`Plane`) REFERENCES `Plane` (`ID`)
);

CREATE TABLE `Pilot` (
    `ID` INT NOT NULL DEFAULT 0,
    `Name` VARCHAR(50) DEFAULT NULL,
    `DateHired` VARCHAR(10) DEFAULT NULL,
    PRIMARY KEY (`ID`)
);

CREATE TABLE `FlightLegInstance` (
    `Seq` INT NOT NULL DEFAULT 0,
    `FLNO` INT NOT NULL DEFAULT 0000,
    `FDate` VARCHAR(10) DEFAULT NULL,
    `ActDept` VARCHAR(16) DEFAULT NULL,
    `ActArr` VARCHAR(16) DEFAULT NULL,
    `Pilot` INT NOT NULL DEFAULT 0,
    PRIMARY KEY (`Seq`, `FLNO`, `FDate`),
    FOREIGN KEY (`FLNO`, `Seq`) REFERENCES `FlightLeg` (`FLNO`, `Seq`),
    FOREIGN KEY (`FLNO`, `FDate`) REFERENCES `FlightInstance` (`FLNO`, `FDate`),
    FOREIGN KEY (`Pilot`) REFERENCES `Pilot` (`ID`)
);

CREATE TABLE `Passenger` (
    `ID` INT NOT NULL DEFAULT 0,
    `Name` VARCHAR(50) DEFAULT NULL,
    `Phone` CHAR(13) DEFAULT NULL,
    PRIMARY KEY (`ID`)
);

CREATE TABLE `Reservation` (
    `PassID` INT NOT NULL DEFAULT 0,
    `FLNO` INT NOT NULL DEFAULT 0000,
    `FDate` VARCHAR(10) DEFAULT NULL,
    `FromA` CHAR(3) NOT NULL DEFAULT '',
    `ToA` CHAR(3) NOT NULL DEFAULT '',
    `SeatClass` CHAR NOT NULL DEFAULT 'E',
    `DateBooked` VARCHAR(10) DEFAULT NULL,
    `DateCanceled` VARCHAR(10) DEFAULT NULL,
    PRIMARY KEY (`PassID`, `FLNO`, `FDate`),
    FOREIGN KEY (`PassID`) REFERENCES `Passenger` (`ID`),
    FOREIGN KEY (`FLNO`, `FDate`) REFERENCES `FlightInstance` (`FLNO`, `FDate`),
    FOREIGN KEY (`FromA`) REFERENCES `Airport` (`Code`),
    FOREIGN KEY (`ToA`) REFERENCES `Airport` (`Code`)
);
