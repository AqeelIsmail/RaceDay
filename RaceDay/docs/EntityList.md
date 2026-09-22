**RaceDay System Entity List**
**Project Title**
**RaceDay - Road Running, Walking and Cycling Event Management System**

**1. Introduction**
Every entity needed for the RaceDay database is identified and described in this paper. The system requirements and user roles found during the analysis phase served as the basis for these entities.

The Entity Relationship Diagram (ERD) and SQL database design are built upon the entity list.

Seven (7) key components make up the RaceDay system, which supports weather forecasting, route information, participant enrollment, event management, and result monitoring.

**2. Entity Overview**
| **Entity**   | **Purpose** |
|--------------|-------------|
| Users        | Keeps participant and organizer accounts |
| Events       | Keeps track of event details |
| Categories   | Keeps categories for event participation |
| Enrolments   | Keeps track of participant entries for events |
| Results      | Keeps track of participant race outcomes |
| WeatherInfo  | Keeps track of weather forecasts |
| RouteInfo    | Keeps track of event route information |

**3. Users Entity**
**Description**
All system users who have registered are stored in the Users object.

One of two roles is possible for a user:
- Organiser
- Participant

Throughout the system, this object facilitates role-based access control and authentication.

**Attributes**

| **Attribute**       | **Data Type**  | **Description** |
|---------------------|----------------|-----------------|
| UserID (PK)         | INT            | Unique identifier for each user |
| FirstName           | VARCHAR(50)    | User first name |
| LastName            | VARCHAR(50)    | User last name |
| Email               | VARCHAR(100)   | User email address |
| PasswordHash        | VARCHAR(255)   | Encrypted password |
| Role                | VARCHAR(20)    | Organiser or Participant |
| DateCreated         | DATETIME       | Date account was created |

**Business Rules**
- UserID needs to be distinct.
- Emails need to be distinct.
- There can only be one role for a user.
- Passwords need to be kept safe.
- Either the Organiser or the Participant role is required.

**Relationships**

**Organiser**

One Organiser can create many Events.
Users (Organiser) 1 ----- M Events

**Participant**

One Participant can have many Enrolments.
Users (Participant) 1 ----- M Enrolments

**4. Events Entity**	
**Description**
Races, fun runs, walks, and cycling events are all stored in the Events entity.
Each event is managed by a single organiser.

**Attributes**

| **Attribute**       | **Data Type**  | **Description** |
|---------------------|----------------|-----------------|
| EventID (PK)       | INT            | Unique event identifier |
| OrganiserID (FK)   | INT            | Organiser responsible for event |
| EventName          | VARCHAR(100)   | Event name |
| Description        | VARCHAR(500)   | Event description |
| EventDate          | DATE           | Date of the event |
| Venue              | VARCHAR(100)   | Event location |
| DistanceKM         | DECIMAL(5,2)   | Event distance |
| RouteMapURL        | VARCHAR(255)   | Link to route map |
| CreatedDate        | DATETIME       | Record creation date |

**Business Rules**
- There must be an organiser for every event.
- Multiple events can be created by an organiser.
- The date of the event must be mentioned.
- The name of the event is necessary.

**Relationships**
Users 1 ----- M Events
Events 1 ----- M Categories
Events 1 ----- M WeatherInfo
Events 1 ----- 1 RouteInfo

**5. Categories Entity**
**Description**
Divisions within an event are defined by categories.

Examples consist of:
- Open
- Junior
- Veteran
- Masters
- Open Cycling

Participants enter an event through a category.

**Attributes**

| **Attribute**    | **Data Type**   | **Description** |
|------------------|-----------------|-----------------|
| CategoryID (PK)  | INT             | Unique category identifier |
| EventID (FK)     | INT             | Event associated with category |
| CategoryName     | VARCHAR(50)     | Category name |
| MinAge           | INT             | Minimum age requirement |
| MaxAge           | INT             | Maximum age requirement |
| EntryFee         | DECIMAL(10,2)   | Category entry fee |

**Business Rules**
- Every category belongs to one event.
- There could be more than one category for an event.
- Entry fee cannot be negative.
- Age limitations must be legitimate.

**Relationships**
Events 1 ----- M Categories
Categories 1 ----- M Enrolments

**6. Enrolments Entity**
**Description**
Participant registrations are kept on file by the Enrolments business.

The many-to-many link between Participants and Categories is resolved by this entity.

A category may have a large number of participants, and a participant may enter multiple categories across various events.

**Attributes**

