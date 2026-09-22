-- Create Database
-- CREATE DATABASE RaceDayDB;
-- GO
USE RaceDayDB;
GO


/*
=====================================================
TABLE: Users
Stores Organisers and Participants
=====================================================
*/
CREATE TABLE Users (
    UserID INT IDENTITY(1,1) PRIMARY KEY,

    FirstName VARCHAR(50) NOT NULL,

    LastName VARCHAR(50) NOT NULL,

    Email VARCHAR(100) NOT NULL UNIQUE,

    PasswordHash VARCHAR(255) NOT NULL,

    Role VARCHAR(20) NOT NULL
        CHECK (Role IN ('Organiser', 'Participant')),

    DateCreated DATETIME NOT NULL
        DEFAULT GETDATE()
);
GO


/*
=====================================================
TABLE: Events
Stores event details
=====================================================
*/
CREATE TABLE Events (
    EventID INT IDENTITY(1,1) PRIMARY KEY,

    OrganiserID INT NOT NULL,

    EventName VARCHAR(100) NOT NULL,

    Description VARCHAR(500) NOT NULL,

    EventDate DATE NOT NULL,

    Venue VARCHAR(150) NOT NULL,

    DistanceKM DECIMAL(6,2) NOT NULL
        CHECK (DistanceKM > 0),

    RouteMapURL VARCHAR(255) NULL,

    CreatedDate DATETIME NOT NULL
        DEFAULT GETDATE(),

    CONSTRAINT FK_Events_Users
        FOREIGN KEY (OrganiserID)
        REFERENCES Users(UserID)
);
GO


/*
=====================================================
TABLE: Categories
Event categories such as Open, Veteran, Junior
=====================================================
*/
CREATE TABLE Categories (
    CategoryID INT IDENTITY(1,1) PRIMARY KEY,

    EventID INT NOT NULL,

    CategoryName VARCHAR(50) NOT NULL,

    MinAge INT NOT NULL
        CHECK (MinAge >= 0),

    MaxAge INT NOT NULL,

    EntryFee DECIMAL(10,2) NOT NULL
        CHECK (EntryFee >= 0),

    CONSTRAINT CK_Categories_Age
        CHECK (MaxAge > MinAge),

    CONSTRAINT FK_Categories_Events
        FOREIGN KEY (EventID)
        REFERENCES Events(EventID)
        ON DELETE CASCADE
);
GO


/*
=====================================================
TABLE: Enrolments
Participant registrations for event categories
=====================================================
*/
CREATE TABLE Enrolments (
    EnrolmentID INT IDENTITY(1,1) PRIMARY KEY,

    ParticipantID INT NOT NULL,

    CategoryID INT NOT NULL,

    EnrolmentDate DATETIME NOT NULL
        DEFAULT GETDATE(),

    Status VARCHAR(20) NOT NULL
        DEFAULT 'Active'
        CHECK (Status IN ('Active', 'Cancelled')),

    CONSTRAINT FK_Enrolments_Users
        FOREIGN KEY (ParticipantID)
        REFERENCES Users(UserID),

    CONSTRAINT FK_Enrolments_Categories
        FOREIGN KEY (CategoryID)
        REFERENCES Categories(CategoryID),

    CONSTRAINT UQ_Enrolment
        UNIQUE (ParticipantID, CategoryID)
);
GO


/*
=====================================================
TABLE: Results
Race results captured by organisers
=====================================================
*/
CREATE TABLE Results (
    ResultID INT IDENTITY(1,1) PRIMARY KEY,

    EnrolmentID INT NOT NULL UNIQUE,

    FinishTime TIME NOT NULL,

    PositionOverall INT NOT NULL
        CHECK (PositionOverall > 0),

    PositionCategory INT NOT NULL
        CHECK (PositionCategory > 0),

    CONSTRAINT FK_Results_Enrolments
        FOREIGN KEY (EnrolmentID)
        REFERENCES Enrolments(EnrolmentID)
);
GO


/*
=====================================================
TABLE: WeatherInfo
Weather forecasts relating to events
=====================================================
*/
CREATE TABLE WeatherInfo (
    WeatherID INT IDENTITY(1,1) PRIMARY KEY,

    EventID INT NOT NULL,

    ForecastDate DATE NOT NULL,

    Temperature DECIMAL(4,1) NOT NULL,

    WeatherCondition VARCHAR(50) NOT NULL,

    CONSTRAINT FK_Weather_Events
        FOREIGN KEY (EventID)
        REFERENCES Events(EventID)
);
GO
