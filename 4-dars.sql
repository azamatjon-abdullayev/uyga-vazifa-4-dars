CREATE TABLE IF NOT EXISTS Avtomobillar(
	avto_id serial primary key not null,
	avto_nomi varchar(100) not null,
	model text,
	yil INTEGER,
	narx numeric(12,2),
	mavjud bool default TRUE
);

insert into avtomobillar(avto_nomi,model,narx)values
('malibu','chevrolet',23000),
('nexia','chevrolet',12000),
('damas','chevrolet',11000);


CREATE TABLE IF NOT EXISTS clientlar(
	client_id serial primary key not null,
	ism varchar(50) not null,
	familiya varchar(50),
	telefon char(13),
	manzil "text"
);

insert into clientlar(first_name,familiya,telefon,manzil)values
('ali','aliyev',23000000,'fargona'),
('vali','valiyev',1200000,'fargona'),
('bali','baliyev',1100000,'fargona');
--------------------------------------------------
create table if not exists buyurtmalar(
	buy_id serial primary key not null,
	avtomobil_id integer not null REFERENCES avtomobillar(avto_id),
	client_id integer not null REFERENCES clientlar(client_id),
	sana date default current_date,
	umumiy_narx numeric(12,2)
);

insert into buyurtmalar(avtomobil_id,client_id,umumiy_narx)values
(1,2,23000),
(1,2,12000),
(2,1,110000);

------------------------------------------------------------------------
create table if not exists xodimlar(
	xodim_id serial primary key not null,
	ism varchar(50) not null ,
	lavozim varchar(50),
	maosh numeric(12,2)
);

insert into xodimlar(ism,lavozim,maosh)values
('ali','ishchi',3000),
('bali','ishchi',2000),
('vali','ishchi',10000);

alter table clientlar
add column email varchar(100) DEFAULT 'toxir@gmail.com';

alter table clientlar
RENAME column ism to first_name ;

alter table clientlar
RENAME to mijozlar;

update xodimlar set ism = 'tohir' where xodim_id = 1;
update xodimlar set ism = 'tohirbek' where xodim_id = 3;

delete from xodimlar where xodim_id = 1;

DROP table if exists Avtomobillar CASCADE;
DROP table if exists clientlar CASCADE;
DROP table if exists buyurtmalar CASCADE;


select * from avtomobillar;
select * from clientlar;
select * from buyurtmalar;
SELECT * from xodimlar;
