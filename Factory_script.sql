
## CREATING DATABASE ##

CREATE database factory;
USE factory;

## CREATING TABLES ##

CREATE table department(
	Dept_ID varchar(10) not null,
    Dept_name varchar(50),
    Dept_head varchar(10),
    No_of_employee int,
    No_of_workers int,
    PRIMARY KEY(Dept_ID)
);

CREATE table employee(
	Emp_ID varchar(5) not null,
    First_name varchar(50),
    Last_name varchar(50) not null,
    Age int,
    Department varchar(5),
    Manager_ID varchar(10),
    PRIMARY KEY(Emp_ID),
	CONSTRAINT FK_Employee_DeptID foreign key(Department) references department(Dept_ID)
    on delete set null on update cascade,
	CONSTRAINT FK_Manager foreign key(Manager_ID) references employee(Emp_ID)
    on delete set null on update cascade
);

CREATE table worker(
	Worker_ID varchar(5) not null,
    First_name varchar(50),
    Last_name varchar(50) not null,
    Age int,
    Department varchar(5),
    Supervisor varchar(5),
    PRIMARY KEY(Worker_ID),
	CONSTRAINT FK_Worker_DeptID foreign key(Department) references department(Dept_ID)
    on delete set null on update cascade,
	CONSTRAINT FK_Supervisor foreign key(Supervisor) references employee(Emp_ID)
    on delete set null on update cascade
);

CREATE table product(
	Prod_ID varchar(10) not null,
    Prod_name varchar(50) not null,
    Prod_type varchar(50),
    Department varchar(10),
    Stock_quantity int,
    PRIMARY KEY(Prod_ID),
	CONSTRAINT FK_Product_DeptID foreign key(Department) references department(Dept_ID)
    on delete cascade
);


CREATE table orders(
	Order_ID varchar(10) not null,
    Quantity integer,
    Price int,
    PRIMARY KEY(Order_ID)
);

CREATE table seller(
	Sell_name varchar(50) not null,
	Order_ID varchar(10) not null,
    Address_No int,
	Street varchar(50),
    City varchar(50),
    PRIMARY KEY(Order_ID, Sell_name),
	CONSTRAINT FK_Seller_OrderID foreign key(Order_ID) references orders(Order_ID)
	on delete cascade
);


CREATE table raw_material(
	Raw_ID varchar(10) not null,
    Raw_name varchar(50) not null,
    Stock_quantity int,
    PRIMARY KEY(Raw_ID)
);

CREATE table supplier(
	Sup_name varchar(50) not null,
	Raw_material varchar(10) not null,
	Address_No int,
	Street varchar(50),
    City varchar(50),
    PRIMARY KEY(Raw_material, Sup_name),
	CONSTRAINT FK_Supplier_DeptID foreign key(Raw_material) references raw_material(Raw_ID)
	on delete cascade
);

CREATE table machine(
	Machine_ID varchar(10) not null,
    Machine_name varchar(50) not null,
    Machine_function varchar(100) not null,
    Department varchar(10),
    PRIMARY KEY(Machine_ID),
	CONSTRAINT FK_DeptID foreign key(Department) references department(Dept_ID)
    on delete cascade on update cascade
);


CREATE table raw_department(
	Raw_ID varchar(10) not null,
    Dept_ID varchar(10) not null,
	PRIMARY KEY(Raw_ID, Dept_ID),
    CONSTRAINT fk_Raw_Dept FOREIGN KEY(Raw_ID) references raw_material(Raw_ID)
	on delete cascade,
    CONSTRAINT fk_Dept_Raw FOREIGN KEY(Dept_ID) references department(Dept_ID)
	on delete cascade
);

CREATE table product_order(
	Prod_ID varchar(10) not null,
    Order_ID varchar(10) not null,
	PRIMARY KEY(Prod_ID, Order_ID),
    CONSTRAINT fk_Prod_Order FOREIGN KEY(Prod_ID) references product(Prod_ID)
	on delete cascade,
    CONSTRAINT fk_Order_Prod FOREIGN KEY(Order_ID) references orders(Order_ID)
	on delete cascade
);

