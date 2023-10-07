-- create database parking lot management
create database plm;

use plm;

-- customer, employee, parking_lot, parking_spot, reservation, vehicle, parking_log, payment-- 
select
    'CREATING TABLES...' AS '';

create table
    employee (emp_id int, primary key (emp_id), first_name varchar(20), last_name varchar(20), email varchar(50), phone_number varchar(50), user_name varchar(20), password varchar(50));

-- Creating table ParkingLot
create table
    parking_lot (lot_id int, lot_name varchar(20), location varchar(50), total_spots int, available_spots int, emp_id int, primary key (lot_id), foreign key (emp_id) references employee (emp_id));

-- Creating table parkingSpot
create table
    parking_spot (spot_id int, lot_id int, spot_type varchar(20), status varchar(50), primary key (spot_id), foreign key (lot_id) references parking_lot (lot_id));

create table
    customer (cust_id int, first_name varchar(20), last_name varchar(20), email varchar(50), phone_number varchar(50), address varchar(50), user_name varchar(20), password varchar(20), primary key (cust_id));

create table
    reservation (
        res_id int,
        cust_id int,
        spot_id int,
        expire_time timestamp,
        status varchar(20),
        primary key (res_id),
        foreign key (cust_id) references customer (cust_id),
        foreign key (spot_id) references parking_spot (spot_id)
    );

create table
    vehicle (vehicle_id int, cust_id int, plate_number varchar(20), vehicle_type varchar(20), primary key (vehicle_id), foreign key (cust_id) references customer (cust_id));

create table
    parking_log (
        log_id int,
        vehicle_id int,
        spot_id int,
        checkin_time timestamp,
        checkout_time timestamp,
        res_id int,
        primary key (log_id),
        foreign key (vehicle_id) references vehicle (vehicle_id),
        foreign key (spot_id) references parking_spot (spot_id)
    );

create table
    payment (
        pmt_id int,
        log_id int,
        cust_id int,
        pmt_mode varchar(20),
        pmt_amt decimal(10, 2),
        pmt_status varchar(20),
        primary key (pmt_id),
        foreign key (log_id) references parking_log (log_id),
        foreign key (cust_id) references customer (cust_id)
    );

-- customer, employee, parking_lot, parking_spot, reservation, vehicle, parking_log, payment-- 
select
    'LOADING DATA...' AS '';

-- Insert into Customer
insert into
    customer (cust_id, first_name, last_name, email, phone_number, address, user_name, password)
values
    (101, 'Bradley', 'Phillips', 'kristywebb@example.net', 4707618385, '620 Amy View Suite 384, AK 70518', 'zrodriguez', '@0rs8SGwk0'),
    (102, 'Angela', 'Pacheco', 'ysmith@example.net', '5989348784', '6582 Solomon Throughway, MS 81795', 'dana50', 'y*9J$24b'),
    (103, 'Theresa', 'Cruz', 'riverapamela@example.net', 9092927398, '6246 Nelson Squares Apt. 517, NY 04860', 'fmartinez', 'R(4E0tUr'),
    (104, 'David', 'Martin', 'michael01@example.com', '2379211270', '50527 Martinez Street, MD 54885', 'david13', '@DiLtted5'),
    (105, 'Tyler', 'Davis', 'seanleach@example.net', '3909217820', '817 Sutton Village Suite 600, MO 79644', 'ryanfisher', 'e43Jo)g1!go'),
    (106, 'David', 'Alvarez', 'caitlinkhan@example.org', '4186815330', '218 Debbie Keys, VT 00709', 'atkinschristopher', '^++lY0Qh'),
    (107, 'Daniel', 'Martin', 'kurt78@example.com', '3542745193', '46387 William Shore, MP 56139', 'matthewgordon', '#i$F6ptz11bF'),
    (108, 'Lisa', 'Lopez', 'wendy27@example.net', '6697126654', '829 Danielle Springs Suite 014, KS 63041', 'derricksolomon', 'Y11E!*c&^S'),
    (109, 'Christopher', 'Martin', 'lucascollins@example.com', '9933884228', '47496 Richards Union, PR 67368', 'randalldenise', '+q9CK*nK'),
    (110, 'Andrea', 'Sellers', 'michele04@example.org', '7029370537', '0443 Robbins Track Apt. 106, AZ 85593', 'qreed', 'dieA29MwF*'),
    (111, 'Frank', 'Miller', 'christopher43@example.net', '2903210477', '493 Christopher Shoal Apt. 050, CT 54156', 'cbecker', '!pQEISicT)6'),
    (112, 'George', 'Johnson', 'nrobles@example.com', '7253135207', '1808 Carroll Centers', 'ryanmartin', ')+GSxil$5s'),
    (113, 'Yolanda', 'Lawrence', 'denisewilliams@example.org', '5675136105', 'USNS Boyd', 'david84', '_V5qMDFyI'),
    (114, 'Kimberly', 'Becker', 'igreen@example.org', '9992606441', '67199 Baker Course', 'paul14', 'lSoL&IwJ+7B'),
    (115, 'Melissa', 'Garcia', 'alexandra59@example.com', '9997131470', '86924 Duane Dam Apt. 652', 'mark86', ')%6sg+hc7+EF'),
    (116, 'Bobby', 'Jones', 'molly07@example.net', '0016854999', '301 Samantha Trail’t, FM 38896', 'ycarter', 'oDMtmpkk(0'),
    (117, 'Stacey', 'Singleton', 'jeffrey14@example.org', '4418062220', '539 Adam Union', 'rcox', 'd7qJ*it#*1C'),
    (118, 'Nicole', 'Roman', 'estark@example.org', '7242189202', '279 Barnett Prairie', 'christopher73', '#BBC_Yt*9Gw');

