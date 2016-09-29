create table ROOM (
        ROOMID integer not null auto_increment,
        ROOMNUM integer,
        FLOORID integer,
        ROOMNAME varchar(255),
        ROOMINFO TEXT,
        primary key (ROOMID),
		unique(ROOMNUM)
    );