CREATE table employee_contact(
	Emp_ID varchar(10) not null,
    Contact varchar(10) not null,
	PRIMARY KEY(Emp_ID, Contact),
    CONSTRAINT fk_EmpID_Contact FOREIGN KEY(Emp_ID) references employee(Emp_ID)
	on delete cascade
);

CREATE table worker_contact(
	Worker_ID varchar(10) not null,
    Contact varchar(10) not null,
	PRIMARY KEY(Worker_ID, Contact),
    CONSTRAINT fk_WorkerID_Contact FOREIGN KEY(Worker_ID) references worker(Worker_ID)
	on delete cascade
);

CREATE table supplier_contact(
	Sup_name varchar(50) not null,
	Raw_material varchar(10) not null,
    Contact varchar(10) not null,
	PRIMARY KEY(Raw_material,Contact),
	CONSTRAINT fk_RawMaterial_Contact FOREIGN KEY(Raw_material) references supplier(Raw_material)
	on delete cascade
);

CREATE table seller_contact(
	Sell_name varchar(50) not null,
	Order_ID varchar(10) not null,
    Contact varchar(10) not null,
	PRIMARY KEY(Order_ID,Contact),
	CONSTRAINT fk_OrderID_Contact FOREIGN KEY(Order_ID) references seller(Order_ID)
	on delete cascade
);


## ADD DATA TO THE TABLES ##

-- Departments Table --

INSERT into department(Dept_ID,Dept_name,Dept_head) values("D1001","Cutting","E002");
INSERT into department(Dept_ID,Dept_name,Dept_head) values("D1002","Printing","E005");
INSERT into department(Dept_ID,Dept_name,Dept_head) values("D1003","Packing","E008");
INSERT into department(Dept_ID,Dept_name,Dept_head) values("D1004","Bathik","E007");
INSERT into department(Dept_ID,Dept_name,Dept_head) values("D1005","Silk","E009");
INSERT into department(Dept_ID,Dept_name,Dept_head) values("D1006","Cotton","E006");
INSERT into department(Dept_ID,Dept_name,Dept_head) values("D1007","Sport","E004");
INSERT into department(Dept_ID,Dept_name,Dept_head) values("D1008","Sewing","E006");
INSERT into department(Dept_ID,Dept_name,Dept_head) values("D1009","Finishing","E011");

-- Employee Table --

INSERT into employee(Emp_ID,First_name,Last_name,Age,Department,Manager_ID) values("E001","Menuka","Perera",23,null,null);
INSERT into employee(Emp_ID,First_name,Last_name,Age,Department,Manager_ID) values("E002","Rasika","Amarathunga",45,"D1006","E001");
INSERT into employee(Emp_ID,First_name,Last_name,Age,Department,Manager_ID) values("E003","Nayana","Peris",29,"D1008","E001");
INSERT into employee(Emp_ID,First_name,Last_name,Age,Department,Manager_ID) values("E004","Shashi","Weerathunga",35,"D1003","E001");
INSERT into employee(Emp_ID,First_name,Last_name,Age,Department,Manager_ID) values("E005","Ayanthi","Fernando",31,null,"E001");
INSERT into employee(Emp_ID,First_name,Last_name,Age,Department,Manager_ID) values("E006","Yohan","Silva",30,"D1008","E001");
INSERT into employee(Emp_ID,First_name,Last_name,Age,Department,Manager_ID) values("E007","Yasindu","Amantha",39,"D1007","E001");
INSERT into employee(Emp_ID,First_name,Last_name,Age,Department,Manager_ID) values("E008","Imesh","Udantha",24,"D1002","E001");
INSERT into employee(Emp_ID,First_name,Last_name,Age,Department,Manager_ID) values("E009","T","Thanachchayqn",21,"D1001","E001");
INSERT into employee(Emp_ID,First_name,Last_name,Age,Department,Manager_ID) values("E010","Udari","Perera",46,"D1005","E001");
INSERT into employee(Emp_ID,First_name,Last_name,Age,Department,Manager_ID) values("E011","Omalka","de Silva",35,"D1001","E001");
INSERT into employee(Emp_ID,First_name,Last_name,Age,Department,Manager_ID) values("E012","Pasindu","Karunanayake",40,"D1006","E001");

