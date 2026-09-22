**RaceDay System Requirements Analysis**
**Project Title**
RaceDay - Road Running, Walking and Cycling Event Management System

**1. Introduction**
RaceDay is an online event management system created especially for the road running, walking, and cycling community in South Africa. By substituting a centralised digital platform for manual procedures including paper-based registrations, spreadsheets, and disjointed communication channels, the system seeks to revolutionize the administration of athletic events.

Through an online system, the platform will give participants an easy method to find, enter, and follow events while enabling event organizers to oversee every facet of road events.

The primary stakeholders, user roles, functional and non-functional needs, business rules, and system features that will direct the RaceDay platform's design and development are all identified in this document's analysis of the project requirements.

**2. Problem Statement**
In South Africa, a lot of road running, walking, and cycling competitions are still run utilising antiquated techniques like:
- Registration forms on paper
- Spreadsheets in Excel
- Manually recording the outcome
- Email-based correspondence
- Physical records of participants
These methods frequently lead to:
- Errors in administration
- Records of duplicate participants
- Information lost
- Prolonged processing of results
- Unsatisfactory experience for participants
- An increase in the organisers' workload
By offering a consolidated digital platform for event management, RaceDay will address these issues.

**3. Project Objectives**
The RaceDay system's main goals are:

1. Digitise the procedures for event management and registration.
2. Enrolll participants online.
3. Permit event planners to effectively oversee events.
4. Record and disseminate participant outcomes.
5. Give participants the ability to monitor their past performance.
6. Make event route information accessible.
7. Give pertinent weather information for the day of the race.
8. Encourage role-based access control and safe user authentication.

**4. Stakeholders**
The system will be used by the following stakeholders:

| **Stakeholder**       | **Description** |
|-----------------------|------------------|
| Organisers            | People in charge of overseeing athletic activities |
| Participants          | Participants in cycling, walking, and running competitions |
| System Administrator  | Upkeep of the database and platform (future enhancement) |
| Event Sponsors        | Information about events may be used for marketing (future enhancement) |

**5. User Roles**
There are two main user roles supported by the RaceDay system.

**5.1 Organiser**
An organiser is in charge of planning and overseeing events.

**Organiser Responsibilities:**

- Make events
- Modify the event details
- Eliminate events
- Make categories for events
- Control the categories
- View the enrollment of participants
- Record participant outcomes
- Modify participant outcomes
- View every event's data

**Organiser Permissions:**
| **Action**          | **Allowed** |
|---------------------|-------------|
| Create Event        | Yes         |
| Edit Event          | Yes         |
| Delete Event        | Yes         |
| Create Categories   | Yes         |
| Edit Categories     | Yes         |
| Delete Categories   | Yes         |
| View Enrolments     | Yes         |
| Capture Results     | Yes         |
| Browse Events       | Yes         |

**5.2 Participant**
A user who enters and competes in activities is called a participant.

**Participant Responsibilities**

- Make an account
- Access the system by logging in
- View the events that are available
- Add events
- Choose categories
- View the enrollments
- View personal race results
- Keep track of past performance
- Obtain route details
- Obtain meteorological data

**Participant Permissions**

| **Action**          | **Allowed** |
|---------------------|-------------|
| Register Account    | Yes         |
| Browse Events       | Yes         |
| Enter Events        | Yes         |
| View Own Enrolments | Yes         |
| View Own Results    | Yes         |
| Capture Results     | No          |
| Create Event        | No          |
| Delete Event        | No          |

**6. Functional Requirements**
Functional requirements specify what the system needs to be able to do.

**FR1: User Registration**
New users will be able to register on the system as either:
- Organiser
- Participant

**Inputs**

- First Name
- Last Name
- Email Address
- Password
- Role

**Outputs**

- A user account was made
- Message of confirmation

**FR2: User Authentication**
Registered users will be able to access the system by using:
- Email Address
- Password

**Outputs**

- Logging in successfully
- Token or session for authentication
- Error message for credentials that are not valid

**FR3: User Profile Management**
The system will enable users who are signed in to:
- View your profile
- Modify the details of your profile
- Modify your password

**FR4: Event Management**
The system will enable Organisers to:
- Make events
- Update the events
- Eliminate events
- View the event's details

**Event Information**

- Event Name
- Description
- Event Date
- Venue
- Distance
- Route Information

