--
-- File generated with SQLiteStudio v3.4.16 on Fri Feb 21 23:37:27 2025
--
-- Text encoding used: UTF-8
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: SCHEDULE
CREATE TABLE SCHEDULE (
    scheduleId        INTEGER PRIMARY KEY AUTOINCREMENT,
    title             TEXT    NOT NULL,
    description       TEXT,
    date              TEXT    NOT NULL
                              CHECK (date GLOB '????-??-??'),
    isRecurring       INTEGER DEFAULT (0) 
                              CHECK (isRecurring IN (0, 1) ),
    recurrencePattern TEXT    CHECK (recurrencePattern IN ('daily', 'weekly', 'monthly') ) 
);

INSERT INTO SCHEDULE (scheduleId, title, description, date, isRecurring, recurrencePattern) VALUES (2, 'CSC 3220', 'Course assignments and deadlines', '2025-02-21', 0, NULL);

-- Table: TASK
CREATE TABLE TASK (
    taskId            INTEGER PRIMARY KEY AUTOINCREMENT,
    scheduleId        INTEGER NOT NULL
                              REFERENCES SCHEDULE (scheduleId),
    title             TEXT    NOT NULL,
    deadline          INTEGER NOT NULL,
    priority          INTEGER CHECK (priority BETWEEN 1 AND 5),
    createdAt         INTEGER NOT NULL
                              DEFAULT (strftime('%s', 'now') ),
    startTime         INTEGER CHECK (startTime >= createdAt),
    endTime           INTEGER CHECK (endTime > startTime),
    duration          INTEGER AS ( (endTime - startTime) ) STORED,
    deadlineCountdown INTEGER AS (deadline - createdAt) STORED,
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
