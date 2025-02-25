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


2/20: 

Professor's feedback:

In your ERD, you show the Task Entity and the Reflection entity with a mandatory 1 to 1 relationship. When a mandatory one-to-one relationship exists, it is simpler to combine them into a single table rather than two tables. What you show is not wrong, but it could be simplified without loss, which is usually better.

Also, you may want to consider removing some of the constraints from the Database in favor of building those constraints into the Application. It is generally easier to change application software than the structure of a database when a change is requested. But that is a design decision and not necessarily wrong the way you have. it.

I see that you removed the User entity. I think that is good. You don't need it for this app.


2/24:
- For the moodboard, we must list the HEX color sequence on next to or inside the color blocks
- We also have to put a description of the interface on the bottom right of the moodboard
- For the body text, also list the font name for it like how the subHeader and Header's font names are displayed