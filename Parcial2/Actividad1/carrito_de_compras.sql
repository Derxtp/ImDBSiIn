CREATE TABLE Carrito_1( 
id int(13) NOT NULL,
Azucar varchar(13) NOT NULL, 
pan varchar(13) NOT NULL,
jugo varchar(13) NOT NULL,
refresco varchar(13) NOT NULL,
Harina varchar(13) NOT NULL
PRIMARY KEY (id,Azucar)
);
CREATE TABLE Carrito_2(
id int(13) NOT NULL,
Azucar varchar(13) NOT NULL, 
pan varchar(13) NOT NULL,
Mantequilla varchar(13) NOT NULL,
Queso varchar(13) NOT NULL,
Manzana  varchar(13) NOT NULL
PRIMARY KEY (id,pan)
);


CREATE TABLE Carrito_1(
    Articulo VARCHAR(30) NOT NULL
);

CREATE TABLE Carrito_2(
    Articulo VARCHAR(30) NOT NULL
);


INSERT INTO Carrito_1 (Articulo) VALUES
('Azucar'),
('Pan'),
('jugo'),
('refresco'),
('Harina');

SELECT * from Carrito_1 INSERT join on ID=Carrito_1.AUTHORID;

SELECT * from Carrito_2 INSERT join on ID=Carrito_2.AUTHORID;

select * from Carrito_1 left join Carrito_2 on Carrito_1.Articulo = Carrito_2.Articulo
UNION 
select * from Carrito_1 right join Carrito_2 on Carrito_1.Articulo = Carrito_2.Articulo;



