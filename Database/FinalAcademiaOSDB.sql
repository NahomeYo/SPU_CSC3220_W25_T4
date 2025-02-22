--
-- File generated with SQLiteStudio v3.4.16 on Fri Feb 21 11:58:36 2025
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
    moodCategory      TEXT    AS (CASE WHEN duration > 9000 THEN 'Exhausted' WHEN duration BETWEEN 3600 AND 9000 THEN 'Fit' WHEN duration < 3600 THEN 'Energetic' ELSE NULL END) STORED,
    energyScale       INTEGER CHECK (energyScale BETWEEN 1 AND 5),
    entryJournalText  TEXT,
    motivationMessage TEXT    AS (CASE WHEN energyScale >= 4 AND
                                            duration < 3600 THEN [You're tired and spent an hour or less on the assignment? Get some more work done ;)] WHEN energyScale >= 4 AND
                                                                                                                                                             duration >= 3600 THEN [You could use a break! Relax ;)] ELSE NULL END) STORED
);


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
