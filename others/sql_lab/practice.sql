CREATE TABLE STUDENT_TB
 (
 Roll_No int primary key,
 UserName varchar(50),
 UserAddress varchar(50),
 City varchar(50),
 Phone varchar(15),
 Email varchar(50),
 Age int,
 )

INSERT INTO Users VALUES (1001, 'Arnav', 'Scotland', 'FCB', '01944-369967', 'arnavs@hotmail.com', 20)
INSERT INTO Users VALUES (1002, 'Sohan', 'Kenya', 'ACB', '565636357', 'sohan@hotmail.com', 21)
INSERT INTO Users VALUES (1003, 'Umang', 'Kerala', 'TCB', '4746874', 'umang@hotmail.com', 19)
INSERT INTO Users VALUES (1004, 'Aryan', 'Spain', 'HCB', '4878558474', 'yoyo@hotmail.com', 18)
INSERT INTO Users VALUES (1005, 'Ralph', 'England', 'FCB', '487854747', 'honeys@hotmail.com', 17)
INSERT INTO Users VALUES (1006, 'Jayaditya', 'Pakistan', 'DCB', '487547479807', 'feinfein@hotmail.com', 70)
INSERT INTO Users VALUES (1007, 'Aditya', 'Italy', 'GCB', '078667647895', 'yessir@hotmail.com', 78)
INSERT INTO Users VALUES (1008, 'Albert', 'Gaza', 'UCB', '6876894', 'antimo@hotmail.com', 22)
INSERT INTO Users VALUES (1009, 'Kris', 'Israel', 'ACB', '4859805337', 'chrisis@hotmail.com', 34)
INSERT INTO Users VALUES (1010, 'Shubham', 'Puroshottam', 'ECB', '48989098754367', 'yods@hotmail.com', 20)
INSERT INTO Users VALUES (1011, 'Anirudh', 'Chennai', 'RCB', '57687855', 'shgsg@hotmail.com', 21)
INSERT INTO Users VALUES (1012, 'Sri', 'Mexico', 'XCB', '79686-0976', 'sgthrts@hotmail.com', 22)
INSERT INTO Users VALUES (1013, 'Sais', 'Canada', 'YCB', '48898076', 'stgsgt@hotmail.com', 21)
INSERT INTO Users VALUES (1014, 'Robert', 'Japan', 'ZCB', '590', 'stgtss@hotmail.com', 22)
INSERT INTO Users VALUES (1015, 'Jon', 'Indonesia', 'SCB', '01944-369967', '6ur5fdjh@hotmail.com', 21)
INSERT INTO Users VALUES (1016, 'Snow', 'Uganda', 'ACB', '01944-369967', 'nfyyf@hotmail.com', 21)
INSERT INTO Users VALUES (1017, 'Cilian', 'Siu', 'QCB', '01944-369967', 'fyjtft@hotmail.com', 22)
INSERT INTO Users VALUES (1018, 'Chris', 'Siuu', 'TCB', '01944-369967', 'dhytjt@hotmail.com', 21)
INSERT INTO Users VALUES (1019, 'Sebashish', 'Africa', 'FCB', '01944-369967', 'ydhy@hotmail.com', 24)
INSERT INTO Users VALUES (1020, 'Kenya', 'Russia', 'FCB', '01944-369967', 'dthtdt@hotmail.com', 45)

Delete from Users
where ID > 1018 and ID < 1200

Delete from Users
where City = 'UCB' or City = 'OCB'