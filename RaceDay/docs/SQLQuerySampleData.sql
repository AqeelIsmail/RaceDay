USE RaceDayDB;
GO
/*
=====================================================
SAMPLE DATA FOR RACEDAY DATABASE
=====================================================
*/

-----------------------------------------------------
-- USERS
-- 2 Organisers
-- 2 Participants
-----------------------------------------------------
INSERT INTO Users
(
    FirstName,
    LastName,
    Email,
    PasswordHash,
    Role
)
VALUES
('John', 'Mkhize', 'john.mkhize@raceday.co.za', 'hashedpassword123', 'Organiser'),

('Sarah', 'Naidoo', 'sarah.naidoo@raceday.co.za', 'hashedpassword456', 'Organiser'),

('Thabo', 'Dlamini', 'thabo.dlamini@gmail.com', 'hashedpassword789', 'Participant'),

('Lerato', 'Molefe', 'lerato.molefe@gmail.com', 'hashedpassword101', 'Participant');



-----------------------------------------------------
-- EVENTS
-- 3 Events
-----------------------------------------------------
INSERT INTO Events
(
    OrganiserID,
    EventName,
    Description,
    EventDate,
    Venue,
    DistanceKM,
    RouteMapURL
)
VALUES
(
    1,
    'Durban City Marathon',
    'Annual road marathon in Durban.',
    '2027-04-11',
    'Durban',
    42.20,
    'https://raceday.co.za/routes/durban-marathon'
),

(
    1,
    'Umhlanga Cycle Challenge',
    'Premier cycling event along the north coast.',
    '2027-05-08',
    'Umhlanga',
    95.00,
    'https://raceday.co.za/routes/umhlanga-cycle'
),

(
    2,
    'Soweto Community Run',
    'Community half-marathon promoting healthy living.',
    '2027-06-20',
    'Soweto',
    21.10,
    'https://raceday.co.za/routes/soweto-run'
);



-----------------------------------------------------
-- CATEGORIES
-- At least one category per event
-----------------------------------------------------
INSERT INTO Categories
(
    EventID,
    CategoryName,
    MinAge,
    MaxAge,
    EntryFee
)
VALUES

-- Durban City Marathon
(1, 'Open', 18, 39, 350.00),
(1, 'Veteran', 40, 49, 350.00),

-- Umhlanga Cycle Challenge
(2, 'Open Cyclist', 18, 60, 420.00),

-- Soweto Community Run
(3, 'Open', 18, 39, 250.00),
(3, 'Masters', 40, 60, 250.00);



-----------------------------------------------------
-- ENROLMENTS
-- Sample Participant Entries
-----------------------------------------------------
INSERT INTO Enrolments
(
    ParticipantID,
    CategoryID,
    Status
)
VALUES

-- Thabo enters Durban Marathon Open
(3, 1, 'Active'),

-- Lerato enters Durban Marathon Veteran
(4, 2, 'Active'),

-- Thabo enters Umhlanga Cycle Challenge
(3, 3, 'Active'),

-- Lerato enters Soweto Community Run Open
(4, 4, 'Active');



-----------------------------------------------------
-- RESULTS
-- Sample Race Results
-----------------------------------------------------
INSERT INTO Results
(
    EnrolmentID,
    FinishTime,
    PositionOverall,
    PositionCategory
)
VALUES

(
    1,
    '03:12:45',
    15,
    6
),

(
    2,
    '03:48:10',
    38,
    10
),

(
    3,
    '02:37:54',
    8,
    3
);



-----------------------------------------------------
-- WEATHER INFORMATION
-----------------------------------------------------
INSERT INTO WeatherInfo
(
    EventID,
    ForecastDate,
    Temperature,
    WeatherCondition
)
VALUES

(
    1,
    '2027-04-11',
    24.5,
    'Sunny'
),

(
    2,
    '2027-05-08',
    21.0,
    'Partly Cloudy'
),

(
    3,
    '2027-06-20',
    18.5,
    'Cool and Clear'
);



-----------------------------------------------------
-- ROUTE INFORMATION
-----------------------------------------------------
INSERT INTO RouteInfo
(
    EventID,
    StartLocation,
    EndLocation,
    RouteDescription,
    GPXFileURL
)
VALUES

(
    1,
    'Durban City Hall',
    'Moses Mabhida Stadium',
    'Scenic coastal marathon route through Durban.',
    'https://raceday.co.za/gpx/durban-marathon.gpx'
),

(
    2,
    'Umhlanga Promenade',
    'Umhlanga Promenade',
    'Circular cycling route along the north coast.',
    'https://raceday.co.za/gpx/umhlanga-cycle.gpx'
),

(
    3,
    'Orlando Stadium',
    'Walter Sisulu Square',
    'Community running route through Soweto landmarks.',
    'https://raceday.co.za/gpx/soweto-run.gpx'
);



-----------------------------------------------------
-- VERIFY DATA
-----------------------------------------------------

SELECT * FROM Users;
SELECT * FROM Events;
SELECT * FROM Categories;
SELECT * FROM Enrolments;
SELECT * FROM Results;
SELECT * FROM WeatherInfo;
SELECT * FROM RouteInfo;