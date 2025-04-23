-- CREATE DATABASE GBV;
USE gbv;
CREATE TABLE User (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Gender VARCHAR(10),
    Age INT,
    PhoneNumber VARCHAR(20),
    Email VARCHAR(100),
    Location VARCHAR(100),
    UserType ENUM('Survivor', 'Witness', 'NGO', 'Admin') NOT NULL
);

CREATE TABLE Admin (
    AdminID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(20)
);

CREATE TABLE Report (
    ReportID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    AdminID INT,
    IncidentType VARCHAR(100),
    Location VARCHAR(100),
    DateTime DATETIME,
    Status ENUM('Pending', 'Reviewed', 'Resolved'),
    MediaAttachment TEXT,
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (AdminID) REFERENCES Admin(AdminID)
);

CREATE TABLE SupportService (
    ServiceID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Type VARCHAR(50), -- e.g., Medical, Legal, Counseling
    Location VARCHAR(100),
    ContactInfo VARCHAR(100)
);

CREATE TABLE ReportSupportService (
    ReportID INT,
    ServiceID INT,
    PRIMARY KEY (ReportID, ServiceID),
    FOREIGN KEY (ReportID) REFERENCES Report(ReportID),
    FOREIGN KEY (ServiceID) REFERENCES SupportService(ServiceID)
);

CREATE TABLE Feedback (
    FeedbackID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    ReportID INT,
    Comments TEXT,
    Rating INT,
    DateTime DATETIME,
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (ReportID) REFERENCES Report(ReportID)
);

CREATE TABLE Reference (
    ReferenceID INT AUTO_INCREMENT PRIMARY KEY,
    ReportID INT,
    ReferredTo VARCHAR(100), -- could also link to another table if needed
    ReferredBy INT, -- UserID or AdminID (you can refine this if needed)
    Notes TEXT,
    FOREIGN KEY (ReportID) REFERENCES Report(ReportID)
);
