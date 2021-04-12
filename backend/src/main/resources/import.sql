
-- APPOINTMENTS

insert into appointment ("id", lastname, firstname, dob, mrn, date, clinician, lastsaved)
    values (1, 'Toombs', 'Rob', '1990-2-3', 'MRN123', '2021-3-20 10:0:0', 'Dr. Pants', null);

insert into appointment ("id", lastname, firstname, dob, mrn, date, clinician, lastsaved)
    values (2, 'Pants', 'Mr', '2015-6-28', 'CAT100', '2021-4-12 13:0:0', 'Dr. Henry', '2021-2-14 16:31:0');

insert into appointment ("id", lastname, firstname, dob, mrn, date, clinician, lastsaved)
    values (3, 'Oatmeal', 'Shaquille', '2000-4-3', 'NBA208', '2021-4-20 9:45:0',  'Dr. Stevens', '2021-3-14 10:34:0');

insert into appointment ("id", lastname, firstname, dob, mrn, date, clinician, lastsaved)
    values (4, 'Twoscoops', 'Donnie', '1946, 5, 6', 'MAGA2020', '2021-1-2 11:45:0', 'Dr. Doctor', null);

insert into appointment ("id", lastname, firstname, dob, mrn, date, clinician, lastsaved)
    values (5, 'Nothisis', 'Patrick', '1972, 10, 13', 'STAR12', '2021-5-4 16:30:0', 'Sponge Bob', null);

insert into appointment ("id", lastname, firstname, dob, mrn, date, clinician, lastsaved)
    values (6, 'Pitt', 'Bread', '1983, 12, 25', '1231MR3', '2021-4-21 9:34:0',  'Patrick Star', null);

insert into appointment ("id", lastname, firstname, dob, mrn, date, clinician, lastsaved)
    values (7, 'Bateman', 'Patrick', '1940,8, 13', 'FJSAF231', '2021-6-6 17:37:0',  'Mr. BigMan', '2020-7-12 12:4:0');

select setval('hibernate_sequence', 7, true);

-- MEDICATIONS

insert into medication ("id", appointment_id, name, firstfill, copay, dayssupply)
    values (1, 1, 'Pixie Sticks', '2020-12-10', 10.0, 30),
           (2, 6, 'Pixie Sticks', '2020-12-10', 10.0, 30),
           (3, 7, 'Pixie Sticks', '2020-12-10', 10.0, 30);

insert into medication ("id", appointment_id, name, firstfill, copay, dayssupply)
    values (4, 2, 'Coffee', '2020-9-3', 3.59, 1),
           (5, 5, 'Coffee', '2020-9-3', 3.59, 1),
           (6, 7, 'Coffee', '2020-9-3', 3.59, 1);

insert into medication ("id", appointment_id, name, firstfill, copay, dayssupply)
    values (8, 2, 'Meatballs', '2020-12-3', 7.99, 7),
           (9, 3, 'Meatballs', '2020-12-3', 7.99, 7);

insert into medication ("id", appointment_id, name, firstfill, copay, dayssupply)
    values (10, 3, 'Cat Nip', '2020-2-3', 6.30, 3),
           (11, 4, 'Cat Nip', '2020-2-3', 6.30, 3),
           (12, 7, 'Cat Nip', '2020-2-3', 6.30, 3);

insert into medication ("id", appointment_id, name, firstfill, copay, dayssupply)
    values (13, 3, 'Calzones', '2020-9-3', 15.99, 60),
           (14, 4, 'Calzones', '2020-9-3', 15.99, 60),
           (15, 7, 'Calzones', '2020-9-3', 15.99, 60);

select setval('hibernate_sequence', 15, true);
