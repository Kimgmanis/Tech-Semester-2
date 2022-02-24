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
SELECT cName, cSurname, Min(tbook.nPublishingYear)
FROM tauthor,
     tbook
WHERE nBookID IS NOT NULL
GROUP BY cName, cSurname;

# 12. For each signature and loan date, show the title of the corresponding books and the name and surname of the member who had them loaned.
SELECT tloan.*, t.cSurname, t.cName, t3.cTitle
FROM tloan
         LEFT JOIN tmember t on tloan.cCPR = t.cCPR
         LEFT JOIN tbookcopy t2 on tloan.cSignature = t2.cSignature
         LEFT JOIN tbook t3 on t2.nBookID = t3.nBookID;

# 13. Repeat exercises 9 to 12 using the modern JOIN notation.

# 9. Show the title of all books published by the publishing company with ID 32 along with their theme or themes.
SELECT cTitle, cName FROM tbook
LEFT JOIN tbooktheme t on tbook.nBookID = t.nBookID
LEFT JOIN ttheme t2 on t.nThemeID = t2.nThemeID
WHERE nPublishingCompanyID = 32;

# 10. Show the name and surname of every author along with the number of books authored by them, but only for authors who have registered books on the database.

# 11. Show the name and surname of all the authors with published books along with the lowest publishing year for their books.

# 12. For each signature and loan date, show the title of the corresponding books and the name and surname of the member who had them loaned.

# 14. Show all theme names along with the titles of their associated books. All themes must appear (even if there are no books for some particular themes). Sort by theme name.
SELECT cName, cTitle From ttheme
LEFT JOIN tbooktheme t on ttheme.nThemeID = t.nThemeID
LEFT JOIN tbook t2 on t.nBookID = t2.nBookID
ORDER BY cName ASC;

# 15. Show the name and surname of all members who joined the library in 2013 along with the title of the books they took on loan during that same year. All members must be shown, even if they did not take any book on loan during 2013. Sort by member surname and name.
SELECT cSurname, cName, cTitle FROM tmember
LEFT JOIN tloan t on tmember.cCPR = t.cCPR
LEFT JOIN tbookcopy t2 on t.cSignature = t2.cSignature
LEFT JOIN tbook t3 on t2.nBookID = t3.nBookID
WHERE YEAR(dNewMember) = 2013
ORDER BY cSurname, cName;

# 16. Show the name and surname of all authors along with their nationality or nationalities and the titles of their books. Every author must be shown, even though s/he has no registered books. Sort by author name and surname.

SELECT cName, cSurname, t2.cName, t4.cTitle FROM tauthor
LEFT JOIN tnationality t on tauthor.nAuthorID = t.nAuthorID
LEFT JOIN tcountry t2 on t.nCountryID = t2.nCountryID
LEFT JOIN tauthorship t3 on t.nAuthorID = t3.nAuthorID
LEFT JOIN tbook t4 on t3.nBookID = t4.nBookID
ORDER BY tauthor.cName, tauthor.cSurname;

# 17. Show the title of those books which have had different editions published in both 1970 and 1989.