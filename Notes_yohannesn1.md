2/5/2025 (ERD draft Feedback):

This application should not support multiple users.
It should be a single-user application, designed for one user (who will already be signed in; no authentication required).
Connecting to external systems (e.g., Canvas) is not allowed. All functionality must be built within the application, requiring users to manually create their schedules.
Combine the journal entry and mood entry (mood should be a part of the journal entry, as a single entity).
Add a few more attributes to the schedule.
Mood should be associated with a task.

2/7:

moodCategory should be a derived attribute, because it borrows from the regular attribute, moodRating
deadlineCountdown is also derived, for it borrows from the regular attribute deadline
duration is also derived, for it borrows from startTime and endTime (making this a way for students to reflect on the actual amount of time it takes for them to study)

2/17:
We need to finish queries;
-INSERT
-SELECT
-UPDATE
Then DELETE

- INSERT two schedules, one for this class and the other for another class (UFDN? MATH? etc)
- The date attribute should be NULL for reflection and schedule entities. Perhaps we can remove the date attribute for schedule and only make it NOT NULL constraint for task entity. 