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
SELECT COUNT(cCPR), dLoan
FROM library.tloan
WHERE cCPR = 0305393207
  AND dLoan >= '2014-01-01'
  AND dLoan < '2015-01-01'
GROUP BY dLoan;


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

WHERE tbooktheme.nBookID = tbook.nBookID
  AND ttheme.nThemeID = tbooktheme.nThemeID
  AND nPublishingCompanyID = 32;

# 10. Show the name and surname of every author along with the number of books authored by them, but only for authors who have registered books on the database.
SELECT tauthor.cName, tauthor.cSurname, COUNT(nBookID) AS 'Books'
FROM tauthor
         INNER JOIN tauthorship t on tauthor.nAuthorID = t.nAuthorID
GROUP BY t.nAuthorID;

# Could not get it to work. Only displays one author and all the bookid's in one row.
# I was attemping to link tauthor.nauthorid to tauthorship.nauthorid and vice versa to tbook and tauthorship. I am not sure what is the solution.

# 11. Show the name and surname of all the authors with published books along with the lowest publishing year for their books.
SELECT cName, cSurname, Min(tbook.nPublishingYear)
FROM tauthor,
     tbook
WHERE nBookID IS NOT NULL
GROUP BY cName, cSurname;

# 12. For each signature and loan date, show the title of the corresponding books and the name and surname of the member who had them loaned.

SELECT tloan.*, tmember.cSurname, tmember.cName, tbook.cTitle
FROM tloan,
     tmember,
     tbookcopy,
     tbook;

# 13. Repeat exercises 9 to 12 using the modern JOIN notation.

# 9. Show the title of all books published by the publishing company with ID 32 along with their theme or themes.
SELECT cTitle, cName
FROM tbook
         LEFT JOIN tbooktheme t on tbook.nBookID = t.nBookID
         LEFT JOIN ttheme t2 on t.nThemeID = t2.nThemeID
WHERE nPublishingCompanyID = 32;

# 10. Show the name and surname of every author along with the number of books authored by them, but only for authors who have registered books on the database.
SELECT cName, cSurname, COUNT(t.nBookID) AS 'Books'
FROM tauthor
         LEFT JOIN tauthorship t on tauthor.nAuthorID = t.nAuthorID
GROUP BY tauthor.nAuthorID
ORDER BY COUNT(t.nAuthorID) DESC;

# 11. Show the name and surname of all the authors with published books along with the lowest publishing year for their books.
SELECT cName, cSurname, Min(t2.nPublishingYear)
FROM tauthor
         LEFT JOIN tauthorship t on tauthor.nAuthorID = t.nAuthorID
         LEFT JOIN tbook t2 on t.nBookID = t2.nBookID
WHERE t2.nBookID IS NOT NULL
GROUP BY cName, cSurname;

# 12. For each signature and loan date, show the title of the corresponding books and the name and surname of the member who had them loaned.
SELECT tloan.*, t.cSurname, t.cName, t3.cTitle
FROM tloan
         LEFT JOIN tmember t on tloan.cCPR = t.cCPR
         LEFT JOIN tbookcopy t2 on tloan.cSignature = t2.cSignature
         LEFT JOIN tbook t3 on t2.nBookID = t3.nBookID;

# 14. Show all theme names along with the titles of their associated books. All themes must appear (even if there are no books for some particular themes). Sort by theme name.
SELECT cName, cTitle
From ttheme
         LEFT JOIN tbooktheme t on ttheme.nThemeID = t.nThemeID
         LEFT JOIN tbook t2 on t.nBookID = t2.nBookID
ORDER BY cName ASC;

# 15. Show the name and surname of all members who joined the library in 2013 along with the title of the books they took on loan during that same year. All members must be shown, even if they did not take any book on loan during 2013. Sort by member surname and name.
SELECT cSurname, cName, cTitle
FROM tmember
         LEFT JOIN tloan t on tmember.cCPR = t.cCPR
         LEFT JOIN tbookcopy t2 on t.cSignature = t2.cSignature
         LEFT JOIN tbook t3 on t2.nBookID = t3.nBookID
WHERE YEAR(dNewMember) = 2013
ORDER BY cSurname, cName;

# 16. Show the name and surname of all authors along with their nationality or nationalities and the titles of their books. Every author must be shown, even though s/he has no registered books. Sort by author name and surname.

SELECT tauthor.cName, cSurname, t2.cName, t4.cTitle
FROM tauthor
         LEFT JOIN tnationality t on tauthor.nAuthorID = t.nAuthorID
         LEFT JOIN tcountry t2 on t.nCountryID = t2.nCountryID
         LEFT JOIN tauthorship t3 on t.nAuthorID = t3.nAuthorID
         LEFT JOIN tbook t4 on t3.nBookID = t4.nBookID;

# 17. Show the title of those books which have had different editions published in both 1970 and 1989.

SELECT tbook.cTitle
FROM tbook
WHERE nPublishingYear = 1970
   OR nPublishingYear = 1989;
