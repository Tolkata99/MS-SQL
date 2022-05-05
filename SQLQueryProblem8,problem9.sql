
--Problem 8.	Create Table Users
CREATE TABLE [Users2](
[Id] BIGINT PRIMARY KEY IDENTITY(1,1),
[Username] VARCHAR(30) NOT NULL UNIQUE,
[Password] VARCHAR(26) NOT NULL,
[ProfilePicture] VARBINARY(8000),
[LastLoginTime] DATETIME2,
[IsDeleted] BIT)

INSERT INTO [Users2] ([Username],[Password],[ProfilePicture],[LastLoginTime],[IsDeleted])
VALUES
(
'yuyuy','hjhjh1',NULL,1989-02-08,'true',
'yuyuy','hjhjh1',NULL,1989-02-08,'true',
'yuyuy','hjhjh1',NULL,1989-02-08,'true',
'yuyuy','hjhjh1',NULL,1989-02-08,'true',
'yuyuy','hjhjh1',NULL,1989-02-08,'true'
)

--Problem 9.	Change Primary Key


ALTER TABLE [Users2]
DROP CONSTRAINT [PK__Users2__3214EC075507DB7C]

ALTER TABLE [Users2]
ADD CONSTRAINT [PK_UsersCompositeIdUsername] PRIMARY KEY ([Id],[Username])