Insert into
    employee (emp_id, first_name, last_name, email, phone_number, user_name, password)
values
    (1, 'Glenn', 'Long', 'canderson@example.org', '3420578986', 'sharon67', '79rBrk0(('),
    (2, 'Joseph', 'Fleming', 'deborahsmith@example.com', '8547894291', 'moorejames', 'y9MN+(&n&'),
    (3, 'Billy', 'Sherman', 'john38@example.com', '8348640888', 'tanyamason', '0ht48Cfsf&'),
    (4, 'Tyler', 'Green', 'vcurry@example.org', '2033989761', 'laurenrodriguez', 'n6NQZ0VG$b'),
    (5, 'Hannah', 'Love', 'meredithmorton@example.org', '2017817291', 'williscolton', '(Y5WUlVNw'),
    (6, 'Kathryn', 'Greer', 'qballard@example.net', '9756493349', 'kparks', '+0NSh1BN2%lj'),
    (7, 'Elizabeth', 'Norris', 'hcortez@example.net', '9245557252', 'jordanbailey', 'B27VbX$mM@1'),
    (8, 'Hunter', 'Fleming', 'kstrong@example.org', '3878611793', 'stephaniejones', 'XEvVMtB08!4');

-- customer, employee, parking_lot, parking_spot, reservation, vehicle, parking_log, payment-- 
INSERT INTO
    parking_lot (lot_id, lot_name, location, total_spots, available_spots, emp_id)
values
    (1000, 'Edward Fernandez', '726 Peterson Wells', 1, 29, 4),
    (1001, 'Tina Hall', '5433 Elizabeth Club', 29, 1, 7),
    (1002, 'Brian Osborne', '799 David Ford Apt. 010', 18, 12, 8),
    (1003, 'Michael Acevedo', '303 Robert Burgs Suite 903', 25, 5, 8),
    (1004, 'Christina Graham', '425 Kim Vista', 11, 19, 4),
    (1005, 'Carolyn Perry', '618 Roy Hill Suite 294', 23, 7, 1),
    (1006, 'Perry Collier', '431 Davis Club', 10, 20, 2),
    (1007, 'Oscar Sanders', '0333 Kennedy Street', 27, 3, 6),
    (1008, 'Brian Hamilton', '06886 Samantha Neck Apt. 612', 15, 15, 2),
    (1009, 'Rhonda Hill', '26283 Ashley River Suite 036', 13, 17, 3),
    (1010, 'Mark Simmons', '39621 Karla Forest', 15, 15, 2),
    (1011, 'Derek Davis DVM', '4276 Lauren Prairie Apt. 848', 26, 4, 5),
    (1012, 'Kristina Mcdowell', '216 Dorsey Cove', 6, 24, 3),
    (1013, 'Natasha Merritt', '2704 Hahn Islands', 7, 23, 4),
    (1014, 'Adam Moore', '085 Adams Park Suite 021', 13, 17, 4),
    (1015, 'Ashley Cardenas', '477 Gomez Shoal Suite 716', 25, 5, 6);

