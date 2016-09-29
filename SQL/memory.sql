create table MEMORY (
        MEMORYID integer not null auto_increment,
        TITLE varchar(255),
        ISAPPROVED bit,
        USERID integer,
        ROOMID integer,
        CONTENT TEXT,
        PICTURE varchar(255),
        AUDIO varchar(255),
        VIDEO varchar(255),
        AVRRATING float,
        PUBLISHDATE DATE,
	    ISDELETED bit,
        primary key (MEMORYID),
	    unique(TITLE)
    );