# I didnt know how to distinguish between the editions of the books

# 18. Show the surname and name of all members who joined the library in December 2013 followed by the surname and name of those authors whose name is ???William???.

SELECT dNewMember, tmember.cSurname, tmember.cName
FROM tmember
WHERE dNewMember >= '2013-12-01' AND cName REGEXP 'William'
   OR cSurname REGEXP 'William';

# 19. Show the name and surname of the first chronological member of the library using subqueries.
SELECT cName, cSurname, dNewMember
FROM tmember
WHERE dNewMember IN (SELECT dNewMember FROM tmember)
ORDER BY dNewMember ASC;

# 20. For each publishing year, show the number of book titles published by publishing companies from countries that constitute the nationality for at least three authors. Use subqueries.
SELECT COUNT(tbook.cTitle) AS 'Number of book titles'
FROM tbook,
     tpublishingcompany,
     tnationality,
     tcountry,
     tauthorship,
     tauthor
WHERE tbook.nBookID = tauthorship.nBookID
  AND tauthorship.nAuthorID = tauthor.nAuthorID
  AND tauthorship.nAuthorID = tnationality.nAuthorID
  AND tnationality.nCountryID = tcountry.nCountryID
  AND tbook.nPublishingCompanyID = tpublishingcompany.nPublishingCompanyID
  AND tpublishingcompany.nCountryID = tcountry.nCountryID;

# I was not able to find the appropriate subquery for this question

# 21. Show the name and country of all publishing companies with the headings "Name" and "Country"
SELECT tpublishingcompany.cName AS 'Name', tcountry.cName AS 'Country'
FROM tpublishingcompany,
     tcountry,
     tnationality
WHERE tpublishingcompany.nCountryID = tnationality.nCountryID
  AND tnationality.nCountryID = tcountry.nCountryID;

# 22. Show the titles of the books published between 1926 and 1978 that were not published by the publishing company with ID 32.
SELECT tbook.cTitle
FROM tbook
WHERE nPublishingCompanyID != 32
  AND nPublishingYear >= 1926
  AND nPublishingYear <= 1978;

# 23. Show the name and surname of the members who joined the library after 2016 and have no address.
SELECT cName, cSurname, cAddress
FROM tmember
WHERE dNewMember >= 2016
  AND cAddress IS NULL;

# 24. Show the country codes for countries with publishing companies. Exclude repeated values.
SELECT DISTINCT tcountry.nCountryID
FROM tcountry
         LEFT JOIN tpublishingcompany t on tcountry.nCountryID = t.nCountryID
WHERE t.nPublishingCompanyID > 1;

# 25. Show the titles of books whose title starts by "The Tale" and that are not published by "Lynch Inc".
SELECT *
FROM tpublishingcompany
WHERE cName REGEXP 'Lynch inc';
# nPublishingCompanyID = 13

SELECT tbook.cTitle
FROM tbook
WHERE nPublishingCompanyID != 13
  AND cTitle LIKE 'The Tale%';

# Could not figure out how to combine both statements

# 26. Show the list of themes for which the publishing company "Lynch Inc" has published books, excluding repeated values.
SELECT DISTINCT ttheme.cName
FROM ttheme
         LEFT JOIN tbooktheme t on ttheme.nThemeID = t.nThemeID
         LEFT JOIN tbook t2 on t.nBookID = t2.nBookID
WHERE nPublishingCompanyID = 13;

# 27. Show the titles of those books which have never been loaned.
SELECT tbook.cTitle
FROM tbook
         LEFT JOIN tbookcopy t on tbook.nBookID = t.nBookID
         LEFT JOIN tloan t2 on t.cSignature = t2.cSignature
WHERE t2.dLoan IS NULL;

# 28. For each publishing company, show its number of existing books under the heading "No. of Books".
SELECT tpublishingcompany.cName AS 'Publishing company', COUNT(tbook.nPublishingCompanyID) AS 'No. of Books'
FROM tpublishingcompany,
     tbook
WHERE tbook.nPublishingCompanyID = tpublishingcompany.nPublishingCompanyID
GROUP BY tpublishingcompany.cName;

# 29. Show the number of members who took some book on a loan during 2013.
SELECT COUNT(tmember.cCPR) AS 'number of members loan in 2013'
FROM tmember,
     tloan
WHERE tloan.cCPR = tmember.cCPR
  AND tloan.dLoan BETWEEN '2013-01-01' AND ' 2013-12-31';

# 30. For each book that has at least two authors, show its title and number of authors under the heading "No. of Authors".
SELECT cTitle, COUNT(cName) AS 'No. of Authors'
FROM tauthor
         LEFT JOIN tauthorship t on tauthor.nAuthorID = t.nAuthorID
         LEFT JOIN tbook t2 on t.nBookID = t2.nBookID
GROUP BY cTitle
HAVING COUNT(cName) > 1;


