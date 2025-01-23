# Construction Task Management Database

This project defines a relational database schema for managing construction tasks, clients, projects, users, and related entities.

## Database Schema

The following tables and their relationships are defined in the schema:

**1. Clients:**

*   `Client_Id` (INT, Primary Key): Unique identifier for each client.
*   `Company_Name` (VARCHAR): Name of the client company.
*   `Client_Name` (VARCHAR): Name of the contact person at the client company.
*   `Email` (VARCHAR, Unique): Email address of the client contact.
*   `Phone_Number` (VARCHAR): Phone number of the client contact.
*   `Address` (TEXT): Address of the client company.
*   `Project` (VARCHAR): Name of the associated project.
*   `Created_at` (DATETIME): Timestamp of when the client record was created.
*   `Updated_at` (DATETIME): Timestamp of the last update to the client record.

**2. Users:**

*   `User_Id` (INT, Primary Key): Unique identifier for each user.
*   `User_Name` (VARCHAR): Username of the user.
*   `Email` (VARCHAR): Email address of the user.
*   `Phone_Number` (VARCHAR): Phone number of the user.
*   `Role` (VARCHAR): Role of the user (e.g., Project Manager, Engineer, etc.).
*   `Registration_Date` (DATETIME): Date and time when the user registered.

**3. Projects:**

*   `Project_Id` (INT, Primary Key): Unique identifier for each project.
*   `Project_Name` (VARCHAR): Name of the project.
*   `Client_Id` (INT, Foreign Key referencing Clients): ID of the client associated with the project.
*   `Description` (TEXT): Description of the project.
*   `Start_Date` (DATE): Start date of the project.
*   `End_Date` (DATE): End date of the project.
*   `Status` (ENUM): Current status of the project (e.g., Planned, In Progress, Completed, On Hold).
*   `Created_at` (DATETIME): Timestamp of when the project record was created.
*   `Updated_at` (DATETIME): Timestamp of the last update to the project record.

**4. Tasks:**

*   `Task_Id` (INT, Primary Key): Unique identifier for each task.
*   `Project_Id` (INT, Foreign Key referencing Projects): ID of the project associated with the task.
*   `Assigned_To` (INT, Foreign Key referencing Users): ID of the user assigned to the task.
*   `Category_Id` (INT, Foreign Key referencing Task_Categories): ID of the task category.
*   `Task_Title` (VARCHAR): Title of the task.
*   `Description` (VARCHAR): Description of the task.
*   `Start_Date` (DATE): Start date of the task.
*   `End_Date` (DATE): End date of the task.
*   `Priority` (ENUM): Priority of the task (e.g., Low, Medium, High).
*   `Status` (ENUM): Status of the task (e.g., Not Started, In Progress, Completed).
*   `Created_at` (DATETIME): Timestamp of when the task record was created.
*   `Updated_at` (DATETIME): Timestamp of the last update to the task record.

**5. Task_Categories:**

*   `Category_Id` (INT, Primary Key): Unique identifier for each task category.
*   `Category_Name` (VARCHAR, Unique): Name of the task category.
*   `Description` (TEXT): Description of the task category.
*   `In_Active` (BOOLEAN): Flag indicating whether the category is active or inactive.
*   `Created_at` (DATETIME): Timestamp of when the category record was created.
*   `Updated_at` (DATETIME): Timestamp of the last update to the category record.

**6. Milestones:**

*   `Milestone_Id` (INT, Primary Key): Unique identifier for each milestone.
*   `Project_ID` (INT, Foreign Key referencing Projects): ID of the project associated with the milestone.
*   `Name` (VARCHAR): Name of the milestone.
*   `Description` (VARCHAR): Description of the milestone.
*   `Due_Date` (DATE): Due date of the milestone.
*   `Status` (ENUM): Status of the milestone (e.g., Planned, Archived, Delayed).
*   `Created_at` (DATETIME): Timestamp of when the milestone record was created.
*   `Updated_at` (DATETIME): Timestamp of the last update to the milestone record.

**Installation**

1. Create a new MySQL database.
2. Execute the SQL script (`create_tables.sql`) to create the tables in the database.

**Usage**

*   Use SQL queries to interact with the database, such as:
    *   Insert, update, and delete records.
    *   Retrieve data based on various criteria.
    *   Generate reports and analytics.

