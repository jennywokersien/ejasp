drop database if exists thport
go

create database thport
go

use thport
go

CREATE TABLE  employee  (
   employeeID  int NOT NULL identity,
   first_name  varchar(255) NOT NULL,
   last_name  varchar(255) NOT NULL
) 
go



-- --------------------------------------------------------

--
-- Table structure for table  history 
--

CREATE TABLE  history  (
   visitor_id  int NOT NULL,
   employeeID  int NOT NULL,
   notes  varchar(255) NOT NULL
) 
go



-- --------------------------------------------------------

--
-- Table structure for table  visitor 
--

CREATE TABLE  visitor  (
   visitor_id  int NOT NULL identity,
   visitor_fname  varchar(50) NOT NULL,
   visitor_lname  varchar(50) NOT NULL,
   visitor_phone  varchar(50) NOT NULL,
   visitor_email  varchar(50) NOT NULL,
   visitor_msg  varchar(200) NOT NULL
) 
go



--
-- Indexes for table  employee 
--
ALTER TABLE  employee 
  ADD PRIMARY KEY ( employeeID );

--
-- Indexes for table  visitor 
--
ALTER TABLE  visitor 
  ADD PRIMARY KEY ( visitor_id );

