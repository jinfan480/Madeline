create table ARTEFACT (
        ARTEFACTID integer not null auto_increment,
        TITLE varchar(255),
        ISOLD bit,
        ROOMID integer,
        CONTENT TEXT,
        PICTURE varchar(255),
        AUDIO varchar(255),
        VIDEO varchar(255),
	    ISDELETED bit,
        primary key (ARTEFACTID),
	    unique(TITLE)
    );