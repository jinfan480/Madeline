create table USER (
        USERID integer not null auto_increment,
        USERNAME varchar(255),
        USERPASSWORD varchar(255),
        ROLEID integer,
        ROLENAME varchar(255),
        EMAIL varchar(255),
        PHONE bigint,
        PORTRAIT varchar(255),
        DESCRIPTION varchar(255),
	ISSUBSCRIBED bit,
        primary key (USERID),
	unique(USERNAME)
    );