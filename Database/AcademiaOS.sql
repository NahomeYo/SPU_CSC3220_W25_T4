--
-- File generated with SQLiteStudio v3.4.16 on Mon Feb 17 13:46:42 2025
--
-- Text encoding used: UTF-8
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: REFLECTION
CREATE TABLE REFLECTION (
    reflectionId     INTEGER PRIMARY KEY AUTOINCREMENT,
    taskId           INTEGER REFERENCES TASK (taskID),
    moodCategory     TEXT,
    entryJournalText TEXT,
    moodRating       INTEGER CHECK (moodRating BETWEEN 1 AND 5) 
);


-- Table: SCHEDULE
CREATE TABLE SCHEDULE (
    scheduleId        INTEGER PRIMARY KEY AUTOINCREMENT,
    title             TEXT    NOT NULL,
    description       TEXT,
    date              TEXT    NOT NULL,
    isRecurring       INTEGER DEFAULT (0) 
                              CHECK (isRecurring IN (0, 1) ),
    recurrencePattern TEXT
);


-- Table: TASK
CREATE TABLE TASK (
    taskID            INTEGER PRIMARY KEY AUTOINCREMENT,
    scheduleId        INTEGER REFERENCES SCHEDULE (scheduleId),
    title             TEXT    NOT NULL,
    deadline          TEXT,
    priority          INTEGER CHECK (priority BETWEEN 1 AND 5),
    duration          INTEGER,
    deadlineCountDown INTEGER,
    status            TEXT    DEFAULT Pending
                              CHECK (status IN ('Pending', 'In Progress', 'Completed') ),
    startTime         TEXT,
    endTime           TEXT
);


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
