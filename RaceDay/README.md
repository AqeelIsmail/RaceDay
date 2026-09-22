# RaceDay

## Portfolio of Evidence (PoE)
### Part 1 - System Planning and Database Design

---

# Project Overview

A web-based event management tool called RaceDay was created for the road running, walking, and cycling communities in South Africa.

The platform's goal is to replace manual event administration procedures, spreadsheets, and conventional paper-based registration systems with a cutting-edge digital alternative.

In addition to enabling participants to find events, register online, view enrollments, track results, and get ready for race day utilizing route and weather information, RaceDay gives event organizers the ability to plan and oversee athletic events.

This project is created gradually over several stages and is a component of a Portfolio of Evidence (PoE).

---

# Project Objectives

The RaceDay platform seeks to:

- Digitise the registration and administration of events.
- Enhance the experience of participants.
- Simplify responsibilities related to organizer administration.
- Offer online registration for events.
- Record and oversee race outcomes.
- Keep track of past participant performance.
- Give race route information.
- Give weather information for the race day.
- Put role-based access restriction into practice.
- Adhere to contemporary software development methodologies.

---

# User Roles

Two user roles are supported by the system.

## Organiser

An Organiser can:

- Create events
- Edit events
- Delete events
- Create event categories
- Manage categories
- View event enrolments
- Capture participant results
- Update participant results

---

## Participant

A Participant can:

- Create an account
- Login to the platform
- Browse upcoming events
- Enter events
- Select event categories
- View enrolments
- View personal results
- Track event history
- View route information
- View weather information

---

# Technologies Used

The planning phase uses the following technologies:

- GitHub
- GitHub Actions
- SQL Server Management Studio (SSMS)
- Draw.io / Lucidchart (ERD Design)
- Markdown Documentation

Future phases may include:

- ASP.NET Core Web API
- Entity Framework Core
- SQL Server
- Docker
- Cloud Deployment Services

---

# Project Structure

RaceDay
│
├── .github
│   └── workflows
│       └── validate.yml
│
├── docs
│   ├── RequirementsAnalysis.md
│   ├── EntityList.md
│   ├── ERD.png
│   ├── API_Endpoint_Plan.md
│   └── RaceDayDatabase.sql
│
└── README.md

---

# Part 1 Deliverables

## 1. Requirements Analysis

File:
docs/RequirementsAnalysis.md

Contains:

- Project overview
- Functional requirements
- Non-functional requirements
- User role analysis
- Business rules
- Assumptions and constraints

---

## 2. Entity List

File:
docs/EntityList.md

Contains:

- Entity descriptions
- Attributes
- Relationships
- Business rules
- Database planning information

---

## 3. Entity Relationship Diagram (ERD)

File:
docs/PROG6212ERD.drawio.png

Contains:

- All entities
- Primary keys
- Foreign keys
- Relationships
- Cardinalities

Entities included:

1. Users
2. Events
3. Categories
4. Enrolments
5. Results
6. WeatherInfo
7. RouteInfo

---

## 4. API Endpoint Plan

File:
docs/API_Endpoint_Plan.md