| **Attribute**       | **Data Type** | **Description**              |
|---------------------|---------------|------------------------------|
| EnrolmentID (PK)    | INT           | Unique enrolment identifier  |
| ParticipantID (FK)  | INT           | Participant entering event   |
| CategoryID (FK)     | INT           | Selected category            |
| EnrolmentDate       | DATETIME      | Date of entry                |
| Status              | VARCHAR(20)   | Entry status                 |

**Example Status Values**
- Active
- Cancelled
- Completed

**Business Rules**
- Prior to enrolment, the participant must exist.
- Prior to enrolment, the category must exist.
- The date of enrolment is automatically entered.
- One participant and one category are associated with each entry.

**Relationships**
Users (Participant) 1 ----- M Enrolments
Categories 1 ----- M Enrolments
Enrolments 1 ----- 0..1 Results

**7. Results Entity**
**Description**
Race completion data is kept in the Results object.

After an event is over, the organisers enter the results.

**Attributes**

| **Attribute**       | **Data Type** | **Description**             |
|---------------------|---------------|-----------------------------|
| ResultID (PK)       | INT           | Unique result identifier    |
| EnrolmentID (FK)    | INT           | Associated enrolment        |
| FinishTime          | TIME          | Official finish time        |
| PositionOverall     | INT           | Overall finishing position  |
| PositionCategory    | INT           | Category finishing position |

**Business Rules**
- Without enrolment, results are impossible.
- There can only be one outcome per enrolment.
- The organisers record the results.

**Relationships**
Enrolments 1 ----- 0..1 Results

**8. WeatherInfo Entity**
**Description**
Weather forecasts related to an event are stored in the WeatherInfo entity.
This information can help participants be ready for the conditions on race day.

**Attributes**

| **Attribute**        | **Data Type**  | **Description**                    |
|----------------------|----------------|------------------------------------|
| WeatherID (PK)       | INT            | Unique weather record identifier   |
| EventID (FK)         | INT            | Related event                      |
| ForecastDate         | DATE           | Forecast date                      |
| Temperature          | DECIMAL(4,1)   | Expected temperature               |
| WeatherCondition     | VARCHAR(50)    | Weather description                |

**Example Conditions**
- Sunny
- Cloudy
- Rainy
- Windy

**Business Rules**
- A weather forecast needs to be related to an event.
- For a single event, there may be several weather records.

**Relationships**
Events 1 ----- M WeatherInfo
`

**9. RouteInfo Entity**
**Description**
Route information for events is stored in the RouteInfo entity.
Before the event, participants can plan their preparation and race strategy by viewing route information.

**Attributes**

| **Attribute**        | **Data Type**  | **Description**         |
|----------------------|----------------|-------------------------|
| RouteID (PK)         | INT            | Unique route identifier |
| EventID (FK)         | INT            | Related event           |
| StartLocation        | VARCHAR(100)   | Route starting point    |
| EndLocation          | VARCHAR(100)   | Route ending point      |
| RouteDescription     | VARCHAR(500)   | Route information       |
| GPXFileURL           | VARCHAR(255)   | Link to route file      |

**Business Rules**
- Every route is associated with a single event.
- There should be a route for every event.
- Valid places must be included in route information.

**Relationships**
Events 1 ----- 1 RouteInfo

**10. Entity Relationship Summary**
The RaceDay system has the following relationships:

| **Parent Entity**     | **Relationship** | **Child Entity** |
|-----------------------|------------------|------------------|
| Users (Organiser)     | 1:M              | Events            |
| Events                | 1:M              | Categories        |
| Users (Participant)   | 1:M              | Enrolments        |
| Categories            | 1:M              | Enrolments        |
| Enrolments            | 1:0..1           | Results           |
| Events                | 1:M              | WeatherInfo       |
| Events                | 1:1              | RouteInfo         |

**11. Database Design Justification**
All of the RaceDay system's functional needs are supported by the chosen entities:
- Role management and authentication are provided by users.
- Race data is stored in events.
- Categories divide entrants into groups.
- Participant registrations are managed via enrolments.
- Race performance is tracked by results.
- Race preparation is aided by WeatherInfo.
- RouteInfo offers information about route planning.

Using distinct entities guaranties:
- Normalisation of data.
- Decreased redundant data.
- Enhanced scalability.
- Effective relationship management.
- Easier system growth in the future.

**12. Conclusion**
Organiser management, participant registration, event administration, category management, race result tracking, route planning, and weather forecasts are all supported by the RaceDay database's seven main components. These items serve as the basis for the SQL database schema and ERD that will be used in later stages of the project.







