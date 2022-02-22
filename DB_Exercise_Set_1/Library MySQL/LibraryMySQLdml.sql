# 1. Show the members under the name "Jens S." who were born before 1970 that became members of the library in 2013.
SELECT * FROM library.tmember
WHERE cName REGEXP 'Jens S.' AND dBirth < '1970-01-01' AND dNewMember > '2013-01-01';

# 2. Show those books that have not been published by the publishing companies with ID 15 and 32, except if they were published before 2000.
SELECT * FROM library.tbook
WHERE nPublishingCompanyID IN (15,32) AND nPublishingYear < 2000;

# 3. Show the name and surname of the members who have a phone number, but no address.
SELECT cName, cSurname FROM library.tmember
WHERE cAddress IS NULL AND cPhoneNo IS NOT NULL;

# 4. Show the authors with surname "Byatt" whose name starts by an "A" (uppercase) and contains an "S" (uppercase).
SELECT * FROM library.tauthor
WHERE cSurname REGEXP 'Byatt' AND cName REGEXP '^A|S]';

# 5. Show the number of books published in 2007 by the publishing company with ID 32.
SELECT * FROM library.tbook
WHERE nPublishingYear = 2007 AND nPublishingCompanyID = 32;
# OR
SELECT COUNT(*) FROM library.tbook
WHERE nPublishingYear = 2007 AND nPublishingCompanyID = 32;

# 6. For each day of the year 2014, show the number of books loaned by the member with CPR "0305393207";
SELECT * FROM library.tloan
WHERE cCPR = 0305393207 AND dLoan > '2014-01-01' AND dLoan < '2015-01-01';
# OR
SELECT COUNT(*) FROM library.tloan
WHERE cCPR = 0305393207 AND dLoan > '2014-01-01' AND dLoan < '2015-01-01';

# 7. Modify the previous clause so that only those days where the member was loaned more than one book appear.
SELECT * FROM library.tloan
WHERE cCPR = 0305393207 AND dLoan > '2014-01-01' AND dLoan < '2015-01-01';