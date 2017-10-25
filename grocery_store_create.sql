/* COMMANDS */
/* STORE USE COOMANDS */
/* To show trigger works */
UPDATE items
SET On_Hand =0
WHERE name = "non"
/* TRIGGER TO AUTO ORDER */
CREATE TRIGGER `auto_order` 
AFTER UPDATE ON `items` 
FOR EACH ROW IF NEW.On_Hand < 1 THEN 
INSERT INTO item_orders(Amount_Ordered,Item_Code,Store_Num) VALUES (5,NEW.Item_Code, NEW.Store_Num); 
END IF

/* FIND ALL ITEMS IN AN AISLE, SORT BY PRICE */
SELECT name, price AS "Grocery Aisle 5"
FROM ITEMS 
WHERE aisle_num = "G5" 
ORDER BY Price*Sale_Factor ASC

/* SEE HOW MANY ITEMS ARE IN EACH AISLE */
SELECT Aisle_num,COUNT(name) AS "Items per Aisle" 
FROM `ITEMS` 
GROUP BY aisle_num 
ORDER BY aisle_num ASC


/* PERSON USE COMMANDS */
/* ORDER GROCERY LIST BY AISLE */
SELECT * FROM `grocery_list` 
WHERE 1 
ORDER BY AISLE_NUM ASC

/*GET TOTAL PRICE */
SELECT SUM(Price) AS total 
FROM `grocery_list` 
WHERE 1


/*
	Base Store
*/

create table Store (
	Store_Num INTEGER,
	Name VARCHAR(50),
	Address VARCHAR(50),
    PRIMARY KEY(Store_Num)
);
insert into Store (Store_Num, Name, Address) values (9818, 'Meejo', '3 Homewood Trail');


/*
	Departments In store 9818
*/
create table Department (
	Name VARCHAR(10),
	Store_Num INTEGER,
    PRIMARY KEY(Name),
    FOREIGN KEY(Store_NUm) REFERENCES Store(Store_Num)
);
insert into Department (Name, Store_Num) values ('Grocery', 9818);
insert into Department (Name, Store_Num) values ('Produce', 9818);
insert into Department (Name, Store_Num) values ('Meat', 9818);
insert into Department (Name, Store_Num) values ('Deli', 9818);
insert into Department (Name, Store_Num) values ('Seafood', 9818);
insert into Department (Name, Store_Num) values ('Bakery', 9818);

/*
	Aisles In Department
*/
create table Aisle (
	Num INTEGER,
	Department VARCHAR(10),
	ID VARCHAR(2),
    PRIMARY KEY (ID),
    FOREIGN KEY (Department) REFERENCES Department(Name)
);
insert into Aisle (Num, Department, ID) values (1, 'Grocery', 'G1');
insert into Aisle (Num, Department, ID) values (2, 'Grocery', 'G2');
insert into Aisle (Num, Department, ID) values (3, 'Grocery', 'G3');
insert into Aisle (Num, Department, ID) values (4, 'Grocery', 'G4');
insert into Aisle (Num, Department, ID) values (5, 'Grocery', 'G5');
insert into Aisle (Num, Department, ID) values (6, 'Grocery', 'G6');

insert into Aisle (Num, Department, ID) values (1, 'Produce', 'P1');
insert into Aisle (Num, Department, ID) values (2, 'Produce', 'P2');
insert into Aisle (Num, Department, ID) values (3, 'Produce', 'P3');
insert into Aisle (Num, Department, ID) values (4, 'Produce', 'P4');

insert into Aisle (Num, Department, ID) values (1, 'Deli', 'D1');
insert into Aisle (Num, Department, ID) values (2, 'Deli', 'D2');

insert into Aisle (Num, Department, ID) values (1, 'Meat', 'M1');
insert into Aisle (Num, Department, ID) values (2, 'Meat', 'M2');

insert into Aisle (Num, Department, ID) values (1, 'Seafood', 'S1');
insert into Aisle (Num, Department, ID) values (2, 'Seafood', 'S2');

insert into Aisle (Num, Department, ID) values (1, 'Bakery', 'B1');
insert into Aisle (Num, Department, ID) values (2, 'Bakery', 'B2');

