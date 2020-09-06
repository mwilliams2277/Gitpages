DROP TABLE IF EXISTS member;
DROP TABLE IF EXISTS question;
DROP TABLE IF EXISTS degree;
DROP TABLE IF EXISTS course;
DROP TABLE IF EXISTS memberCourse;
DROP TABLE IF EXISTS student;
DROP TABLE IF EXISTS staff;



-- change user to member or something, same with password and admin
CREATE TABLE member (
    memberID    INTEGER         PRIMARY KEY AUTOINCREMENT,
    firstName   VARCHAR(50)     NOT NULL,
    lastName    VARCHAR(25)     NOT NULL,
    pword    VARCHAR(20)     NOT NULL,
    degreeID    INTEGER NULL    REFERENCES degree(degreeID),
    phNumber    VARCHAR(20),
    email       VARCHAR(200)    UNIQUE  NOT NULL    
);

CREATE TABLE student(
    studentID   CHAR(8) UNIQUE  NOT NULL
);

CREATE TABLE staff (
    staffID     CHAR(6) UNIQUE  NOT NULL,
    isAdmin    INTEGER         DEFAULT 0
);

CREATE TABLE degree (
    degreeID   INTEGER         PRIMARY KEY AUTOINCREMENT,
    degreeName  VARCHAR(100)   UNIQUE
);

CREATE TABLE course (
    courseID   INTEGER         PRIMARY KEY AUTOINCREMENT,
    degreeID   INTEGER         NULL        REFERENCES degree(degreeID),
    courseName  VARCHAR(100)   UNIQUE
);
-- add completed/enrolled 
CREATE TABLE memberCourse (
    memberID      INTEGER       NOT NULL,
    courseID    INTEGER         NOT NULL,
    PRIMARY KEY (memberID, courseID),
    FOREIGN KEY (memberID)      REFERENCES member(memberID),
    FOREIGN KEY (courseID)      REFERENCES course(courseID)
);

CREATE TABLE question(
    questionID  INTEGER         PRIMARY KEY AUTOINCREMENT,
    authorID    INTEGER         NOT NULL,
    created     TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    title       VARCHAR(25)     NOT NULL,
    body        VARCHAR(250)    NOT NULL,
    FOREIGN KEY (authorID)     REFERENCES member(memberID)
);