**FR5: Category Management**
The system will enable event organisers to establish and oversee categories.

**Example Categories**

- Open
- Junior
- Veteran
- Masters
- Open Cycling

**Category Information**

- Category Name
- Minimum Age
- Maximum Age
- Entry Fee

**FR6: Event Browsing**
Participants will be able to peruse all forthcoming activities through the system.
Participants ought to be capable of:
- View the event's details
- View the categories
- View the route details
- View meteorological data

**FR7: Event Enrolment**
Participants will be able to register for an event through the system.

**Enrolment Process**

1. View the event that is available.
2. Choose an event.
3. Choose a category.
4. Send in your entry.

**Outputs**

- Confirmation of enrolment
- Database entry record

**FR8: Enrolment Management**
The system will permit:

**Participants**

- View your own enrollments
- Enrolment cancelations are optional.

**Organisers**

- View every person signed up for an event

**FR9: Results Management**
The system will enable Organisers to:
- Record participant completion times
- Keep track of positions
- Update the outcomes

**Result Information**

- Finish Time
- Overall Position
- Category Position

**FR10: Personal Performance Tracking**
Participants will be able to view:
- Previous results
- Event history
- Finishing times
- Placement History

**FR11: Route Information**
Route data for events will be stored by the system.

**Route Details**

- Start Location
- End Location
- Route Description
- Route Map
Route information must be accessible to competitors prior to race day.

**FR12: Weather Information**
Weather information for forthcoming events will be provided by the system.

**Weather Details**

- Forecast Date
- Temperature
- Weather Conditions
To help with race-day preparation, participants must be able to view weather information.

**7. Non-Functional Requirements**
Non-functional requirements outline the expected functionality of the system.

**NFR1: Security**
The system will:
- Passwords should be encrypted before being stored.
- Make use of secure authentication.
- Limit access based on user roles.
- Safeguard participant data.

**NFR2: Usability**
The system will:
- Be easy to utilise.
- Be reachable via a web browser.
- Make navigating simple.
- Both desktop and mobile devices are supported.

**NFR3: Reliability**
The system will:
- Ensure that the data is consistent.
- Manage several users at once.
- Avoid losing data.

**NFR4: Performance**
The system will:
- Pages load fast.
- Efficiently return API answers.
- Manage the simultaneous access of several participants to events.

**NFR5: Scalability**
The system will facilitate:
- Several occasions.
- Thousands of people took part.
- Upcoming feature additions.

**NFR6: Maintainability**
The system will:
- Adhere to industry-standard code conventions.
- Make use of GitHub for version control.
- Encourage CI/CD processes.

**8. Business Rules**
The RaceDay system is subject to the following business regulations.

**BR1**
A user can only play one role:
- Organiser
- Participant

**BR2**
Events can only be created, updated, or removed by Organisers.

**BR3**
Categories can only be managed by Organisers.

**BR4**
Results can only be recorded and updated by Organisers.

**BR5**
Only their own enrollments and individual outcomes are visible to participants.

**BR6**
An event can only have one Organiser.

**BR7**
There could be more than one category for an event.

**BR8**
A person may sign up for more than one event.

**BR9**
Every enrolment needs to be associated with a single participant and category.

**BR10**
Without a proper enrolment, results are not possible.

**9. Assumptions**
The following presumptions apply to the system's original version:

1. Every user has access to the internet.
2. Users provide a working email address when registering.
3. Payments for event entries are managed outside of the system.
4. Initially, weather data may be manually recorded.
5. Instead of being uploaded files, route maps are saved as URLs.
6. There are just two user roles needed.

**10. Risks and Constraints**
**Constraints**
- SQL Server must be used.
- The two necessary responsibilities must be supported.
- API endpoints must be included.
- GitHub must be used for version control.
- The GitHub Actions workflow must be included.

**Risks**
- A poorly designed database can eventually need to be redesigned.
- Future development may be impacted by inadequate API planning.
- Inaccurate data could arise from insufficient validation.

**11. Summary**
A based event management system called RaceDay was created to assist the road running, walking, and cycling communities in South Africa. In addition to giving participants a simple and effective way to find events, enter races, and monitor their own performance, the platform will allow organizers to manage events, categories, enrollments, and results. Through a cutting-edge web-based solution, the system will increase operational effectiveness, lessen administrative burden, and improve user experience.













