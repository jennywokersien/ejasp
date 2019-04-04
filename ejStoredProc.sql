USE [evajones]
GO
drop procedure if exists sp_ins_visitor
go
create procedure sp_ins_visitor
@visitor_name nchar(50),
@visitor_email nchar(50),
@visitor_msg nchar(200)
as
INSERT INTO [dbo].[visitor]
           ([visitor_name]
           ,[visitor_email]
           ,[visitor_msg])
     VALUES
           (@visitor_name
           ,@visitor_email
           ,@visitor_msg)
GO

exec sp_ins_visitor 'Bob', 'bob@me.com', 'this is funner!'

CREATE LOGIN [EJApp] WITH PASSWORD='Pa$$w0rd', DEFAULT_DATABASE=[evajones]
go
use evajones --your dbname here
go
CREATE USER [EJApp] FOR LOGIN [EJApp] WITH DEFAULT_SCHEMA=[dbo] 
GO
grant execute on sp_ins_visitor to EJApp
go



