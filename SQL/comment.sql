create table COMMENT (
        COMMENTID integer not null auto_increment,
        TITLE varchar(255),
        ISAPPROVED bit,
        USERID integer,
        MEMORYID integer,
        RATING integer,
        CONTENT TEXT,
        PUBLISHDATE DATE,
	    ISDELETED bit,
        primary key (COMMENTID),
	    unique(TITLE)
    );