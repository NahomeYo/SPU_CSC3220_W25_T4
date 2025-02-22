--
-- File generated with SQLiteStudio v3.4.16 on Fri Feb 21 23:57:02 2025
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
    isRecurring       INTEGER DEFAULT (0) 
                              CHECK (isRecurring IN (0, 1) ) 
                              NOT NULL,
    recurrencePattern TEXT    CHECK (recurrencePattern IN ('daily', 'weekly', 'monthly') ) 
);

INSERT INTO SCHEDULE (scheduleId, title, description, isRecurring, recurrencePattern) VALUES (1, 'CSC 3220', NULL, 0, NULL);
INSERT INTO SCHEDULE (scheduleId, title, description, isRecurring, recurrencePattern) VALUES (2, 'CSC 3220', NULL, 0, NULL);
INSERT INTO SCHEDULE (scheduleId, title, description, isRecurring, recurrencePattern) VALUES (3, 'CSC 3220', NULL, 1, 'weekly');
INSERT INTO SCHEDULE (scheduleId, title, description, isRecurring, recurrencePattern) VALUES (4, 'UFDN 3100', NULL, 1, 'daily');

-- Table: TASK
CREATE TABLE TASK (
    taskID            INTEGER  PRIMARY KEY AUTOINCREMENT,
    scheduleId        INTEGER  REFERENCES SCHEDULE (scheduleId),
    title             TEXT     NOT NULL,
    deadline          DATETIME NOT NULL,
    priority          INTEGER  CHECK (priority BETWEEN 1 AND 5),
    deadlineCountDown INTEGER,
    status            TEXT     DEFAULT Pending
                               CHECK (status IN ('Pending', 'In Progress', 'Completed') ),
    startTime         TEXT,
    endTime           TEXT,
    entryJournalText  TEXT,
    moodRating        INTEGER  CHECK (moodRating BETWEEN 1 AND 5) 
);

INSERT INTO TASK (taskID, scheduleId, title, deadline, priority, deadlineCountDown, status, startTime, endTime, entryJournalText, moodRating) VALUES (1, 1, 'Final DB Schema and Queries', '2025-02-19', 3, NULL, 'Completed', NULL, NULL, NULL, NULL);
INSERT INTO TASK (taskID, scheduleId, title, deadline, priority, deadlineCountDown, status, startTime, endTime, entryJournalText, moodRating) VALUES (2, 1, 'Draft DB Schema', '2025-02-17', 5, NULL, 'Completed', NULL, NULL, NULL, NULL);

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