-- Workers Table --

INSERT into worker(Worker_ID,First_name,Last_name,Age,Department,Supervisor) values("W101","Kamal","Perera",45,"D1004","E002");
INSERT into worker(Worker_ID,First_name,Last_name,Age,Department,Supervisor) values("W102","Nanda","Amarathunga",20,"D1002","E008");
INSERT into worker(Worker_ID,First_name,Last_name,Age,Department,Supervisor) values("W103","Siril","Peris",24,"D1005","E004");
INSERT into worker(Worker_ID,First_name,Last_name,Age,Department,Supervisor) values("W104","Asela","Weerathunga",37,"D1008","E003");
INSERT into worker(Worker_ID,First_name,Last_name,Age,Department,Supervisor) values("W105","Oshan","Ferna",29,"D1003","E004");
INSERT into worker(Worker_ID,First_name,Last_name,Age,Department,Supervisor) values("W106","Udari","Silva",34,"D1006","E005");
INSERT into worker(Worker_ID,First_name,Last_name,Age,Department,Supervisor) values("W107","Umatha","Yehan",35,"D1006","E005");
INSERT into worker(Worker_ID,First_name,Last_name,Age,Department,Supervisor) values("W108","Sandaru","Silva",30,"D1002","E006");
INSERT into worker(Worker_ID,First_name,Last_name,Age,Department,Supervisor) values("W109","Piyum","Niroshan",25,"D1001","E005");
INSERT into worker(Worker_ID,First_name,Last_name,Age,Department,Supervisor) values("W110","Udari","Maduwanthika",41,"D1006","E008");
INSERT into worker(Worker_ID,First_name,Last_name,Age,Department,Supervisor) values("W111","Lahiru","Kamal",56,"D1007","E006");
INSERT into worker(Worker_ID,First_name,Last_name,Age,Department,Supervisor) values("W112","Supun","Perera",27,"D1007","E008");

-- Products Table --

INSERT into product(Prod_ID,Prod_Name,Prod_type,Department,Stock_quantity) values("P201","Blouse","Ladies","D1007",400);
INSERT into product(Prod_ID,Prod_Name,Prod_type,Department,Stock_quantity) values("P202","Socks","Kids","D1004",150);
INSERT into product(Prod_ID,Prod_Name,Prod_type,Department,Stock_quantity) values("P203","Geans","Ladies","D1006",275);
INSERT into product(Prod_ID,Prod_Name,Prod_type,Department,Stock_quantity) values("P204","Geans","Mens","D1005",175);
INSERT into product(Prod_ID,Prod_Name,Prod_type,Department,Stock_quantity) values("P205","Shirt","Mens","D1005",325);
INSERT into product(Prod_ID,Prod_Name,Prod_type,Department,Stock_quantity) values("P206","Frock","Ladies","D1004",200);
INSERT into product(Prod_ID,Prod_Name,Prod_type,Department,Stock_quantity) values("P207","Blouse","Ladies","D1006",225);

-- Raw Materials Table --

INSERT into raw_material(Raw_ID,Raw_name,Stock_quantity) values("R301","Fabric rolls",200);
INSERT into raw_material(Raw_ID,Raw_name,Stock_quantity) values("R302","Threads",325);
INSERT into raw_material(Raw_ID,Raw_name,Stock_quantity) values("R303","Inks",270);
INSERT into raw_material(Raw_ID,Raw_name,Stock_quantity) values("R304","Buttons",410);
INSERT into raw_material(Raw_ID,Raw_name,Stock_quantity) values("R305","Packings",75);
INSERT into raw_material(Raw_ID,Raw_name,Stock_quantity) values("R306","Lables",225);

-- Orders Table --

INSERT into orders(Order_ID,Price,Quantity) values("O401",50000,50);
INSERT into orders(Order_ID,Price,Quantity) values("O402",100000,100);
INSERT into orders(Order_ID,Price,Quantity) values("O403",75000,25);
INSERT into orders(Order_ID,Price,Quantity) values("O404",12000,75);
INSERT into orders(Order_ID,Price,Quantity) values("O405",25000,125);
INSERT into orders(Order_ID,Price,Quantity) values("O406",7500,15);

