-- Arbeitsblatt: DreamHome I

-- Introduction

SELECT street, city
    FROM branches;

SELECT *
    FROM branches
    WHERE city = 'London';

SELECT street, city
    FROM branches
    WHERE city = 'London';

SELECT * FROM staff;
SELECT * FROM branches;

-- Mengenoperationen
SELECT staffno, lname, city
    FROM staff NATURAL JOIN branches; -- INNER kann man weglassen

-- das gleiche aber andere notation
SELECT staffno, lname, city
    FROM staff INNER JOIN branches
    USING (branchno); -- check how it looks like with SELECT * as difference

-- das gleiche aber andere notation
SELECT staffno, lname, city
    FROM staff INNER JOIN branches
    ON staff.branchno = branches.branchno; -- check how it looks like with SELECT * as difference

-- 5.3 Mengen Operationen

-- a) Liste aller Orte (city), in denen es Filialen oder Mietobjekte gibt.
SELECT city FROM branches
UNION
SELECT city from propertiesforrent;

-- b) Liste aller Orte (city), in denen Filialen gibt aber keine Mietobjekte.
SELECT city FROM branches
EXCEPT
SELECT city from propertiesforrent;

-- c) Liste aller Orte (city), in denen es sowohl Filialen als auch Mietobjekte gibt.
SELECT city FROM propertiesforrent
INTERSECT
SELECT city from branches;

-- d) Können diese 3 Anfragen auch mit anderen Konstrukten als Mengenoperationen for- muliert werden?
-- ja mit INNER JOIN/USING & ON

-- 5.4 JOIN Operation

-- a) Liste mit fname, lname und clientno der Kunden zusammen mit propertyno 
--    und com- ment, die ein Mietobjekt besichtigt haben.
SELECT fname, lname, clientno, propertyno, v_comment
    FROM clients NATURAL JOIN viewings;

-- Lösung ohne natural join
SELECT fname, lname, c.clientno, propertyno, v_comment
    FROM clients c, viewings v
    WHERE c.clientno = v.clientno;

-- b) Statusreport über alle Mietobjekte und deren Besichtigungen mit
--    propertyno, street, city, clientno, viewdate und comment.
SELECT propertyno, street, city, clientno, viewdate, v_comment
    FROM propertiesforrent NATURAL JOIN viewings;

-- c) Liste mit Details aller Mitarbeiter, die in einer Filiale in Glasgow arbeiten.
SELECT *
    FROM staff INNER JOIN branches
    USING (branchno)
    WHERE city = 'Glasgow';

-- d) Liste mit fname, lname und telno der Besitzer zusammen mit rooms und rent 
--    ihrer Mietobjekte vom Typ Wohnung.
SELECT fname, lname, telno, rooms, rent
    FROM privateowners INNER JOIN propertiesforrent
    USING (ownerno)
    WHERE type = 'Flat';

-- e) Liste mit fname, lname und maxrent der Kunden, die das Mietobjekt 
--    mit propertyno PA14 besichtigt haben.
SELECT fname, lname, maxrent
    FROM clients INNER JOIN propertiesforrent
    WHERE propertiesforrent.propertyno = 'PA14';

-- 5.6 Algebraische Ausdrücke
-- a)
SELECT DISTINCT city
    FROM propertiesforrent
    WHERE rooms > 4;

-- b)
SELECT *
    FROM branches INNER JOIN registrations
    ON branches.branchno = registrations.branchno;

-- c)
SELECT *
    FROM branches INNER JOIN propertiesforrent
    ON branches.branchno = propertiesforrent.branchno
    WHERE propertiesforrent.rent < 600;

-- d)
SELECT branchno
    FROM branches INNER JOIN propertiesforrent
    USING (branchno)
    WHERE propertiesforrent.rent < 600;

-- e)
-- kein Unterschied

-- f)
SELECT city, rooms, rent
    FROM propertiesforrent
    WHERE propertiesforrent.rent < 600 AND propertiesforrent.rooms = 4;
