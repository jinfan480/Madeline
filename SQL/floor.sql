create table FLOOR (
        FLOORID integer not null auto_increment,
        FLOORNUM integer,
        FLOORDESCRIPT TEXT,
        primary key (FLOORID),
		unique(FLOORNUM)
    );