-- Suppliers Table --

INSERT into supplier(Sup_name,Raw_material,Address_No,Street,City) values("Sunil","R305",43,"Rose street","Kandy");
INSERT into supplier(Sup_name,Raw_material,Address_No,Street,City) values("Anil","R303",20,"Marble street","Galle");
INSERT into supplier(Sup_name,Raw_material,Address_No,Street,City) values("Sunil","R304",10,"Perera road","Colombo");
INSERT into supplier(Sup_name,Raw_material,Address_No,Street,City) values("Amith","R301",90,"Araliya mawatha","Colombo");
INSERT into supplier(Sup_name,Raw_material,Address_No,Street,City) values("Kamal","R306",55,"Sri Vijaya road","Kandy");
INSERT into supplier(Sup_name,Raw_material,Address_No,Street,City) values("Lalith","R302",23,"Udugama street","Colombo");

-- Sellers Table --

INSERT into seller(Sell_name,Order_ID,Address_No,Street,City) values("Shahid","O405",11,"Kane street", "Colombo");
INSERT into seller(Sell_name,Order_ID,Address_No,Street,City) values("Sahan","O401",07,"Rose street","Kandy");
INSERT into seller(Sell_name,Order_ID,Address_No,Street,City) values("Reidy","O403",78,"De Silva road","Colombo");
INSERT into seller(Sell_name,Order_ID,Address_No,Street,City) values("Ishara","O402",22,"Jasmine road","Matara");
INSERT into seller(Sell_name,Order_ID,Address_No,Street,City) values("Oshan","O406",101,"Otara street","Galle");
INSERT into seller(Sell_name,Order_ID,Address_No,Street,City) values("Oshan","O404",15,"Yatawara road","Kandy");

-- Machines Table --

INSERT into machine(Machine_ID,Machine_name,Machine_function,Department) values("M501","Sewing machine","Sewing fabrics together","D1008");
INSERT into machine(Machine_ID,Machine_name,Machine_function,Department) values("M502","Cutting machine","Cutting fabrics","D1001");
INSERT into machine(Machine_ID,Machine_name,Machine_function,Department) values("M503","Overlovck machine","Finish fabric edges","D1009");
INSERT into machine(Machine_ID,Machine_name,Machine_function,Department) values("M504","Pressing machine","Press finished garments","D1009");
INSERT into machine(Machine_ID,Machine_name,Machine_function,Department) values("M505","Pattern maker","Design patterns and cut","D1002");
INSERT into machine(Machine_ID,Machine_name,Machine_function,Department) values("M506","Heat transfer machine","Apply lables and desings","D1009");

-- Raw_Department Table --

INSERT into raw_department(Raw_ID, Dept_ID) values("R301","D1001");
INSERT into raw_department(Raw_ID, Dept_ID) values("R302","D1009");
INSERT into raw_department(Raw_ID, Dept_ID) values("R306","D1009");
INSERT into raw_department(Raw_ID, Dept_ID) values("R303","D1002");
INSERT into raw_department(Raw_ID, Dept_ID) values("R304","D1008");
INSERT into raw_department(Raw_ID, Dept_ID) values("R302","D1007");

-- Product_Order Table --

INSERT into product_order(Prod_ID, Order_ID) values("P202","O401");
INSERT into product_order(Prod_ID, Order_ID) values("P201","O405");
INSERT into product_order(Prod_ID, Order_ID) values("P204","O405");
INSERT into product_order(Prod_ID, Order_ID) values("P201","O402");
INSERT into product_order(Prod_ID, Order_ID) values("P207","O405");
INSERT into product_order(Prod_ID, Order_ID) values("P201","O403");


-- Employee_Contact Table --

INSERT into employee_contact(Emp_ID, Contact) values("E001","0700756432");
INSERT into employee_contact(Emp_ID, Contact) values("E001","0776758742");
INSERT into employee_contact(Emp_ID, Contact) values("E002","0710855432");
INSERT into employee_contact(Emp_ID, Contact) values("E003","0770896400");
INSERT into employee_contact(Emp_ID, Contact) values("E003","0700771339");
INSERT into employee_contact(Emp_ID, Contact) values("E004","0760906872");

