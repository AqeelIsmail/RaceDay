USE RaceDayDB;
GO

SELECT DB_NAME() AS CurrentDatabase;
GO
SELECT * FROM Events;
GO
CREATE TABLE RouteInfo (
    RouteID INT IDENTITY(1,1) PRIMARY KEY,

    EventID INT NOT NULL,

    StartLocation VARCHAR(150) NOT NULL,

    EndLocation VARCHAR(150) NOT NULL,

    RouteDescription VARCHAR(500) NOT NULL,

    GPXFileURL VARCHAR(255) NULL,

    CONSTRAINT FK_RouteInfo_Events
        FOREIGN KEY (EventID)
        REFERENCES Events(EventID)
);
GO