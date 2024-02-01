



create table product(
	Product_ID nvarchar(50) NOT NULL PRIMARY KEY,
	Product_Name nvarchar(50),
	Product_Price decimal(10,2),
);



insert into product values ('P01', 'Pencil', '5.00');
insert into product values ('P02', 'Pen', '10.00');
insert into product values ('P03', 'Marker Pen', '20.00');
insert into product values ('P04', 'Clothe', '25.00');
insert into product values ('P05', 'Pant', '30.00');
insert into product values ('P06', 'Bookshelf', '50.00');
insert into product values ('P07', 'Table', '65.00');
insert into product values ('P08', 'Chair', '80.00');
insert into product values ('P09', 'Handsaw', '30.00');
insert into product values ('P10', 'Hammer', '40.00');



create table Member(
	Member_ID nvarchar(50) NOT NULL PRIMARY KEY,
	Member_Name nvarchar(50),
	Address nvarchar(50),
	Gender nvarchar (50),
	Contact_Num nvarchar(50),
	Num_of_feedback integer,
);



insert into Member values ('MO1', 'Ali', '53-49, Taman Bukit Serdang', 'M', '011-2345', '2');
insert into Member values ('MO2', 'Muthu', 'No.11, Bandar Sungai Long', 'M', '012-4567', '3');
insert into Member values ('MO3', 'Abu', '21-B5, Bukit Jalil', 'M', '013-1234', '1');
insert into Member values ('MO4', 'Jack', 'No. 12, Lebuhraya Bukit Jalil', 'M', '012-8870', '4');
insert into Member values ('MO5', 'Lee', '66, Taman Oversea', 'F', '016-3055', '2');
insert into Member values ('MO6', 'Debb', '22, Taman Imbi', 'F', '019-6660', '3');



create table supplier(
	Publisher_ID nvarchar(50) NOT NULL PRIMARY KEY,
	Product_ID nvarchar(50) NOT NULL,
	Foreign Key (Product_ID) references product(Product_ID),
	Supplier_Name nvarchar(50),
	Supplier_Address nvarchar(50),
);



insert into supplier values ('S01', 'P01', 'AB Sdn.Bhd.', 'No. 46, Jalan Puteri');
insert into supplier values ('S01', 'P02', 'AB Sdn.Bhd.', 'No. 46, Jalan Puteri');
insert into supplier values ('S01', 'P03', 'AB Sdn.Bhd.', 'No. 46, Jalan Puteri');
insert into supplier values ('S02', 'P04', 'EF Sdn.Bhd.', '42-44, Jalan TUDM');
insert into supplier values ('S02', 'P05', 'EF Sdn.Bhd.', '42-44, Jalan TUDM');
insert into supplier values ('S03', 'P06', 'JK Sdn.Bhd.', '1, Jalan TPP20');
insert into supplier values ('S03', 'P07', 'JK Sdn.Bhd.', '1, Jalan TPP21');
insert into supplier values ('S03', 'P08', 'JK Sdn.Bhd.', '1, Jalan TPP22');
insert into supplier values ('S04', 'P09', 'YZ Sdn.Bhd.', '19G, Jalan Apollo');
insert into supplier values ('S04', 'P10', 'YZ Sdn.Bhd.', '19G, Jalan Apollo');



create table Invoice(
	Invoice_num integer NOT NULL PRIMARY KEY, 
	Invoice_date date,
);



insert into Invoice values ('N01', '2022-2-5');
insert into Invoice values ('N01', '2022-2-5');
insert into Invoice values (NULL, NULL);
insert into Invoice values ('N02', '2022-3-6');
insert into Invoice values ('N02', '2022-3-6');
insert into Invoice values ('N01', '2022-2-5');
insert into Invoice values ('N03', '2022-4-7');
insert into Invoice values ('N03', '2022-4-7');
insert into Invoice values (NULL, NULL);
insert into Invoice values ('N02', '2022-3-6');



create table Stock_Count(
	Product_ID nvarchar(50) NOT NULL PRIMARY KEY,
	Foreign Key (Product_ID) references product(Product_ID),
	Stock_quantity integer,

);



insert into Stock_Count values ('P01', '50');
insert into Stock_Count values ('P02', '60');
insert into Stock_Count values ('P03', '80');
insert into Stock_Count values ('P04', '100');
insert into Stock_Count values ('P05', '80');
insert into Stock_Count values ('P06', '90');
insert into Stock_Count values ('P07', '60');
insert into Stock_Count values ('P08', '60');
insert into Stock_Count values ('P09', '40');
insert into Stock_Count values ('P10', '70');



