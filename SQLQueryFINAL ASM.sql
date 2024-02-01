create table Product(
	product_ID nvarchar(50) NOT NULL PRIMARY KEY,
	product_name nvarchar(50),
	product_price decimal(10,2),
);



insert into Product values ('P01', 'Pencil', '5.00');
insert into Product values ('P02', 'Pen', '10.00');
insert into Product values ('P03', 'Marker Pen', '20.00');
insert into Product values ('P04', 'Clothe', '25.00');
insert into Product values ('P05', 'Pant', '30.00');
insert into Product values ('P06', 'Bookshelf', '50.00');
insert into Product values ('P07', 'Table', '65.00');
insert into Product values ('P08', 'Chair', '80.00');
insert into Product values ('P09', 'Handsaw', '30.00');
insert into Product values ('P10', 'Hammer', '40.00');



create table Member(
	member_ID nvarchar(50) NOT NULL PRIMARY KEY,
	member_name nvarchar(50),
	address nvarchar(50),
	gender nvarchar (50),
	contact_num nvarchar(50),
	num_of_feedback integer,
);



insert into Member values ('MO1', 'Ali', '53-49, Taman Bukit Serdang', 'M', '011-2345', '2');
insert into Member values ('MO2', 'Muthu', 'No.11, Bandar Sungai Long', 'M', '012-4567', '3');
insert into Member values ('MO3', 'Abu', '21-B5, Bukit Jalil', 'M', '013-1234', '1');
insert into Member values ('MO4', 'Jack', 'No. 12, Lebuhraya Bukit Jalil', 'M', '012-8870', '4');
insert into Member values ('MO5', 'Lee', '66, Taman Oversea', 'F', '016-3055', '2');
insert into Member values ('MO6', 'Debb', '22, Taman Imbi', 'F', '019-6660', '3');



create table Supplier(
	publisher_ID nvarchar(50) NOT NULL PRIMARY KEY,
	product_ID nvarchar(50) NOT NULL,
	Foreign Key (product_ID) references Product(product_ID),
	supplier_name nvarchar(50),
	supplier_address nvarchar(50),
);



insert into Supplier values ('S01', 'P01', 'AB Sdn.Bhd.', 'No. 46, Jalan Puteri');
insert into Supplier values ('S02', 'P05', 'EF Sdn.Bhd.', '42-44, Jalan TUDM');
insert into Supplier values ('S03', 'P06', 'JK Sdn.Bhd.', '1, Jalan TPP20');
insert into Supplier values ('S04', 'P10', 'YZ Sdn.Bhd.', '19G, Jalan Apollo');



create table Invoice(
	invoice_num nvarchar(50) NOT NULL PRIMARY KEY, 
	invoice_date date,
);



insert into Invoice values ('N01', '2022-2-5');
insert into Invoice values ('N02', '2022-3-6');
insert into Invoice values ('N03', '2022-4-7');



create table Stock_Count(
	product_ID nvarchar(50) NOT NULL PRIMARY KEY,
	Foreign Key (product_ID) references Product(product_ID),
	stock_quantity integer,

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
	product_ID nvarchar(50) NOT NULL PRIMARY KEY,
	Foreign Key (product_ID) references Product(product_ID),
	rating integer,
	num_of_comment integer,
);



insert into Product_Rating values ('P01', '3', '20');
insert into Product_Rating values ('P02', '4', '25');
insert into Product_Rating values ('P04', '5', '15');
insert into Product_Rating values ('P05', '2', '20');
insert into Product_Rating values ('P06', '5', '10');
insert into Product_Rating values ('P07', '3', '10');
insert into Product_Rating values ('P08', '3', '15');
insert into Product_Rating values ('P10', '4', '5');



create table Member_total_expenses(
	member_ID nvarchar(50) NOT NULL PRIMARY KEY,
	Foreign Key (member_ID) references Member(member_ID),
	total_expenses decimal(10,2),
);



insert into Member_total_expenses values ('MO1', '110.00');
insert into Member_total_expenses values ('MO2', '200.00');
insert into Member_total_expenses values ('MO3', '150.00');
insert into Member_total_expenses values ('MO4', '40.00');
insert into Member_total_expenses values ('MO5', '30.00');
insert into Member_total_expenses values ('MO6', '40.00');



create table Member_order(
	member_ID nvarchar(50) NOT NULL PRIMARY KEY,
	Foreign Key (member_ID) references Member(member_ID),
	product_ID nvarchar(50) NOT NULL,
	Foreign Key (product_ID) references Product(product_ID),
	quantity integer,
	date date,
	delivery_status nvarchar(50),
	total_price decimal(10,2),
);



insert into Member_order values ('MO1', 'P01', '5', '2022-6-23', 'Delivered', '25.00');
insert into Member_order values ('MO2', 'P02', '3', '2022-6-28', 'Delivering', '30.00');
insert into Member_order values ('MO3', 'P06', '2', '2022-3-7', 'Delivered', '100.00');
insert into Member_order values ('MO5', 'P05', '1', '2022-5-12', 'Delivered', '30.00');
insert into Member_order values ('MO6', 'P01', '10', '2022-7-24', 'Delivering', '50.00');



create table Supplier_invoice(
	invoice_num nvarchar(50) NOT NULL,
	Foreign Key (invoice_num) references Invoice(invoice_num),
	publisher_ID nvarchar(50),
	Foreign Key (publisher_ID) references Supplier(publisher_ID),
	product_ID nvarchar(50), 
	Foreign Key (product_ID) references Product(product_ID),
	order_quantity integer,
	pay_amount decimal (10,2),
);



insert into Supplier_invoice values ('N01', 'S01', 'P01', '50', '250.00');
insert into Supplier_invoice values ('N01', 'S01', 'P02', '60', '600.00');
insert into Supplier_invoice values ('N02', 'S02', 'P04', '100', '2500.00');
insert into Supplier_invoice values ('N02', 'S02', 'P05', '80', '2400.00');
insert into Supplier_invoice values ('N01', 'S03', 'P06', '90', '4500.00');
insert into Supplier_invoice values ('N03', 'S03', 'P07', '60', '3900.00');
insert into Supplier_invoice values ('N03', 'S03', 'P08', '60', '4800.00');
insert into Supplier_invoice values ('N02', 'S04', 'P10', '70', '2800.00');



create table Supplier_product(
	publisher_ID nvarchar(50) NOT NULL,
	Foreign Key (publisher_ID) references Supplier(publisher_ID),
	product_ID nvarchar(50) NOT NULL,
	Foreign Key (product_ID) references Product(product_ID),
	Supply_Quantity integer,
);



insert into Supplier_product values ('S01', 'P01', '50');
insert into Supplier_product values ('S01', 'P02', '60');
insert into Supplier_product values ('S01', 'P03', '80');
insert into Supplier_product values ('S02', 'P04', '100');
insert into Supplier_product values ('S02', 'P05', '80');
insert into Supplier_product values ('S03', 'P06', '90');
insert into Supplier_product values ('S03', 'P07', '60');
insert into Supplier_product values ('S03', 'P08', '60');
insert into Supplier_product values ('S04', 'P09', '40');
insert into Supplier_product values ('S04', 'P10', '70');

