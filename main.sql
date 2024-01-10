SELECT 
    Cruise.id AS cruise_id,
    Cruise.departure_datetime,
    Cruise.arrival_datetime,
    PortDeparture.name AS departure_port_name,
    PortDeparture.address AS departure_port_address,
    PortArrival.name AS arrival_port_name,
    PortArrival.address AS arrival_port_address
FROM 
    Cruise
JOIN 
    Port AS PortDeparture ON Cruise.port_departure = PortDeparture.id
JOIN 
    Port AS PortArrival ON Cruise.port_arrival = PortArrival.id
WHERE 
    Cruise.departure_datetime IS NOT NULL
    AND Cruise.arrival_datetime IS NOT NULL
    AND PortDeparture.name = 'Charlevoix'
    AND PortArrival.name = 'South Haven'
    AND Cruise.id IN (
        SELECT 
            Cruise.id
        FROM 
            Cruise
        JOIN 
            Services ON Cruise.ferry_id = Services.id
        WHERE 
            Services.name = 'Cocktail Service'
    );