insert into
    parking_spot (spot_id, lot_id, spot_type, status)
values
    (200, 1007, 'charging', 'occupied'),
    (201, 1008, 'valet', 'occupied'),
    (202, 1013, 'charging', 'available'),
    (203, 1003, 'standard', 'available'),
    (204, 1002, 'disabled', 'occupied'),
    (205, 1010, 'valet', 'occupied'),
    (206, 1002, 'standard', 'occupied'),
    (207, 1008, 'charging', 'occupied'),
    (208, 1014, 'standard', 'available'),
    (209, 1013, 'motor cycle', 'occupied'),
    (210, 1005, 'truck', 'occupied'),
    (211, 1015, 'motor cycle', 'occupied'),
    (212, 1002, 'reserved', 'available'),
    (213, 1008, 'valet', 'occupied'),
    (214, 1004, 'reserved', 'available'),
    (215, 1006, 'valet', 'occupied'),
    (216, 1001, 'valet', 'available'),
    (217, 1008, 'truck', 'occupied'),
    (218, 1013, 'motor cycle', 'available'),
    (219, 1009, 'valet', 'available'),
    (220, 1013, 'charging', 'occupied'),
    (221, 1010, 'charging', 'occupied'),
    (222, 1001, 'truck', 'occupied'),
    (223, 1009, 'valet', 'available'),
    (224, 1011, 'truck', 'occupied'),
    (225, 1007, 'motor cycle', 'available'),
    (226, 1007, 'motor cycle', 'available'),
    (227, 1006, 'reserved', 'occupied'),
    (228, 1011, 'motor cycle', 'available'),
    (229, 1004, 'truck', 'available');

insert into
    reservation (res_id, cust_id, spot_id, expire_time, status)
values
    (200, 108, 212, '2023-11-17 05:10:40', 'failed'),
    (201, 117, 228, '2023-12-10 08:32:02', 'failed'),
    (202, 110, 210, '2023-11-15 08:14:25', 'confirmed'),
    (203, 106, 215, '2023-11-11 20:30:01', 'confirmed'),
    (204, 113, 210, '2023-10-29 20:44:42', 'confirmed'),
    (205, 107, 217, '2023-10-18 23:59:17', 'failed'),
    (206, 102, 201, '2023-10-05 14:29:34', 'confirmed'),
    (207, 115, 227, '2023-12-10 20:39:47', 'failed'),
    (208, 105, 223, '2023-12-12 14:23:59', 'confirmed'),
    (209, 101, 217, '2023-10-31 17:15:39', 'confirmed'),
    (210, 101, 204, '2023-10-30 21:57:53', 'confirmed'),
    (211, 117, 201, '2023-12-27 07:44:57', 'confirmed'),
    (212, 101, 213, '2023-10-21 15:39:54', 'failed'),
    (213, 118, 209, '2023-12-13 07:33:10', 'failed'),
    (214, 101, 214, '2023-12-27 01:53:20', 'confirmed'),
    (215, 106, 223, '2023-12-07 03:28:38', 'confirmed'),
    (216, 102, 207, '2023-10-20 19:59:46', 'confirmed'),
    (217, 118, 227, '2023-12-02 15:21:08', 'failed'),
    (218, 113, 209, '2023-11-18 20:19:52', 'failed'),
    (219, 110, 219, '2023-11-24 06:08:57', 'failed'),
    (220, 102, 203, '2023-11-14 14:55:30', 'confirmed'),
    (221, 118, 214, '2023-11-05 22:11:59', 'failed'),
    (222, 118, 223, '2023-11-27 15:12:02', 'confirmed'),
    (223, 114, 207, '2023-11-09 20:57:05', 'confirmed'),
    (224, 104, 211, '2023-12-30 07:35:01', 'failed'),
    (225, 102, 226, '2023-12-19 01:26:47', 'confirmed'),
    (226, 104, 200, '2023-10-17 10:11:06', 'failed'),
    (227, 109, 202, '2023-11-28 22:38:45', 'confirmed'),
    (228, 106, 224, '2023-12-11 23:47:37', 'failed'),
    (229, 112, 222, '2023-10-13 06:08:22', 'confirmed');