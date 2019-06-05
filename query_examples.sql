-- 1. Retrieve the ID, the model, and the last maintenance date for each plan that was made by 'AIRBUS'

SELECT ID, model, LastMaint FROM Plane WHERE Maker = 'AIRBUS';

-- 2. Retrieve the names of passengers who had reservations on flights with meals.

SELECT DISTINCT p.ID, p.name
FROM Passenger p, Reservation r, FlightInstance fi, Flight f
WHERE ID = PassID AND r.FDate = fi.FDate AND f.Meal = 1 AND fi.FLNO = f.FLNO AND fi.FLNO = r.FLNO;

-- 3. Retrieve the names of pilots who flew FROM any airport in 'TX'.

SELECT DISTINCT Name
FROM Pilot p, FlightLegInstance fli, FlightLeg fl, Airport a
WHERE p.ID = fli.Pilot AND fli.FLNO = fl.FLNO AND fli.Seq = fl.Seq AND fl.FromA = a.Code AND a.State = 'TX';

-- 4. Retrieve the total number of flights for the passenger 'Jones'.

SELECT COUNT(*) AS 'Total Number of Flights For Jones'
FROM Passenger p, Reservation r 
WHERE p.ID = r.PassID AND p.name = 'Jones';

-- 5. Retrieve every plane maker, model plane type that lands in CA.

SELECT pt.Maker, pt.Model
FROM FlightLeg fl, Plane p, PlaneType pt, Airport a
WHERE pt.Model = p.Model AND p.ID = fl.Plane AND fl.ToA = a.Code AND a.State = 'CA';

-- 6. Retrieve the Maker and the total number of planes made by this Maker, for Makers who make any plane with total number of seats more than 350.

SELECT pt.Maker, COUNT(*) AS 'Number of Planes by this Maker'
FROM PlaneSeats ps, PlaneType pt, Plane p
WHERE ps.Maker = pt.Maker AND p.Maker = pt.Maker AND ps.Model = pt.Model AND p.Model = pt.Model AND ps.NoOfSeats > 350
GROUP BY p.Maker;

-- 7. Retrieve all flight numbers that depart from or arrive at airport DFW

SELECT FLNO
FROM FlightLeg
WHERE FromA = 'DFW' OR ToA = 'DFW';

-- 8. Retrieve the Maker, Model, and total number of seats of planes that has more than 300 seats in total.

SELECT Maker, Model, NoOfSeats
FROM PlaneSeats
WHERE NoOfSeats > 300;