-- Worker_Contact Table --

INSERT into worker_contact(Worker_ID, Contact) values("W101","0700906493");
INSERT into worker_contact(Worker_ID, Contact) values("W102","0710758092");
INSERT into worker_contact(Worker_ID, Contact) values("W103","0700755121");
INSERT into worker_contact(Worker_ID, Contact) values("W103","0770756432");
INSERT into worker_contact(Worker_ID, Contact) values("W104","0720759032");
INSERT into worker_contact(Worker_ID, Contact) values("W104","0770756530");

-- Seller_Contact Table --

INSERT into seller_contact(Sell_name, Order_ID, Contact) values("Shahid","O405","0770756738");
INSERT into seller_contact(Sell_name, Order_ID, Contact) values("Shahid","O405","0774556652");
INSERT into seller_contact(Sell_name, Order_ID, Contact) values("Sahan","O401","0700757632");
INSERT into seller_contact(Sell_name, Order_ID, Contact) values("Oshan","O403","0700756476");
INSERT into seller_contact(Sell_name, Order_ID, Contact) values("Ishara","O402","0710396490");
INSERT into seller_contact(Sell_name, Order_ID, Contact) values("Ishara","O406","0750356459");

-- Supplier_Contact Table --

INSERT into supplier_contact(Sup_name, Raw_material, Contact) values("Sunil","R305","0750756789");
INSERT into supplier_contact(Sup_name, Raw_material, Contact) values("Sunil","R305","0774566739");
INSERT into supplier_contact(Sup_name, Raw_material, Contact) values("Kamal","R306","0760756739");
INSERT into supplier_contact(Sup_name, Raw_material, Contact) values("Lalith","R302","0750236439");
INSERT into supplier_contact(Sup_name, Raw_material, Contact) values("Lalith","R302","0750757869");
INSERT into supplier_contact(Sup_name, Raw_material, Contact) values("Anil","R303","0700756746");

## UPDATE, DELETE DATA FROM THE TABLES ##

-- Department Table --
DELETE from department
where Dept_name = 'Packing';

UPDATE department
SET Dept_name = 'Sports-material'
where Dept_ID = 'D1005';

UPDATE department
SET  Dept_head = 'E011'
where Dept_ID = 'D1004';

-- Employee Table --
DELETE from employee
where Emp_ID = 'E012';

UPDATE employee
SET Last_name = 'Dadigamna'
where Emp_ID = 'E003' ;

UPDATE employee
SET  Age = 44 
where Emp_ID = 'E005';

-- Worker Table --
DELETE from worker
where Last_name = 'Siril';

UPDATE worker
SET First_name = 'Hasith'
where Worker_ID = 'W104';

UPDATE worker
SET  Age = 36
where Worker_ID = 'W103';


-- Product Table --
DELETE from product
where Stock_quantity = 325;

UPDATE product
SET Prod_type = 'Kids'
where Prod_ID = 'P203';

UPDATE product
SET  Prod_name = 'T-shirt'
where Prod_ID = 'P205';

-- Raw Material Table --
DELETE from raw_material
where Stock_quantity < 100;

UPDATE raw_material
SET Raw_name = 'Lables and Tags'
where Raw_ID = 'R306';

UPDATE raw_material
SET  Stock_quantity = 300
where Raw_ID = 'R302';

-- Orders Table --
DELETE from orders
where Price = 7500;

UPDATE orders
SET Quantity = 200
where Order_ID = 'O403' ;

UPDATE orders
SET  Price = 200000
where Order_ID = 'O405';


-- Supplier Table --
DELETE from supplier
where Raw_material = 'R304';

UPDATE supplier
SET Sup_name = 'Dadigamna'
where Sup_name = 'Sunil';

UPDATE supplier
SET  Address_No = 50
where Raw_material = 'R305';

-- Seller Table --
DELETE from seller
where  Order_ID = 'O403';

