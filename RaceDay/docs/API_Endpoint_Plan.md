**RaceDay API Endpoint Plan**
**System Overview**
The RaceDay API offers the following features:
- Authentication
- User Profile Management
- Event Management
- Category Management
- Event Enrolments
- Results Management
- Route Information
- Weather Information

The following roles are supported by the system:

| **Role**      | **Description**                            |
|---------------|--------------------------------------------|
| None          | Public access, authentication not required |
| Any           | Any authenticated user                     |
| Organiser     | Organiser role only                        |
| Participant   | Participant role only                      |

**1. Authentication Endpoints**

| **HTTP Method** | **Route**            | **Description**                                                  | **Role Required** | **Request Body**                              | **Expected Response**                                                                                                  |
|-----------------|----------------------|------------------------------------------------------------------|-------------------|-----------------------------------------------|------------------------------------------------------------------------------------------------------------------------|
| POST            | /api/auth/register   | Register a new user account.                                    | None              | `{ firstName, lastName, email, password, role }` | **201 Created** - User account created. **400 Bad Request** - Invalid data. **409 Conflict** - Email already exists. |
| POST            | /api/auth/login      | Authenticate a user and return a JWT token.                     | None              | `{ email, password }`                         | **200 OK** - JWT token returned. **401 Unauthorized** - Invalid credentials.                                           |
| GET             | /api/auth/profile    | Retrieve the currently logged-in user's profile information.    | Any               | None                                          | **200 OK** - User profile returned. **401 Unauthorized** - User not authenticated.                                   |
| POST            | /api/auth/logout     | Log the current user out of the system.                         | Any               | None                                          | **200 OK** - Successfully logged out.                                                                                  |

**2. User Profile Endpoints**

| **HTTP Method** | **Route**                  | **Description**                         | **Role Required** | **Request Body**                         | **Expected Response**                                                                 |
|-----------------|----------------------------|-----------------------------------------|-------------------|------------------------------------------|---------------------------------------------------------------------------------------|
| GET             | /api/users/me              | View personal profile information.       | Any               | None                                     | **200 OK** - User profile returned.                                                  |
| PUT             | /api/users/me              | Update personal profile details.        | Any               | `{ firstName, lastName, email }`         | **200 OK** - Profile updated. **400 Bad Request** - Validation error.                |
| PUT             | /api/users/change-password | Change user password.                   | Any               | `{ currentPassword, newPassword }`       | **200 OK** - Password updated. **401 Unauthorized** - Incorrect current password.   |
| DELETE          | /api/users/me              | Delete user account.                    | Any               | None                                     | **204 No Content** - Account deleted.                                                |

**3. Event Endpoints**

| **HTTP Method** | **Route**             | **Description**                                         | **Role Required** | **Request Body**                                                         | **Expected Response**                                                           |
|-----------------|-----------------------|---------------------------------------------------------|-------------------|--------------------------------------------------------------------------|---------------------------------------------------------------------------------|
| GET             | /api/events           | Retrieve all upcoming events.                           | None              | None                                                                     | **200 OK** - List of events returned.                                          |
| GET             | /api/events/{id}      | Retrieve details of a specific event.                   | None              | None                                                                     | **200 OK** - Event details returned. **404 Not Found** - Event not found.      |
| POST            | /api/events           | Create a new event.                                     | Organiser         | `{ eventName, description, eventDate, venue, distanceKM, routeMapURL }` | **201 Created** - Event created.                                               |
| PUT             | /api/events/{id}      | Update an existing event.                               | Organiser         | `{ eventName, description, eventDate, venue, distanceKM, routeMapURL }` | **200 OK** - Event updated. **404 Not Found** - Event not found.                |
| DELETE          | /api/events/{id}      | Delete an event.                                        | Organiser         | None                                                                     | **204 No Content** - Event deleted. **404 Not Found** - Event not found.       |
| GET             | /api/events/organiser | Retrieve all events created by the logged-in organiser. | Organiser         | None                                                                     | **200 OK** - Organiser events returned.                                        |

**4. Category Endpoints**

| **HTTP Method** | **Route**                        | **Description**                                      | **Role Required** | **Request Body**                                      | **Expected Response**                                                            |
|-----------------|----------------------------------|------------------------------------------------------|-------------------|-------------------------------------------------------|----------------------------------------------------------------------------------|
| GET             | /api/events/{eventId}/categories | Retrieve all categories for a specific event.        | None              | None                                                  | **200 OK** - Categories returned.                                               |
| GET             | /api/categories/{id}              | Retrieve a specific category.                        | None              | None                                                  | **200 OK** - Category details returned. **404 Not Found** - Category not found. |
| POST            | /api/categories                   | Create a new event category.                         | Organiser         | `{ eventId, categoryName, minAge, maxAge, entryFee }` | **201 Created** - Category created.                                             |
| PUT             | /api/categories/{id}              | Update a category.                                   | Organiser         | `{ categoryName, minAge, maxAge, entryFee }`          | **200 OK** - Category updated.                                                  |
| DELETE          | /api/categories/{id}              | Delete a category.                                   | Organiser         | None                                                  | **204 No Content** - Category deleted.                                          |

**5. Event Enrolment Endpoints**

