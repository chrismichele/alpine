/* 
Author: Christie Trent
Date:   02.18.2021
Notes:  MySQL script to create database and table
Revisions:
- 02.18.2021 - ctrent - Added CREATE DATABASE script
*/

CREATE DATABASE alpine;

USE alpine;

CREATE TABLE users (
    userID int,
    lastName varchar(255),
    firstName varchar(255),
    emailAddress varchar(255)
);
