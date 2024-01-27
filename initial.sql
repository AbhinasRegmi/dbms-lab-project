-- Active: 1701971017110@@127.0.0.1@3306@epms


-- user creation
CREATE TABLE `Users`(
    `UserID` INT UNSIGNED  AUTO_INCREMENT PRIMARY KEY,
    `Name` VARCHAR(255) NOT NULL,
    `Email` VARCHAR(116) NOT NULL UNIQUE,
    `PhoneNo` VARCHAR(10) NOT NULL UNIQUE
);

CREATE TABLE `Participants`(
    `ParticipantID` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `TeamID` INT NOT NULL UNIQUE,
    `RollNo` VARCHAR(12) NULL UNIQUE,
    Foreign Key (`ParticipantID`) REFERENCES Users(`UserID`)
);

CREATE TABLE `Organisers`(
    `OrganiserID` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `Role` VARCHAR(30) NOT NULL UNIQUE,
    `Team` ENUM('Logistics','Event','Design','Marketing') NOT NULL,
    `LinkedIn` TEXT NULL,
    Foreign Key (`OrganiserID`) REFERENCES `Users`(`UserID`)
);

CREATE TABLE `Guests`(
    `GuestID` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `Role` ENUM('Judges','Speaker') NOT NULL,
    `About` TEXT NULL
    Foreign Key (`GuestID`) REFERENCES `Users`(`UserID`)
);

CREATE TABLE `Teams`(
    `TeamID` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `Name` VARCHAR(255) NOT NULL,
    `Lead` INT NOT NULl UNIQUE,
    `Proposal` BLOB ,
    `isEliminated` BOOLEAN DEFAULT '0',
    `StartUpIdea` TEXT,
    Foreign Key (`Lead`) REFERENCES `Participants`(`ParticipantID`)
);

CREATE TABLE `Finalists`(
    `TeamID` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    FOREIGN KEY (`TeamID`) REFERENCES `Teams`(`TeamID`)
);


CREATE TABLE `Events`(
    `EventID` INT UNSIGNED  AUTO_INCREMENT PRIMARY KEY,
    `EventName` VARCHAR(255) NOT NULL,
    `Date` DATE NOT NULL,
    `StartTime` TIME NOT NULL,
    `EndTime` TIME NOT NULL,
    `Description` TEXT NULL,
    `Location` VARCHAR(255) NOT NULL,
    `isCompleted` BOOLEAN  DEFAULT '0',
    `numberOfAttendees` INT ,
    `Type` ENUM('Online', 'Offline') DEFAULT 'Offline'
);

CREATE TABLE `EventsAttendee`(
    `EventID` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `GuestID` INT NULL,
    `TeamID` INT NULL,
    Foreign Key (`EventID`) REFERENCES `Events`(`EventID`),
    Foreign Key (`GuestID`) REFERENCES `Guests`(`GuestID`),
    Foreign Key (`TeamID`) REFERENCES `Teams`(`TeamID`)
);
