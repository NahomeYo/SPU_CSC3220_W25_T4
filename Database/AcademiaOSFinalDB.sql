--
-- File generated with SQLiteStudio v3.4.16 on Sat Feb 22 12:57:20 2025
--
-- Text encoding used: UTF-8
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: Schedule
CREATE TABLE Schedule (
    scheduleId        INTEGER PRIMARY KEY AUTOINCREMENT,
    title             TEXT    NOT NULL,
    description       TEXT,
    date              TEXT    NOT NULL
                              CHECK (date GLOB '????-??-??'),
    isRecurring       INTEGER DEFAULT (0) 
                              CHECK (isRecurring IN (0, 1) ),
    recurrencePattern TEXT    CHECK (recurrencePattern IN ('daily', 'weekly', 'monthly') ) 
);


-- Table: TASK
CREATE TABLE TASK (
    taskID            INTEGER PRIMARY KEY AUTOINCREMENT,
    scheduleId        INTEGER NOT NULL
                              REFERENCES Schedule (scheduleId),
    title             TEXT    NOT NULL,
    deadline          INTEGER NOT NULL
                              CHECK (deadline > strftime('%s', 'now') ),
    priority          INTEGER CHECK (priority BETWEEN 1 AND 5),
    createdAt         INTEGER NOT NULL
                              DEFAULT (strftime('%s', 'now') ),
    startTime         INTEGER CHECK (startTime >= createdAt) 
                              NOT NULL,
    endTime           INTEGER CHECK (endTime > startTime) 
                              NOT NULL,
    duration          INTEGER AS ( (endTime - startTime) ) STORED,
    deadlineCountdown INTEGER AS (deadline - strftime('%s', 'now') ) STORED,
    status            TEXT    DEFAULT ('Pending') 
                              CHECK (status IN ('Pending', 'In Progress', 'Completed') ),
    energyScale       INTEGER CHECK (energyScale BETWEEN 1 AND 5),
    entryJournalText  TEXT,
    moodCategory      TEXT    AS (CASE WHEN energyScale >= 4 AND
                                            duration > 9000 THEN 'Exhausted' WHEN energyScale >= 4 AND
                                                                                  duration <= 3600 THEN 'Energetic' WHEN energyScale BETWEEN 2 AND 3 THEN 'Fit' ELSE NULL END) STORED,
    motivationMessage TEXT    AS (CASE WHEN moodCategory = 'Exhausted' THEN 'You could use a break! Relax ;)' WHEN moodCategory = 'Energetic' THEN 'You are tired but only worked for an hour? Get some more work done ;)' WHEN moodCategory = 'Fit' THEN 'Stay consistent ;)' ELSE NULL END) STORED
);


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
