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

-- 5.3 Mengen Operationen

-- a) Liste aller Orte (city), in denen es Filialen oder Mietobjekte gibt.
-- b) Liste aller Orte (city), in denen Filialen gibt aber keine Mietobjekte.
-- c) Liste aller Orte (city), in denen es sowohl Filialen als auch Mietobjekte gibt.
-- d) Können diese 3 Anfragen auch mit anderen Konstrukten als Mengenoperationen for- muliert werden?

-- 5.4 JOIN Operation

SELECT staffno, lname, city
    FROM staff NATURAL INNER JOIN branches; -- INNER kann man weglassen

-- das gleiche aber andere notation
SELECT staffno, lname, city
    FROM staff INNER JOIN branches
    USING (branchno); -- check how it looks like with SELECT * as difference

-- das gleiche aber andere notation
SELECT staffno, lname, city
    FROM staff INNER JOIN branches
    ON staff.branchno = branches.branchno; -- check how it looks like with SELECT * as difference

-- a) Liste mit fname, lname und clientno der Kunden zusammen mit propertyno und com- ment, die ein Mietobjekt besichtigt haben.
-- b) Statusreport über alle Mietobjekte und deren Besichtigungen mit propertyno, street, city, clientno, viewdate und comment.
-- c) Liste mit Details aller Mitarbeiter, die in einer Filiale in Glasgow arbeiten.
-- d) Liste mit fname, lname und telno der Besitzer zusammen mit rooms und rent ihrer Mietobjekte vom Typ Wohnung.
-- e) Liste mit fname, lname und maxrent der Kunden, die das Mietobjekt mit propertyno PA14 besichtigt haben.

-- 5.6 Algebraische Ausdrücke

