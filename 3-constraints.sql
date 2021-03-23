-- WARNING: not supported in SQLite, use in SQLDeveloper
-- add constraints to existing table
-- can also be added on CREATE TABLE

-- controlling constraints
-- ALTER TABLE <name> ENABLE CONSTRAINT <name>;
-- ALTER TABLE <name> DISABLE CONSTRAINT <name>;

/*
Für die vorliegende Datenbank DreamHome sollen Sie für ausgesuchte Spalten 
entsprechende CHECK CONSTRAINTS definieren:
• preftype in clients
• sex und position in staff
• type in propertiesforrent
*/

-- cleanup
ALTER TABLE clients DROP CONSTRAINT ck_preftype;
ALTER TABLE staff DROP CONSTRAINT ck_sex DROP CONSTRAINT ck_position;
ALTER TABLE propertiesforrent DROP CONSTRAINT ck_type;

-- add constraints
ALTER TABLE clients ADD CONSTRAINT ck_preftype CHECK (
  preftype IN ('Flat', 'House')
);

ALTER TABLE staff ADD (
  CONSTRAINT ck_sex CHECK (sex IN ('F', 'M')),
  CONSTRAINT ck_position CHECK (position IN ('Assistant', 'Manager', 'Supervisor'))
);

ALTER TABLE propertiesforrent ADD CONSTRAINT ck_type CHECK (
  type IN ('Flat', 'House')
);

-- add Primary Key and Unique Key where necessary
-- ALTER TABLE <table> ADD CONSTRAINT UNIQUE <column> (not used in this example)
-- use unique where the foreign key is not unique enough

-- add constraints
ALTER TABLE branches ADD CONSTRAINT pk_branchno PRIMARY KEY (branchno);
ALTER TABLE clients ADD CONSTRAINT pk_clientno PRIMARY KEY (clientno);
ALTER TABLE privateowners ADD CONSTRAINT pk_ownerno PRIMARY KEY (ownerno);
ALTER TABLE propertiesforrent ADD CONSTRAINT pk_propertyno PRIMARY KEY (propertyno);
-- which client registers on what branch
ALTER TABLE registrations ADD CONSTRAINT pk_registrations PRIMARY KEY (clientno, branchno);
ALTER TABLE staff ADD CONSTRAINT pk_staffno PRIMARY KEY (staffno);
-- which client views what property
ALTER TABLE viewings ADD CONSTRAINT pk_viewings PRIMARY KEY (clientno, propertyno);

-- Add Foreign Key
-- wenn obermenge einer anderen tabelle, add foreign key
ALTER TABLE propertiesforrent 
  DROP CONSTRAINT fk_propertiesforrent_privateowners
  DROP CONSTRAINT fk_propertiesforrent_staff
  DROP CONSTRAINT fk_propertiesforrent_branches;

-- propertiesforrent
ALTER TABLE propertiesforrent ADD (
  CONSTRAINT fk_propertiesforrent_privateowners
    FOREIGN KEY (ownerno)
    REFERENCES privateowners (ownerno),
  CONSTRAINT fk_propertiesforrent_staff
    FOREIGN KEY (staffno)
    REFERENCES staff (staffno),
  CONSTRAINT fk_propertiesforrent_branches
    FOREIGN KEY (branchno)
    REFERENCES branches (branchno)
);

-- registrations
ALTER TABLE registrations
  DROP CONSTRAINT fk_registrations_clients
  DROP CONSTRAINT fk_registrations_branches
  DROP CONSTRAINT fk_registrations_staff;

ALTER TABLE registrations ADD (
  CONSTRAINT fk_registrations_clients
    FOREIGN KEY (clientno) 
    REFERENCES clients (clientno),
  CONSTRAINT fk_registrations_branches
    FOREIGN KEY (branchno)
    REFERENCES branches (branchno),
  CONSTRAINT fk_registrations_staff
    FOREIGN KEY (staffno)
    REFERENCES staff (staffno)
);

-- viewings
ALTER TABLE viewings
  DROP CONSTRAINT fk_viewings_clients
  DROP CONSTRAINT fk_viewings_propertiesforrent;

ALTER TABLE viewings ADD (
  CONSTRAINT fk_viewings_clients
    FOREIGN KEY (clientno)
    REFERENCES clients (clientno),
  CONSTRAINT fk_viewings_propertiesforrent
    FOREIGN KEY (propertyno)
    REFERENCES propertiesforrent (propertyno)
);

-- staff
ALTER TABLE staff
  DROP CONSTRAINT fk_staff_branches;

ALTER TABLE staff ADD CONSTRAINT fk_staff_branches
  FOREIGN KEY (branchno)
  REFERENCES branches (branchno);