| **HTTP Method** | **Route**                       | **Description**                                       | **Role Required** | **Request Body**   | **Expected Response**                                                            |
|-----------------|---------------------------------|-------------------------------------------------------|-------------------|--------------------|----------------------------------------------------------------------------------|
| POST            | /api/enrolments                 | Register a participant for an event category.         | Participant       | `{ categoryId }`   | **201 Created** - Enrolment successful. **404 Not Found** - Category not found. |
| GET             | /api/enrolments/me              | Retrieve all enrolments of the logged-in participant. | Participant       | None               | **200 OK** - Participant enrolments returned.                                   |
| GET             | /api/events/{eventId}/enrolments | Retrieve all participant enrolments for an event.     | Organiser         | None               | **200 OK** - Event enrolments returned.                                         |
| GET             | /api/enrolments/{id}            | Retrieve details for a specific enrolment.            | Any               | None               | **200 OK** - Enrolment details returned. **404 Not Found** - Enrolment not found. |
| DELETE          | /api/enrolments/{id}            | Cancel an event enrolment.                            | Participant       | None               | **204 No Content** - Enrolment cancelled.                                       |

**6. Results Endpoints**

| **HTTP Method** | **Route**                      | **Description**                            | **Role Required** | **Request Body**                                                     | **Expected Response**                                                            |
|-----------------|--------------------------------|--------------------------------------------|-------------------|----------------------------------------------------------------------|----------------------------------------------------------------------------------|
| POST            | /api/results                   | Capture race results for a participant.    | Organiser         | `{ enrolmentId, finishTime, positionOverall, positionCategory }`    | **201 Created** - Result recorded.                                               |
| PUT             | /api/results/{id}              | Update an existing result.                 | Organiser         | `{ finishTime, positionOverall, positionCategory }`                 | **200 OK** - Result updated.                                                     |
| DELETE          | /api/results/{id}              | Remove an incorrect result.                | Organiser         | None                                                                 | **204 No Content** - Result deleted.                                             |
| GET             | /api/results/me                | Retrieve personal race results.            | Participant       | None                                                                 | **200 OK** - Results returned.                                                   |
| GET             | /api/events/{eventId}/results  | Retrieve all results for a specific event. | Any               | None                                                                 | **200 OK** - Event results returned.                                             |
| GET             | /api/results/{id}              | Retrieve details for a specific result.    | Any               | None                                                                 | **200 OK** - Result returned. **404 Not Found** - Result not found.              |

**7. Route Information Endpoints**

| **HTTP Method** | **Route**                     | **Description**                              | **Role Required** | **Request Body**                                                   | **Expected Response**                         |
|-----------------|-------------------------------|----------------------------------------------|-------------------|--------------------------------------------------------------------|-----------------------------------------------|
| GET             | /api/events/{eventId}/route   | Retrieve route information for an event.     | None              | None                                                               | **200 OK** - Route information returned.      |
| POST            | /api/events/{eventId}/route   | Create route information for an event.       | Organiser         | `{ startLocation, endLocation, routeDescription, gpxFileURL }`    | **201 Created** - Route created.              |
| PUT             | /api/routes/{id}              | Update route information.                    | Organiser         | `{ startLocation, endLocation, routeDescription, gpxFileURL }`    | **200 OK** - Route updated.                   |
| DELETE          | /api/routes/{id}              | Delete route information.                    | Organiser         | None                                                               | **204 No Content** - Route deleted.           |

**8. Weather Information Endpoints**

| **HTTP Method** | **Route**                      | **Description**                                      | **Role Required** | **Request Body**                                    | **Expected Response**                            |
|-----------------|--------------------------------|------------------------------------------------------|-------------------|-----------------------------------------------------|---------------------------------------------------|
| GET             | /api/events/{eventId}/weather  | Retrieve weather forecast information for an event. | None              | None                                                | **200 OK** - Weather forecast returned.           |
| POST            | /api/events/{eventId}/weather  | Create weather information for an event.            | Organiser         | `{ forecastDate, temperature, weatherCondition }`   | **201 Created** - Weather information recorded.   |
| PUT             | /api/weather/{id}              | Update weather information.                         | Organiser         | `{ forecastDate, temperature, weatherCondition }`   | **200 OK** - Weather information updated.         |
| DELETE          | /api/weather/{id}              | Delete weather information.                         | Organiser         | None                                                | **204 No Content** - Weather information deleted. |

**API Summary**

| **Module**             | **Number of Endpoints** |
|------------------------|-------------------------|
| Authentication         | 4                       |
| User Profile           | 4                       |
| Events                 | 6                       |
| Categories             | 5                       |
| Enrolments             | 5                       |
| Results                | 6                       |
| Route Information      | 4                       |
| Weather Information    | 4                       |
| **Total Endpoints**    | **38**                  |

**Planned Authentication Method**
-  (JSON Web Tokens)
- Role-Based Access Control (RBAC)
- Password hashing using BCrypt

**Standard HTTP Status Codes Used**

| **Code** | **Meaning**                    |
|----------|--------------------------------|
| 200      | Successful request             |
| 201      | Resource created               |
| 204      | Resource deleted successfully  |
| 400      | Bad request                    |
| 401      | Unauthorised                   |
| 403      | Forbidden                      |
| 404      | Resource not found             |
| 409      | Conflict (duplicate data)      |
| 500      | Internal server error          |