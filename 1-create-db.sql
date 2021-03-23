-- cleanup
DROP TABLE branches CASCADE CONSTRAINTS;
DROP TABLE clients CASCADE CONSTRAINTS;
DROP TABLE staff CASCADE CONSTRAINTS;
DROP TABLE propertiesforrent CASCADE CONSTRAINTS;
DROP TABLE privateowners CASCADE CONSTRAINTS;
DROP TABLE viewings CASCADE CONSTRAINTS;
DROP TABLE registrations CASCADE CONSTRAINTS;

/*
 * Create a file <name>.db
 * CMD + Shift + P > Run Query
 * Select the database to run the query (e.g. <name>.db)
 * Get cake
 */

-- BRANCHES
CREATE TABLE branches (
	branchno VARCHAR2(5) NOT NULL,
	street VARCHAR2(25) NOT NULL,
	city VARCHAR2(15) NOT NULL,
	postcode VARCHAR2(8) NOT NULL
);
INSERT INTO branches (branchno, street, city, postcode) VALUES ('B005','22 Deer Rd','London','SW1 4EH');
INSERT INTO branches (branchno, street, city, postcode) VALUES ('B007','16 Argyll St','Aberdeen','AB2 3SU');
INSERT INTO branches (branchno, street, city, postcode) VALUES ('B003','163 Main St','Glasgow','G11 9QX');
INSERT INTO branches (branchno, street, city, postcode) VALUES ('B004','32 Manse Rd','Bristol','BS99 1NZ');
INSERT INTO branches (branchno, street, city, postcode) VALUES ('B002','56 Clover Dr','London','NW10 6EU');

-- CLIENTS
CREATE TABLE clients (
	clientno VARCHAR2(5) NOT NULL,
	fname VARCHAR2(15) NOT NULL,
	lname VARCHAR2(15) NOT NULL,
	telno VARCHAR2(13) NULL,
	preftype VARCHAR2(13) NULL,
	maxrent NUMBER(6, 2) NULL
);

INSERT INTO clients (clientno, fname, lname, telno, preftype, maxrent) VALUES ('CR76','John','Kay','0207-774-5632','Flat',425);
INSERT INTO clients (clientno, fname, lname, telno, preftype, maxrent) VALUES ('CR56','Aline','Stewart','0141-848-1825','Flat',350);
INSERT INTO clients (clientno, fname, lname, telno, preftype, maxrent) VALUES ('CR74','Mike','Ritchie','01475-392178','House',750);
INSERT INTO clients (clientno, fname, lname, telno, preftype, maxrent) VALUES ('CR62','Mary','Tregear','01224-196720','Flat',600);

-- STAFF
CREATE TABLE staff (
	staffno VARCHAR2(5) NOT NULL,
	fname VARCHAR2(15) NOT NULL,
	lname VARCHAR2(15) NOT NULL,
	position VARCHAR2(10) NOT NULL,
	sex CHAR(1) NOT NULL,
	dob DATE NOT NULL,
	salary NUMBER(7, 2) NOT NULL,
	branchno VARCHAR2(5) NOT NULL
);

INSERT INTO staff (staffno, fname, lname, position, sex, dob, salary, branchno) VALUES ('SL21','David','White','Manager','M','01-OCT-1970',30000,'B005');
INSERT INTO staff (staffno, fname, lname, position, sex, dob, salary, branchno) VALUES ('SG37','Ann','Beech','Assistant','F','10-NOV-1985',12000,'B003');
INSERT INTO staff (staffno, fname, lname, position, sex, dob, salary, branchno) VALUES ('SG14','David','Ford','Supervisor','M','24-MAR-1983',18000,'B003');
INSERT INTO staff (staffno, fname, lname, position, sex, dob, salary, branchno) VALUES ('SA9','Mary','Howe','Assistant','F','19-FEB-1995',9000,'B007');
INSERT INTO staff (staffno, fname, lname, position, sex, dob, salary, branchno) VALUES ('SG5','Susan','Brand','Manager','F','03-JUN-1965',24000,'B003');
INSERT INTO staff (staffno, fname, lname, position, sex, dob, salary, branchno) VALUES ('SL41','Susan','Lee','Assistant','F','13-JUN-1990',9000,'B005');

-- PROPERTIESFORRENT
CREATE TABLE propertiesforrent (
	propertyno VARCHAR2(5) NOT NULL,
	street VARCHAR2(25) NOT NULL,
	city VARCHAR2(15) NOT NULL,
	postcode VARCHAR2(8) NOT NULL,
	type VARCHAR2(8) NOT NULL,
	rooms NUMBER(4, 0) NOT NULL,
	rent NUMBER(7, 2) NOT NULL,
	ownerno VARCHAR2(5) NOT NULL,
	staffno VARCHAR2(5) NULL,
	branchno VARCHAR2(5) NOT NULL
);