UPDATE seller
SET City = 'Ampara'
where Sell_name = 'Sahan';

UPDATE seller
SET  Street = 'Wijaya Mawatha'
where Order_ID = 'O401';


-- Machine Table --
DELETE from machine
where Machine_function = "Apply lables and desings";

UPDATE machine
SET Machine_name = "Pattern making machine"
where Machine_ID = "M502";

UPDATE machine
SET  Machine_function = "Stitching fabrics together"
where Machine_ID = 'M501';




## SIMPLE QUERIES ##

-- Select Operation --
SELECT * from employee 
where Department = 'D1002';

SELECT * from product
where Stock_quantity > 200;


-- Project Operation --
SELECT First_name, Last_name from worker
where Department = 'D1002';


-- Cartesian Product Operation --
SELECT * from worker 
CROSS JOIN department;


-- Creating User View --
CREATE VIEW UV1 as SELECT Prod_name, Stock_Quantity from product;
SELECT * from UV1;


-- Rename Operation --
RENAME table machine to machine_equipment;


-- Aggregation Function --
SELECT Department , count(Department) as No_of_workers from worker group by Department;


-- Like Keyword --
SELECT * from employee_contact where Contact like '070%';




## COMPLEX QUERIES ##

-- Union --
(SELECT Machine_name as Machine, Machine_function from machine_equipment
where Department='D1001')
UNION
(SELECT Machine_name as Machine, Machine_function from machine_equipment 
where Department='D1004');

-- Intersection --
SELECT First_name, Last_name from worker
where Age < 30
and Department = "D1001";

-- Difference --
SELECT Department from employee
LEFT JOIN worker using(Department)
where Department = "D1001";

-- Division --
SELECT distinct P.Prod_ID from product_order as P
where not exists (SELECT Order_ID from product_order as O); 

-- Inner Join --
CREATE VIEW UV2 as (SELECT P.Prod_name, P.Department from product as P);
CREATE VIEW UV3 as (SELECT D.Dept_name, D.Dept_ID from department as D);
SELECT * from UV2 INNER JOIN UV3
on UV2.Department = UV3.Dept_ID;

-- Natural Join --
CREATE VIEW UV4 as (SELECT S.Sell_name from seller as S);
CREATE VIEW UV5 as (SELECT O.Price from orders as O);
SELECT * from UV4
NATURAL JOIN UV5;

-- Right Outer Join --
CREATE VIEW UV6 as (SELECT Worker_ID, First_name, Department from worker);
CREATE VIEW UV7 as (SELECT Emp_ID, First_name, Department from employee);
SELECT * from UV6
RIGHT OUTER JOIN UV7
on UV6.Department = UV7.Department;

-- Left Outer Join --
CREATE VIEW UV8 as (SELECT Worker_ID, First_name, Department from worker);
CREATE VIEW UV9 as (SELECT Emp_ID, First_name, Department from employee);
SELECT * from UV8
LEFT OUTER JOIN UV9
on UV8.Department = UV9.Department;

-- Full Outer Join --
CREATE VIEW UV10 as (SELECT Worker_ID, First_name, Department from worker);
CREATE VIEW UV11 as (SELECT Emp_ID, First_name, Department from employee);
(SELECT * from UV10
RIGHT OUTER JOIN UV11
on UV10.Department = UV11.Department)
UNION
(SELECT * from UV10
LEFT OUTER JOIN UV11
on UV10.Department = UV11.Department);

-- Outer Union Join --
CREATE VIEW UV12 as (SELECT Worker_ID, First_name, Department from worker);
CREATE VIEW UV13 as (SELECT Emp_ID, First_name, Department from employee);
(SELECT * from UV12
RIGHT OUTER JOIN UV13
on UV12.Department = UV13.Department)
UNION ALL
(SELECT * from UV12
LEFT OUTER JOIN UV13
on UV12.Department = UV13.Department);

-- Nested Query 1 --
SELECT First_name, Last_name from employee
where Department = 'D1001'
AND Manager_ID IN (
SELECT Emp_ID from employee
where Last_name = 'Perera');


