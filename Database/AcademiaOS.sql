--
-- File generated with SQLiteStudio v3.4.16 on Fri Feb 21 21:47:49 2025
--
-- Text encoding used: UTF-8
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: REFLECTION
CREATE TABLE REFLECTION (
    reflectionId     INTEGER PRIMARY KEY,
    taskId           INTEGER REFERENCES TASK (taskID),
    moodCategory     TEXT,
    entryJournalText TEXT    NOT NULL,
    moodRating       INTEGER CHECK (moodRating BETWEEN 1 AND 5) 
);

INSERT INTO REFLECTION (reflectionId, taskId, moodCategory, entryJournalText, moodRating) VALUES (1, 1, NULL, 'Schema design needs more queries.', 4);

-- Table: SCHEDULE
CREATE TABLE SCHEDULE (
    scheduleId        INTEGER PRIMARY KEY AUTOINCREMENT,
    title             TEXT    NOT NULL,
    description       TEXT,
    date              TEXT,
    isRecurring       INTEGER DEFAULT (0) 
                              CHECK (isRecurring IN (0, 1) ),
    recurrencePattern TEXT    CHECK (recurrencePattern IN ('daily', 'weekly', 'monthly') ) 
);

INSERT INTO SCHEDULE (scheduleId, title, description, date, isRecurring, recurrencePattern) VALUES (1, 'CSC 3220', NULL, '2025-02-15', 0, NULL);
INSERT INTO SCHEDULE (scheduleId, title, description, date, isRecurring, recurrencePattern) VALUES (2, 'CSC 3220', NULL, '2025-02-15', 0, NULL);
INSERT INTO SCHEDULE (scheduleId, title, description, date, isRecurring, recurrencePattern) VALUES (3, 'CSC 3220', NULL, '2025-02-15', 1, 'weekly');
INSERT INTO SCHEDULE (scheduleId, title, description, date, isRecurring, recurrencePattern) VALUES (4, 'UFDN 3100', NULL, '2025-02-15', 1, 'daily');

-- Table: TASK
CREATE TABLE TASK (
    taskID            INTEGER PRIMARY KEY AUTOINCREMENT,
    scheduleId        INTEGER REFERENCES SCHEDULE (scheduleId),
    title             TEXT    NOT NULL,
    deadline          TEXT    NOT NULL,
    priority          INTEGER CHECK (priority BETWEEN 1 AND 5),
    duration          INTEGER,
    deadlineCountDown INTEGER,
    status            TEXT    DEFAULT Pending
                              CHECK (status IN ('Pending', 'In Progress', 'Completed') ),
    startTime         TEXT,
    endTime           TEXT
);

INSERT INTO TASK (taskID, scheduleId, title, deadline, priority, duration, deadlineCountDown, status, startTime, endTime) VALUES (1, 1, 'Final DB Schema and Queries', '2025-02-19', 3, NULL, NULL, 'Completed', NULL, NULL);
INSERT INTO TASK (taskID, scheduleId, title, deadline, priority, duration, deadlineCountDown, status, startTime, endTime) VALUES (2, 1, 'Draft DB Schema', '2025-02-17', 5, NULL, NULL, 'Completed', NULL, NULL);

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
