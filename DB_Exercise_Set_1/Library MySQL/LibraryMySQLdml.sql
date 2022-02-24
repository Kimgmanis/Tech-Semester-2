# 1. Show the members under the name "Jens S." who were born before 1970 that became members of the library in 2013.
SELECT *
FROM library.tmember
WHERE cName REGEXP 'Jens S.'
  AND dBirth < '1970-01-01'
  AND dNewMember > '2013-01-01';

# 2. Show those books that have not been published by the publishing companies with ID 15 and 32, except if they were published before 2000.
SELECT *
FROM library.tbook
WHERE nPublishingCompanyID IN (15, 32)
  AND nPublishingYear < 2000;

# 3. Show the name and surname of the members who have a phone number, but no address.
SELECT cName, cSurname
FROM library.tmember
WHERE cAddress IS NULL
  AND cPhoneNo IS NOT NULL;

# 4. Show the authors with surname "Byatt" whose name starts by an "A" (uppercase) and contains an "S" (uppercase).
SELECT *
FROM library.tauthor
WHERE cSurname REGEXP 'Byatt'
  AND cName REGEXP '^A|S]';

# 5. Show the number of books published in 2007 by the publishing company with ID 32.
SELECT *
FROM library.tbook
WHERE nPublishingYear = 2007
  AND nPublishingCompanyID = 32;
# OR
SELECT COUNT(*)
FROM library.tbook
WHERE nPublishingYear = 2007
  AND nPublishingCompanyID = 32;

# 6. For each day of the year 2014, show the number of books loaned by the member with CPR "0305393207";
SELECT *
FROM library.tloan
WHERE cCPR = 0305393207
  AND dLoan > '2014-01-01'
  AND dLoan < '2015-01-01';
# OR
SELECT COUNT(*)
FROM library.tloan
WHERE cCPR = 0305393207
  AND dLoan > '2014-01-01'
  AND dLoan < '2015-01-01';

# 7. Modify the previous clause so that only those days where the member was loaned more than one book appear.
SELECT dloan, COUNT(dloan) AS 'Number of Loans'
FROM tloan
WHERE cCPR = 0305393207
  AND YEAR(dLoan) = 2014
GROUP BY dloan
HAVING COUNT(*) > 1;

# 8. Show all library members from the newest to the oldest. Those who became members on the same day will be sorted alphabetically (by surname and name) within that day.
SELECT *
FROM library.tmember
ORDER BY dNewMember DESC, cSurname, cName;

# 9. Show the title of all books published by the publishing company with ID 32 along with their theme or themes.
SELECT tbook.cTitle, ttheme.cName
FROM tbook,
     tbooktheme,
     ttheme
WHERE nPublishingCompanyID = 32;

# 10. Show the name and surname of every author along with the number of books authored by them, but only for authors who have registered books on the database.
SELECT cName, cSurname, COUNT(t.nAuthorID) AS 'Books'
FROM tauthor
         LEFT JOIN tauthorship t on tauthor.nAuthorID = t.nAuthorID
GROUP BY tauthor.nAuthorID
ORDER BY COUNT(t.nAuthorID) DESC;

# 11. Show the name and surname of all the authors with published books along with the lowest publishing year for their books.