-- Nested Query 2 --
SELECT Sup_name from supplier
where Raw_material IN (
SELECT Raw_ID from raw_material
where Stock_quantity > 150 );

-- Nested Query 3 --
SELECT First_name, Last_name from worker 
where Department IN (
SELECT Dept_ID from department
where Dept_head IN (
SELECT Emp_ID from employee
where Age < 40));



## Database Tuning ##

-- Union--

explain ((SELECT Machine_name as Machine, Machine_function from machine_equipment
where Department='D1001')
UNION
(SELECT Machine_name as Machine, Machine_function from machine_equipment 
where Department='D1004'));

create index department_index using BTREE on machine_equipment(department);

explain ((SELECT Machine_name as Machine, Machine_function from machine_equipment
where Department='D1001')
UNION
(SELECT Machine_name as Machine, Machine_function from machine_equipment 
where Department='D1004')); 


-- Intersection --
explain (SELECT First_name, Last_name from worker
where Age < 30
and Department = "D1001");

create index index_department_age using BTREE on Worker(department,age);

explain (SELECT First_name, Last_name from worker
where Age < 30
and Department = "D1001");


-- Set Difference --
explain (SELECT Department from employee
LEFT JOIN worker using(Department)
where Department = "D1001");

create index index_department using BTREE on employee(department);

explain (SELECT Department from employee
LEFT JOIN worker using(Department)
where Department = "D1001");


-- Iinner Join --
explain(SELECT * from UV2 INNER JOIN UV3
on UV2.Department = UV3.Dept_ID);

create index index_department using BTREE on product(department);
create index index_dept_id using BTREE on department(dept_id);

explain(SELECT * from UV2 INNER JOIN UV3
on UV2.Department = UV3.Dept_ID);


-- Natural Join --
explain (SELECT * from UV4
NATURAL JOIN UV5);

create index index_sell_name using BTREE on seller(sell_name);
create index index_price using BTREE on orders(price);

explain (SELECT * from UV4
NATURAL JOIN UV5);

-- Left Outer Join --
explain (SELECT * from UV8
LEFT OUTER JOIN UV9
on UV8.Department = UV9.Department);

create index index_worker using BTREE on worker(department);
create index index_employee using BTREE on employee(department);

explain (SELECT * from UV8
LEFT OUTER JOIN UV9
on UV8.Department = UV9.Department);


-- Right Outer Join --
explain(SELECT * from UV6
RIGHT OUTER JOIN UV7
on UV6.Department = UV7.Department);

create index index_worker_dept using BTREE on worker(department);
create index index_employee_dept using BTREE on employee(department);

explain(SELECT * from UV6
RIGHT OUTER JOIN UV7
on UV6.Department = UV7.Department);

-- Nested Query 01 --
explain(SELECT First_name, Last_name from employee
where Department = 'D1001'
AND Manager_ID IN (SELECT Emp_ID from employee WHERE Last_name = 'Perera'));

create index index_department using BTREE on Employee(department);
create index index_last_name using BTREE on Employee(last_name);

explain(SELECT First_name, Last_name from employee
where Department = 'D1001'
AND Manager_ID IN (SELECT Emp_ID from employee WHERE Last_name = 'Perera'));


-- Nested Query 02 --
EXPLAIN(SELECT Sup_name from supplier 
where Raw_material IN (
SELECT Raw_ID from raw_material 
where Stock_quantity > 150 ));

create index index_raw_material using BTREE on supplier(raw_material);
create index index_stock_quantity using BTREE on raw_material(stock_quantity); 

explain(SELECT Sup_name from supplier 
where Raw_material IN (
SELECT Raw_ID from raw_material 
where Stock_quantity > 150 ));


-- Nested Query 03 --
explain(SELECT First_name, Last_name from worker where Department IN (
SELECT Dept_ID from department where Dept_head IN (
SELECT Emp_ID from employee where Age < 40)));

create index index_age using BTREE on employee(age);
create index index_dept_head using BTREE on department(dept_head);

explain(SELECT First_name, Last_name from worker where Department IN (
SELECT Dept_ID from department where Dept_head IN (
SELECT Emp_ID from employee where Age < 40)));








