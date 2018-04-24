###################################################
#  Initialize a database using Spring JDBC
###################################################
;

DROP TABLE IF EXISTS USER;

CREATE TABLE USER
  (
    userid      VARCHAR(255) NOT NULL,
    displayname VARCHAR(255),
    email       VARCHAR(255),
    firstname   VARCHAR(255),
    id          INTEGER,
    lastname    VARCHAR(255),
    name        VARCHAR(255),
    role        VARCHAR(255),
    createdid   VARCHAR(255),
    created     DATETIME,
    updatedid   VARCHAR(255),
    updated     DATETIME,
    PRIMARY KEY (userid)
  );

DROP TABLE IF EXISTS SAMPLE;

CREATE TABLE SAMPLE
(
    id            INTEGER  NOT NULL,
    strcol1       VARCHAR(255),
    strcol2       VARCHAR(255),
    strcol3       VARCHAR(255),
    strcol4       VARCHAR(255),
    strcol5       VARCHAR(255),
    intcol1       INTEGER,
    intcol2       INTEGER,
    datecol1      DATE,
    datetimecol1  DATETIME,
    createdid     VARCHAR(255),
    created     DATETIME,
    updatedid   VARCHAR(255),
    updated     DATETIME,
    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS DATA_DAY;

CREATE TABLE DATA_DAY
(
    statistic_date          VARCHAR(8)  NOT NULL,
    statistic1    LONG,
    statistic2    LONG,
    statistic3    LONG,
    statistic4    LONG,
    statistic5    LONG,
    created_id     VARCHAR(255),
    created       DATETIME,
    updated_id     VARCHAR(255),
    updated       DATETIME,
    PRIMARY KEY (statistic_date)
);
