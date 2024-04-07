-- SQLite assumes a database file is used, so no need for CREATE DATABASE

-- CREATE TABLE statements for SQLite
CREATE TABLE IF NOT EXISTS Users (
    Badge_ID INTEGER PRIMARY KEY,
    Name TEXT,
    Email TEXT,
    Password TEXT,
    Role TEXT CHECK( Role IN ('Admin','Other') ) -- Alternative to ENUM
);

-- INSERT statements for SQLite
INSERT INTO Users (Badge_ID, Name, Email, Password, Role) VALUES 
(1, 'John Doe', 'john.doe@example.com', 'password123', 'Admin'),
(2, 'Jane Smith', 'jane.smith@example.com', 'password123', 'Other'),
(3, 'Alice Johnson', 'alice.johnson@example.com', 'password123', 'Other'),
(4, 'Bob Brown', 'bob.brown@example.com', 'password123', 'Admin'),
(5, 'Charlie Davis', 'charlie.davis@example.com', 'password123', 'Other');

-- Enable foreign key constraints
PRAGMA foreign_keys = ON;

-- CREATE TABLE statement for Equipment with a CHECK constraint for IN_USE
CREATE TABLE IF NOT EXISTS Equipment (
    Equipment_ID INTEGER,
    Equipment_Name TEXT,
    Time TEXT, -- SQLite does not have a DATETIME data type
    RFIDReader_ID INTEGER,
    Current_Location TEXT,
    Badge_ID INTEGER,
    IN_USE TEXT CHECK( IN_USE IN ('Y', 'N', 'M') ), -- Alternative to ENUM
    PRIMARY KEY (Equipment_ID, Time),
    FOREIGN KEY (Badge_ID) REFERENCES Users(Badge_ID)
);

-- INSERT statements for SQLite
INSERT INTO Equipment (Equipment_ID, Equipment_Name, Time, RFIDReader_ID, Current_Location, Badge_ID, IN_USE) VALUES 
(101, 'Laptop', '2024-04-04 09:00:00', 501, 'Location A', 1, 'Y'),
(102, 'Projector', '2024-04-04 10:00:00', 502, 'Location B', 2, 'N'),
(103, 'Scanner', '2024-04-04 11:00:00', 503, 'Location C', 3, 'M'),
(104, 'Printer', '2024-04-04 12:00:00', 504, 'Location D', 4, 'Y'),
(105, 'Camera', '2024-04-04 13:00:00', 505, 'Location E', 5, 'N');

-- SELECT statements remain the same
SELECT * FROM Users;
SELECT * FROM Equipment;
