SELECT * FROM library.tmember;

# 1. Show the members under the name "Jens S." who were born before 1970 that became members of the library in 2013.
SELECT * FROM library.tmember
WHERE cName REGEXP 'Jens S.' AND dBirth < '1970-01-01' AND dNewMember > '2013-01-01';

# 2. Show those books that have not been published by the publishing companies with ID 15 and 32, except if they were published before 2000.
