2 / 3:

-User entity has 1:N relationship with External Data entity

-User entity has 1:N relationship with Schedule entity

-Schedule entity has 1:N relationship with Task entity

-User entity has 1:N relationship with MoodEntry entity

-User entity has 1:N relationship with JournalEntry entity

2 / 7:

- Why do we need users to track the time they take on assignments? Perhaps to learn how to manage their time and be more productive?

2 / 14:

- Delete User Entity/Table.

Schedule:
scheduleId = Integer primary key

Task:
taskId = Integer primary key
scheduleId = Integer foregin key

Reflection:
reflectionId - Integer primary key
taskId = Integer foreign key

2 / 16:

isRecurring attribute is INTEGER data type and has constraints:

- DEFAULT, set to 0

- CHECK, checking if value is 0 (not recurring) or 1 (yes recurring)

recurrencePattern is TEXT data type and has constraints:

- CHECK, checking if value is one of these values (daily, weekly, monthly). These are the ONLY allowed values.

  
2/18 :


I think our code is totally right now but Do you think we need to?

- The SCHEDULE table has two identical rows, which might not be necessary. So either remove the redundant row or differentiate the data (change the title or date).


2/20: 
- We need to get rid of the REFLECTION Table and move everything to the TASK Table (moodCategory, entryJournalText and  moodRating)