/*
	Items
*/
create table Items 
( 
	Item_Code INTEGER, 
	Aisle_Num VARCHAR(2), 
	Department VARCHAR(10),
    Store_Num INTEGER,		
	Name VARCHAR(50), 
	On_Hand INTEGER,
	Price DECIMAL(4,2), 
	Sale_Factor DECIMAL(5,2), 
	PRIMARY KEY(Item_Code), 
	FOREIGN KEY(Aisle_Num) REFERENCES aisle(ID),
	FOREIGN KEY(Store_Num) REFERENCES Store(Store_Num),
	FOREIGN KEY(Department) REFERENCES Department(Name) 
);

/*
	100 Grocery Items
*/
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (21415107, 'G4', 'Grocery', 'nulla', 1, 1.25, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (70699655, 'G3', 'Grocery', 'augue vestibulum', 2, 11.8, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (32394341, 'G3', 'Grocery', 'non mauris', 3, 10.76, 0.76, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (60363940, 'G4', 'Grocery', 'non', 4, 1.55, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (99784383, 'G5', 'Grocery', 'vel pede', 5, 5.53, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (92619857, 'G1', 'Grocery', 'ultrices vel', 6, 5.09, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (50424001, 'G5', 'Grocery', 'sapien', 7, 5.13, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (55436685, 'G2', 'Grocery', 'cubilia', 8, 1.7, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (89545195, 'G5', 'Grocery', 'lobortis ligula', 9, 8.79, 0.6, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (55836346, 'G5', 'Grocery', 'nam congue', 10, 13.04, 0.77, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (85707500, 'G4', 'Grocery', 'rhoncus', 11, 12.53, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (96020262, 'G5', 'Grocery', 'luctus', 12, 8.04, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (66023331, 'G4', 'Grocery', 'convallis', 13, 5.48, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (55069531, 'G5', 'Grocery', 'dapibus dolor', 14, 6.02, 0.55, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (36566675, 'G4', 'Grocery', 'gravida nisi', 0, 12.97, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (67639055, 'G6', 'Grocery', 'quis', 0, 5.75, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (89324489, 'G1', 'Grocery', 'viverra eget', 2, 14.68, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (54478842, 'G1', 'Grocery', 'natoque penatibus', 11, 10.07, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (32458895, 'G1', 'Grocery', 'nec dui', 25, 9.49, 0.5, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (97336970, 'G5', 'Grocery', 'id luctus', 26, 9.46, 0.53, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (53572105, 'G4', 'Grocery', 'in', 1, 2.12, 0.5, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (43143955, 'G5', 'Grocery', 'cursus urna', 5, 5.93, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (61391042, 'G5', 'Grocery', 'vestibulum', 7, 8.43, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (53392539, 'G5', 'Grocery', 'sociis', 8, 4.55, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (47625649, 'G4', 'Grocery', 'tortor sollicitudin', 9, 14.89, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (70787413, 'G5', 'Grocery', 'eget', 0, 4.33, 0.85, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (52005687, 'G2', 'Grocery', 'id nulla', 0, 9.41, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (85184884, 'G6', 'Grocery', 'vitae', 0, 13.67, 0.6, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (24084122, 'G6', 'Grocery', 'a', 0, 4.55, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (90009475, 'G1', 'Grocery', 'primis', 0, 3.47, 0.76, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (27583466, 'G6', 'Grocery', 'sed', 0, 5.49, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (81701981, 'G5', 'Grocery', 'sapien', 1, 5.23, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (56019191, 'G6', 'Grocery', 'leo rhoncus', 2, 8.05, 0.8, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (86092497, 'G4', 'Grocery', 'volutpat', 4, 7.91, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (32012575, 'G1', 'Grocery', 'aliquet', 5, 10.36, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (43756199, 'G4', 'Grocery', 'primis in', 8, 11.95, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (65298763, 'G5', 'Grocery', 'integer ac', 13, 14.25, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (64637715, 'G6', 'Grocery', 'erat curabitur', 18, 8.9, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (62076115, 'G3', 'Grocery', 'eget congue', 12, 2.03, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (53677262, 'G6', 'Grocery', 'lacus', 7, 1.93, 0.85, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (53122804, 'G3', 'Grocery', 'mattis pulvinar', 7, 5.99, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (98430509, 'G1', 'Grocery', 'magna bibendum', 7, 6.15, 0.74, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (90991124, 'G4', 'Grocery', 'odio in', 7, 2.27, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (41605226, 'G1', 'Grocery', 'velit eu', 7, 14.68, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (19808689, 'G3', 'Grocery', 'sit', 7, 13.24, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (19435749, 'G4', 'Grocery', 'sed', 7, 13.73, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (85533559, 'G6', 'Grocery', 'quam', 7, 10.85, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (90565053, 'G4', 'Grocery', 'ante', 7, 14.2, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (24792859, 'G4', 'Grocery', 'semper', 7, 8.06, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (17899580, 'G4', 'Grocery', 'arcu', 2, 1.25, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (42604369, 'G4', 'Grocery', 'vehicula', 2, 13.14, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (56879468, 'G5', 'Grocery', 'duis aliquam', 2, 2.64, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (52390879, 'G1', 'Grocery', 'ultricies eu', 2, 6.66, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (55289271, 'G6', 'Grocery', 'dictumst maecenas', 2, 3.91, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (95132275, 'G1', 'Grocery', 'vestibulum ante', 2, 1.32, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (31486548, 'G2', 'Grocery', 'a feugiat', 2, 2.69, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (56842738, 'G6', 'Grocery', 'ut at', 2, 8.4, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (64343484, 'G3', 'Grocery', 'nisl', 2, 12.14, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (76052754, 'G6', 'Grocery', 'sem', 2, 14.99, 0.88, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (57883955, 'G2', 'Grocery', 'eget eleifend', 2, 3.87, 0.64, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (83063913, 'G4', 'Grocery', 'eu', 2, 3.02, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (20752719, 'G6', 'Grocery', 'mauris', 2, 1.65, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (58943202, 'G1', 'Grocery', 'ipsum primis', 2, 8.36, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (51688739, 'G3', 'Grocery', 'nulla', 2, 6.6, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (42432601, 'G1', 'Grocery', 'mollis molestie', 14, 8.18, 0.88, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (60329051, 'G3', 'Grocery', 'vulputate ut', 14, 1.3, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (65692408, 'G2', 'Grocery', 'in', 14, 2.39, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (36195401, 'G6', 'Grocery', 'nam dui', 14, 7.69, 0.88, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (96846816, 'G2', 'Grocery', 'duis', 14, 2.04, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (29324688, 'G6', 'Grocery', 'lacus', 14, 10.89, 0.58, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (28926731, 'G3', 'Grocery', 'convallis', 14, 8.6, 0.77, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (51542940, 'G2', 'Grocery', 'leo', 14, 6.26, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (35822186, 'G3', 'Grocery', 'eleifend', 14, 10.36, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (38564190, 'G5', 'Grocery', 'gravida', 14, 11.51, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (66522407, 'G2', 'Grocery', 'pellentesque', 14, 12.97, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (43874047, 'G5', 'Grocery', 'nunc commodo', 11, 6.18, 0.8, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (75780146, 'G3', 'Grocery', 'nunc purus', 11, 4.42, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (97769452, 'G3', 'Grocery', 'convallis', 11, 13.77, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (74287486, 'G5', 'Grocery', 'pharetra magna', 11, 3.42, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (26699797, 'G4', 'Grocery', 'at turpis', 11, 10.2, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (94988260, 'G1', 'Grocery', 'ullamcorper', 11, 10.38, 0.51, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (87429530, 'G6', 'Grocery', 'maecenas leo', 11, 3.47, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (31010031, 'G6', 'Grocery', 'fringilla rhoncus', 11, 10.34, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (49929748, 'G2', 'Grocery', 'ac', 11, 11.01, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (72491345, 'G3', 'Grocery', 'pulvinar', 11, 7.44, 0.58, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (75621528, 'G6', 'Grocery', 'vel', 11, 9.13, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (91277687, 'G4', 'Grocery', 'enim', 4, 6.55, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (70222553, 'G4', 'Grocery', 'aliquet ultrices', 4, 9.24, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (95663664, 'G4', 'Grocery', 'enim sit', 4, 11.8, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (57015971, 'G2', 'Grocery', 'velit', 4, 9.31, 0.71, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (34545862, 'G6', 'Grocery', 'justo lacinia', 4, 8.74, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (45333153, 'G5', 'Grocery', 'cras', 4, 10.91, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (29785999, 'G6', 'Grocery', 'at', 4, 4.15, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (91639439, 'G5', 'Grocery', 'parturient montes', 4, 6.32, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (66658180, 'G3', 'Grocery', 'magna', 4, 14.56, 0.83, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (67820822, 'G5', 'Grocery', 'justo', 4, 14.62, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (21854490, 'G5', 'Grocery', 'dictumst', 4, 12.3, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (53522190, 'G6', 'Grocery', 'ut', 4, 9.29, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (19124497, 'G6', 'Grocery', 'nulla nunc', 4, 6.33, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (68704783, 'G1', 'Grocery', 'odio condimentum', 4, 12.23, 1, 9818);

/*
	40 Produce Items
*/
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (2533, 'P2', 'Produce', 'mi pede', 39, 8.5, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (8845, 'P3', 'Produce', 'nibh quisque', 39, 6.45, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (3006, 'P2', 'Produce', 'sit', 39, 8.01, 0.83, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (2776, 'P2', 'Produce', 'justo', 39, 6.17, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (7240, 'P1', 'Produce', 'sem', 39, 5.8, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (2189, 'P4', 'Produce', 'morbi', 39, 3.68, 0.57, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (2975, 'P4', 'Produce', 'urna ut', 39, 4.98, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (8807, 'P2', 'Produce', 'felis', 39, 12.24, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (3028, 'P1', 'Produce', 'sapien arcu', 39, 5.11, 0.88, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (2959, 'P4', 'Produce', 'aliquam quis', 29, 10.86, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (8142, 'P3', 'Produce', 'ut', 29, 3.23, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (3910, 'P1', 'Produce', 'vel augue', 29, 9.64, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (7162, 'P2', 'Produce', 'orci pede', 29, 9.31, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (9704, 'P3', 'Produce', 'ipsum', 29, 12.36, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (2831, 'P4', 'Produce', 'auctor', 29, 12.4, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (2473, 'P2', 'Produce', 'id nulla', 29, 9.97, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (7892, 'P2', 'Produce', 'eu', 29, 2.98, 0.75, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (7228, 'P3', 'Produce', 'elementum pellentesque', 29, 6.05, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (9395, 'P4', 'Produce', 'non mattis', 19, 8.68, 0.76, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (9419, 'P3', 'Produce', 'pharetra', 9, 12.91, 0.74, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (8997, 'P4', 'Produce', 'sapien', 19, 8.24, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (3662, 'P1', 'Produce', 'cursus', 19, 12.74, 0.55, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (9807, 'P4', 'Produce', 'pulvinar sed', 19, 3.07, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (1163, 'P2', 'Produce', 'duis ac', 19, 2.67, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (4399, 'P1', 'Produce', 'eu', 19, 13.29, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (2631, 'P1', 'Produce', 'posuere cubilia', 19, 13.32, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (8394, 'P4', 'Produce', 'pharetra magna', 19, 10.59, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (8190, 'P4', 'Produce', 'morbi', 19, 4.54, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (9589, 'P4', 'Produce', 'morbi', 19, 5.63, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (7284, 'P1', 'Produce', 'platea', 19, 9.24, 0.74, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (1791, 'P1', 'Produce', 'pretium quis', 19, 12.8, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (9552, 'P2', 'Produce', 'felis donec', 19, 10.7, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (8352, 'P4', 'Produce', 'interdum venenatis', 19, 9.48, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (3175, 'P3', 'Produce', 'ante ipsum', 19, 7.6, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (5447, 'P4', 'Produce', 'erat fermentum', 19, 7.89, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (9452, 'P4', 'Produce', 'posuere felis', 19, 2.5, 0.79, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (5601, 'P4', 'Produce', 'nisl', 19, 14.49, 0.63, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (1427, 'P2', 'Produce', 'ultrices', 9, 9.59, 0.88, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (1755, 'P2', 'Produce', 'felis ut', 9, 3.36, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (9849, 'P1', 'Produce', 'auctor gravida', 9, 8.28, 0.73, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (3243, 'P2', 'Produce', 'nunc', 9, 4.64, 0.54, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (9492, 'P2', 'Produce', 'vulputate elementum', 9, 12.13, 0.68, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (7746, 'P1', 'Produce', 'morbi vestibulum', 9, 8.51, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (5499, 'P1', 'Produce', 'justo etiam', 9, 13.19, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (7944, 'P1', 'Produce', 'rutrum', 9, 14.83, 0.62, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (4576, 'P2', 'Produce', 'vestibulum', 9, 6.27, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (1661, 'P2', 'Produce', 'posuere', 0, 2.35, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (1778, 'P2', 'Produce', 'luctus', 0, 6.46, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (3716, 'P1', 'Produce', 'libero', 0, 1.39, 0.72, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (3157, 'P2', 'Produce', 'turpis enim', 0, 1.88, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (4130, 'P3', 'Produce', 'eleifend', 0, 14.71, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (4453, 'P1', 'Produce', 'duis', 0, 13.6, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (6038, 'P1', 'Produce', 'porttitor', 0, 1.85, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (4851, 'P3', 'Produce', 'donec', 0, 11.54, 0.83, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (1102, 'P2', 'Produce', 'ligula', 0, 7.01, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (8529, 'P2', 'Produce', 'non interdum', 0, 6.98, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (6814, 'P4', 'Produce', 'sapien', 0, 10.59, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (8923, 'P4', 'Produce', 'id justo', 0, 10.44, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (6320, 'P1', 'Produce', 'maecenas rhoncus', 0, 8.83, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (5109, 'P2', 'Produce', 'in', 10, 4.19, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (4790, 'P2', 'Produce', 'id massa', 10, 14.65, 1, 9818);

/*
	20 Meat Items
*/
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (5091, 'M1', 'Meat', 'erat', 10, 6.27, 0.89, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (8899, 'M1', 'Meat', 'neque vestibulum', 10, 4.5, 0.79, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (8708, 'M1', 'Meat', 'blandit lacinia', 5, 1.54, 0.62, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (5024, 'M2', 'Meat', 'curae mauris', 5, 8.44, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (9815, 'M1', 'Meat', 'nisl',  5, 6.26, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (3953, 'M1', 'Meat', 'aliquam', 3, 12.56, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (9559, 'M2', 'Meat', 'montes nascetur', 3, 12.04, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (9582, 'M2', 'Meat', 'vulputate nonummy', 3, 1.41, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (3942, 'M2', 'Meat', 'pede lobortis', 3, 5.37, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (3002, 'M2', 'Meat', 'id', 3, 6.45, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (8370, 'M2', 'Meat', 'pede justo', 3, 14.32, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (6364, 'M1', 'Meat', 'odio', 3, 2.97, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (5125, 'M2', 'Meat', 'urna', 3, 1.05, 0.83, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (4707, 'M1', 'Meat', 'dictumst etiam', 1, 2.82, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (1022, 'M2', 'Meat', 'nulla mollis', 0, 11.16, 0.74, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (2929, 'M1', 'Meat', 'sapien iaculis', 2, 4.12, 0.8, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (7306, 'M1', 'Meat', 'enim', 6, 1.56, 0.59, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (9235, 'M2', 'Meat', 'quisque id', 3, 13.68, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (7576, 'M2', 'Meat', 'mauris sit', 3, 13.61, 0.52, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (7588, 'M1', 'Meat', 'pede justo', 1, 5.5, 1, 9818);

/*
	15 Seafood Items
*/
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (5043, 'S2', 'Seafood', 'mus', 13, 3.52, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (7170, 'S2', 'Seafood', 'erat quisque', 13, 2.18, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (5783, 'S1', 'Seafood', 'at', 13, 13.69, 0.84, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (5627, 'S2', 'Seafood', 'tortor', 13, 12.67, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (8229, 'S1', 'Seafood', 'vehicula', 7, 13.03, 0.65, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (3185, 'S2', 'Seafood', 'mauris', 7, 6.8, 0.6, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (7443, 'S1', 'Seafood', 'amet', 7, 5.24, 0.81, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (8746, 'S1', 'Seafood', 'augue vel', 7, 12.46, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (2782, 'S2', 'Seafood', 'tempor convallis', 7, 14.32, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (9065, 'S1', 'Seafood', 'accumsan', 7, 1.86, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (6230, 'S1', 'Seafood', 'aliquam sit', 7, 2.61, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (4169, 'S1', 'Seafood', 'ipsum', 7, 9.29, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (3333, 'S2', 'Seafood', 'ultrices phasellus', 4, 6.07, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (4470, 'S2', 'Seafood', 'integer', 4, 8.4, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (6284, 'S2', 'Seafood', 'habitasse', 4, 4.3, 1, 9818);

/*
	15 Deli Items
*/
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (1870, 'D1', 'Deli', 'et', 4, 14.5, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (7078, 'D2', 'Deli', 'odio', 4, 9.47, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (2548, 'D1', 'Deli', 'mattis', 4, 11.17, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (5495, 'D2', 'Deli', 'nibh in', 2, 9.98, 0.54, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (8286, 'D1', 'Deli', 'faucibus orci', 8, 4.34, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (6617, 'D2', 'Deli', 'ut at', 8,8.6, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (5463, 'D1', 'Deli', 'mi', 8,14.88, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (5200, 'D2', 'Deli', 'orci eget', 8,11.27, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (8611, 'D2', 'Deli', 'nunc viverra', 8,7.42, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (8657, 'D2', 'Deli', 'varius ut', 8,9.44, 0.82, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (8384, 'D1', 'Deli', 'lobortis', 3,8.74, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (9457, 'D2', 'Deli', 'in', 3, 9.17, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (5893, 'D1', 'Deli', 'quam pharetra', 3, 1.54, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (5350, 'D1', 'Deli', 'nisi eu', 3, 2.1, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (1358, 'D2', 'Deli', 'sapien iaculis', 3, 1.85, 1, 9818);

/*
	14 Bakery Items
*/
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (6530, 'B2', 'Bakery', 'morbi', 3, 2.99, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (5636, 'B2', 'Bakery', 'primis', 3, 7.77, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (5701, 'B2', 'Bakery', 'vel', 3, 2.52, 0.56, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (3100, 'B1', 'Bakery', 'a odio', 0, 13.89, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (4487, 'B1', 'Bakery', 'amet', 0, 12.38, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (5506, 'B1', 'Bakery', 'mi nulla', 12, 13.56, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (9800, 'B2', 'Bakery', 'porttitor', 0, 11.19, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (9816, 'B1', 'Bakery', 'ac', 0, 11.36, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (9857, 'B2', 'Bakery', 'ante vestibulum', 0, 2.89, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (2280, 'B1', 'Bakery', 'ut', 6, 7.25, 0.65, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (1890, 'B1', 'Bakery', 'neque libero', 11, 11.98, 1, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (3329, 'B1', 'Bakery', 'habitasse', 9, 6.0, 0.89, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (2561, 'B2', 'Bakery', 'sapien', 5, 2.07, 0.51, 9818);
insert into Items (Item_Code, Aisle_Num, Department, Name, On_Hand, Price, Sale_Factor, Store_Num) values (5567, 'B2', 'Bakery', 'amet eros', 4, 2.14, 1, 9818);


/*
	ADMIN
*/
create table Admin 
(
	Store_Num INTEGER,
	Permission INTEGER,
    PRIMARY KEY(Permission),
    FOREIGN KEY(Store_Num) REFERENCES Store(Store_NUm)
);
insert into Admin (Store_Num, Permission) values (9818, 88958);

/* 
	Item Orders
*/
create table Item_Orders 
(
	Store_Num INTEGER,
	Item_Code INTEGER,
	Amount_Ordered INTEGER,
	FOREIGN KEY(Store_Num) REFERENCES Store(Store_Num),
	FOREIGN KEY(Item_Code) REFERENCES Items(Item_Code)
)
/* 
Grocery List
*/
CREATE TABLE grocery_list(
    Store_Num INTEGER,
    Item_Name VARCHAR(50),
    Item_Code INTEGER,
    Price DECIMAL(4,2),
	Aisle_num VARCHAR(2),
    FOREIGN KEY(Item_Code) REFERENCES items(Item_Code),
    FOREIGN KEY(Store_Num) REFERENCES Store(Store_Num)
    );
	
/* 
Test LIST
*/
INSERT INTO grocery_list(Store_Num,Item_Name,Item_Code,Price,Aisle_num)
SELECT Store_Num, Name, Item_Code,Price*Sale_Factor,Aisle_num
FROM items
WHERE Item_Code = 6530Item_Code = 5636 OR Item_code = 1870 OR Item_code =7078  OR Item_code =7170 OR Item_code =5043 OR Item_code =6230 OR Item_code =8923 OR Item_code =3716 OR Item_code =1791 OR Item_code =9395 OR Item_code =2533 OR Item_code =43874047 OR Item_code =56842738 OR Item_code =76052754 OR Item_code =31486548 OR Item_code =90565053
OR Item_code =53122804 OR Item_code =90009475 OR Item_code =53392539 OR Item_code =55069531 OR Item_code =32394341;