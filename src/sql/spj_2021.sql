create table if not exists supplier (
    snum    char(5) not null,
    sname    char(20),
    status    int ,
    city    char(15),
    primary key (snum) );
    
create table if not exists part (
    pnum    char(6) not null,
    pname    char(20),
    color    char(6),
    weight    decimal(5,1),
    city    char(15),
    primary key (pnum) );

create table if not exists project (
    jnum    char(4) not null,
    jname    char(20),
    city    char(15),
    primary key (jnum) );
create table if not exists shipment (
    snum    char(5) not null,
    pnum    char(6) not null,
    jnum    char(4) not null,
    qty    int,
    ship_ts    datetime,
    primary key (snum, pnum, jnum),
    foreign key (snum) references supplier (snum),
    foreign key (pnum) references part (pnum),
    foreign key (jnum) references project (jnum) );


insert or ignore into supplier (snum, sname, status, city)
    values    ('S1','Smith',20,'London'),
        ('S2','Jones',10,'Paris'),
        ('S3','Blake',30,'Paris'),
        ('S4','Clark',20,'London'),
        ('S5','Adams',30,'Athens');

insert or ignore into part (pnum, pname, color, weight, city)
    values    ('P1','Nut','Red',12,'London'),
        ('P2','Bolt','Green',17,'Paris'),
        ('P3','Screw','Blue',17,'Rome'),
        ('P4','Screw','Red',14,'London'),
        ('P5','Cam','Blue',12,'Paris'),
        ('P6','Cog','Red',19,'London');
        
insert or ignore into part (pnum, pname, color, weight, city)
    values    ('P7','Glass','Blue',16,'Rome'),
        ('P8','Sensor','Yellow',14,'Paris');

insert or ignore into project (jnum, jname, city)
    values    ('J1','Sorter','Paris'),
        ('J2','Display','Rome'),
        ('J3','OCR','Athens'),
        ('J4','Console','Athens'),
        ('J5','RAID','London'),
        ('J6','EDS','Oslo'),
        ('J7','Tape','London');

insert or ignore into shipment (snum, pnum, jnum, qty, ship_ts)
    values  ('S1','P1','J1','200','2020-02-24 11:10'),
        ('S1','P1','J4','700','2020-02-24 13:30'),
        ('S2','P3','J1','400','2020-02-24 12:15'),
        ('S2','P3','J2','200','2020-02-24 14:40'),
        ('S2','P3','J3','200','2020-02-25 11:55'),
        ('S2','P3','J4','500','2020-02-25 15:00'),
        ('S2','P3','J5','600','2020-02-25 15:20'),
        ('S2','P3','J6','400','2020-02-26 16:30'),
        ('S2','P3','J7','800','2020-02-26 16:45'),
        ('S2','P5','J2','100','2020-02-26 17:50'),
        ('S3','P3','J1','200','2020-02-24 11:35'),
        ('S3','P4','J2','500','2020-02-24 14:15'),
        ('S4','P6','J3','300','2020-02-24 14:05'),
        ('S4','P6','J7','300','2020-02-25 12:55'),
        ('S5','P2','J2','200','2020-02-24 11:45'),
        ('S5','P2','J4','100','2020-02-24 14:40'),
        ('S5','P5','J5','500','2020-02-24 16:50'),
        ('S5','P5','J7','100','2020-02-25 12:05'),
        ('S5','P6','J2','200','2020-02-25 13:00'),
        ('S5','P1','J4','100','2020-02-25 15:50'),
        ('S5','P3','J4','200','2020-02-25 17:25'),
        ('S5','P4','J4','800','2020-02-26 11:55'),
        ('S5','P5','J4','400','2020-02-26 14:40'),
        ('S5','P6','J4','500','2020-02-26 15:25');