INSERT INTO propertiesforrent (propertyno, street, city, postcode, type, rooms, rent, ownerno, staffno, branchno) VALUES ('PA14','16 Holhead','Aberdeen','AB7 5SU','House',6,650,'CO46','SA9','B007');
INSERT INTO propertiesforrent (propertyno, street, city, postcode, type, rooms, rent, ownerno, staffno, branchno) VALUES ('PL94','6 Argyll St','London','NW2','Flat',4,400,'CO87','SL41','B005');
INSERT INTO propertiesforrent (propertyno, street, city, postcode, type, rooms, rent, ownerno, staffno, branchno) VALUES ('PG4','6 Lawrence St','Glasgow','G11 9QX','Flat',3,350,'CO40', NULL,'B003');
INSERT INTO propertiesforrent (propertyno, street, city, postcode, type, rooms, rent, ownerno, staffno, branchno) VALUES ('PG36','2 Manor Rd','Glasgow','G32 4QX','Flat',3,375,'CO93','SG37','B003');
INSERT INTO propertiesforrent (propertyno, street, city, postcode, type, rooms, rent, ownerno, staffno, branchno) VALUES ('PG21','18 Dale Rd','Glasgow','G12','House',5,600,'CO87','SG37','B003');
INSERT INTO propertiesforrent (propertyno, street, city, postcode, type, rooms, rent, ownerno, staffno, branchno) VALUES ('PG16','5 Novar Dr','Glasgow','G12 9AX','Flat',4,450,'CO93','SG14','B003');

-- PRIVATEOWNERS
CREATE TABLE privateowners (
	ownerno VARCHAR2(5) NOT NULL,
	fname VARCHAR2(15) NOT NULL,
	lname VARCHAR2(15) NOT NULL,
	address VARCHAR2(50) NULL,
	telno VARCHAR2(13) NULL
);

INSERT INTO privateowners (ownerno, fname, lname, address, telno) VALUES ('CO46','Joe','Keogh','2 Fergus Dr, Aberdeen AB2 7SX','01224-861212');
INSERT INTO privateowners (ownerno, fname, lname, address, telno) VALUES ('CO87','Carol','Farel','6 Achray St, Glasgow G32 9DX','0141-357-7419');
INSERT INTO privateowners (ownerno, fname, lname, address, telno) VALUES ('CO40','Tina','Murphy','63 Well St, Glasgow G42','0141-943-1728');
INSERT INTO privateowners (ownerno, fname, lname, address, telno) VALUES ('CO93','Toni','Shaw','12 Park Pl, Glasgow G4 0QR','0141-225-7025');

-- VIEWINGS
CREATE TABLE viewings (
	clientno VARCHAR2(5) NOT NULL,
	propertyno VARCHAR2(5) NOT NULL,
	viewdate DATE NOT NULL,
	v_comment VARCHAR2(50) NULL
);

INSERT INTO viewings (clientno, propertyno, viewdate, v_comment) VALUES ('CR56','PA14','24-MAY-2018','to small');
INSERT INTO viewings (clientno, propertyno, viewdate, v_comment) VALUES ('CR76','PG4','20-APr-2018','too remote');
INSERT INTO viewings (clientno, propertyno, viewdate, v_comment) VALUES ('CR56','PG4','26-MAY-2018',NULL);
INSERT INTO viewings (clientno, propertyno, viewdate, v_comment) VALUES ('CR62','PA14','14-MAY-2018','no dining room');
INSERT INTO viewings (clientno, propertyno, viewdate, v_comment) VALUES ('CR56','PG36','28-APR-2018',NULL);

-- REGISTRATIONS
CREATE TABLE registrations (
	clientno VARCHAR2(5) NOT NULL,
	branchno VARCHAR2(5) NOT NULL,
	staffno VARCHAR2(5) NOT NULL,
	datejoined DATE NOT NULL
);

INSERT INTO registrations (clientno, branchno, staffno, datejoined) VALUES ('CR76','B005','SL41','02-JAN-2018');
INSERT INTO registrations (clientno, branchno, staffno, datejoined) VALUES ('CR56','B003','SG37','11-APR-2017');
INSERT INTO registrations (clientno, branchno, staffno, datejoined) VALUES ('CR74','B003','SG37','16-NOV-2016');
INSERT INTO registrations (clientno, branchno, staffno, datejoined) VALUES ('CR62','B007','SA9','07-MAR-2017');