create table Product_Rating(
	Product_ID nvarchar(50) NOT NULL PRIMARY KEY,
	Foreign Key (Product_ID) references product(Product_ID),
	Rating integer,
	num_of_comment integer,
);



insert into Product_Rating values ('P01', '3', '20');
insert into Product_Rating values ('P02', '4', '25');
insert into Product_Rating values ('P03', NULL, NULL);
insert into Product_Rating values ('P04', '5', '15');
insert into Product_Rating values ('P05', '2', '20');
insert into Product_Rating values ('P06', '5', '10');
insert into Product_Rating values ('P07', '3', '10');
insert into Product_Rating values ('P08', '3', '15');
insert into Product_Rating values ('P09', NULL, NULL);
insert into Product_Rating values ('P10', '4', '5');



create table member_total_expenses(
	member_ID nvarchar(50) NOT NULL PRIMARY KEY,
	Foreign Key (member_ID) references Member(member_ID),
	total_expenses decimal(10,2),
);



insert into member_total_expenses values ('MO1', '110.00');
insert into member_total_expenses values ('MO2', '200.00');
insert into member_total_expenses values ('MO3', '150.00');
insert into member_total_expenses values ('MO4', '40.00');
insert into member_total_expenses values ('MO5', '30.00');
insert into member_total_expenses values ('MO6', '40.00');



create table OrderID(
	member_ID nvarchar(50) NOT NULL PRIMARY KEY,
	Foreign Key (member_ID) references Member(member_ID),
	Product_ID nvarchar(50) NOT NULL,
	Foreign Key (Product_ID) references product(Product_ID),
	quantity integer,
	date date,
	delivery_status nvarchar(50),
	total_price decimal(10,2),
);



insert into OrderID values ('MO1', 'P01', '5', '2022-6-23', 'Delivered', '25.00');
insert into OrderID values ('MO2', 'P02', '3', '2022-6-28', 'Delivering', '30.00');
insert into OrderID values ('MO3', 'P06', '2', '2022-3-7', 'Delivered', '100.00');
insert into OrderID values ('MO5', 'P05', '1', '2022-5-12', 'Delivered', '30.00');
insert into OrderID values ('MO6', 'P01', '10', '2022-7-24', 'Delivering', '50.00');



create table Supplier_Invoice(
	Invoice_num integer NOT NULL PRIMARY KEY
	Foreign Key (Invoice_num) references Invoice(Invoice_num),
	Publisher_ID nvarchar(50) NOT NULL,
	Foreign Key (Publisher_ID) references supplier(Publisher_ID),
	Product_ID nvarchar(50) NOT NULL, 
	Foreign Key (Product_ID) references product(Product_ID),
	order_quantity integer,
	pay_amount decimal (10,2),
);



insert into Supplier_Invoice values ('N01', 'S01', '50', '250.00');
insert into Supplier_Invoice values ('N01', 'S01', '60', '600.00');
insert into Supplier_Invoice values (NULL, 'S01', NULL, NULL);
insert into Supplier_Invoice values ('N02', 'S02', '100', '2,500.00');
insert into Supplier_Invoice values ('N02', 'S02', '80', '2,400.00');
insert into Supplier_Invoice values ('N01', 'S03', '90', '4,500.00');
insert into Supplier_Invoice values ('N03', 'S03', '60', '3,900.00');
insert into Supplier_Invoice values ('N03', 'S03', '60', '4,800.00');
insert into Supplier_Invoice values (NULL, 'S04', NULL, NULL);
insert into Supplier_Invoice values ('N02', 'S04', '70', '2,800.00');



create table Supplier_Product(
	Publisher_ID nvarchar(50) NOT NULL PRIMARY KEY,
	Foreign Key (Publisher_ID) references supplier(Publisher_ID),
	Product_ID nvarchar(50) NOT NULL,
	Foreign Key (Product_ID) references product(Product_ID),
	Supply_Quantity integer,
);



insert into Supplier_Product values ('N01', 'S01', '50');
insert into Supplier_Product values ('N01', 'S01', '60');
insert into Supplier_Product values (NULL, 'S01', NULL);
insert into Supplier_Product values ('N02', 'S02', '100');
insert into Supplier_Product values ('N02', 'S02', '80');
insert into Supplier_Product values ('N01', 'S03', '90');
insert into Supplier_Product values ('N03', 'S03', '60');
insert into Supplier_Product values ('N03', 'S03', '60');
insert into Supplier_Product values (NULL, 'S04', NULL);
insert into Supplier_Product values ('N02', 'S04', '70');




