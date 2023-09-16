DROP DATABASE IF EXISTS BirdFarmShop
CREATE DATABASE BirdFarmShop
GO

USE BirdFarmShop
GO


DROP TABLE IF EXISTS [User]
CREATE TABLE [User]
(
	[username] VARCHAR(20) NOT NULL,
	[password] VARCHAR(50) NOT NULL,
	[full_name] NVARCHAR(50),
	[phone] VARCHAR(15),
	[email] VARCHAR(100),
	[role] VARCHAR(10),
	[address] NVARCHAR(100),
	[point] SMALLINT,
	[register_date] DATE,
	[status] NVARCHAR(20),
	CONSTRAINT PK_Profile PRIMARY KEY ([username]),
	CONSTRAINT CK_Profile_email CHECK([email] LIKE '%[A-Za-z0-9]@[A-Za-z0-9]%.[A-Za-z0-9]%'),
	CONSTRAINT CK_Profile_phone CHECK([phone] LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' 
			OR phone LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
)
GO

DROP TABLE IF EXISTS [Bird]
CREATE TABLE [Bird]
(
	[bird_id] VARCHAR(10) NOT NULL,
	[bird_name] NVARCHAR(30),
	[color] NVARCHAR(20),
	[age] SMALLINT,
	[grown_age] SMALLINT,
	[gender] BIT,
	[breed] NVARCHAR(30),
	[achievement] NVARCHAR(200),
	[reproduction_history] SMALLINT,
	[price] INT,
	[description] NVARCHAR(MAX),
	[dad_bird_id] VARCHAR(10),
	[mom_bird_id] VARCHAR(10),
	[discount] SMALLINT,
	[status] NVARCHAR(20),
	CONSTRAINT PK_Bird PRIMARY KEY ([bird_id]),
	CONSTRAINT FK_Dadbird FOREIGN KEY ([dad_bird_id]) REFERENCES [Bird]([bird_id]),
	CONSTRAINT FK_Mombird FOREIGN KEY ([mom_bird_id]) REFERENCES [Bird]([bird_id])
)
GO

DROP TABLE IF EXISTS [Accessory]
CREATE TABLE [Accessory]
(
	[accessory_id] VARCHAR(10) NOT NULL,
	[accessory_name] NVARCHAR(30),
	[unit_price] INT,
	[stock_quantity] SMALLINT,
	[description] NVARCHAR(MAX),
	[discount] SMALLINT,
	[status] NVARCHAR(20),
	CONSTRAINT PK_Accessory PRIMARY KEY ([accessory_id])
)
GO

DROP TABLE IF EXISTS [Order]
CREATE TABLE [Order]
(
	[order_id] VARCHAR(10) NOT NULL,
	[customer] VARCHAR(20),
	[order_date] DATETIME,
	[order_status] NVARCHAR(20),
	[ship_address] NVARCHAR(50),
	[payment_status] NVARCHAR(20),
	[total_price] INT,
	[applied_point] SMALLINT,
	CONSTRAINT PK_Order PRIMARY KEY ([order_id]),
	CONSTRAINT FK_Order_User FOREIGN KEY ([customer]) REFERENCES [User]([username])
)
GO

DROP TABLE IF EXISTS [BirdPair]
CREATE TABLE [BirdPair]
(
	[pair_id] INT IDENTITY,
	[order_id] VARCHAR(10),
	[service_price] INT,
	[male_bird_id] VARCHAR(10),
	[female_bird_id] VARCHAR(10),
	CONSTRAINT PK_BirdPair PRIMARY KEY ([pair_id]),
	CONSTRAINT FK_BirdPair_Bird_MaleBird FOREIGN KEY ([male_bird_id]) REFERENCES [Bird]([bird_id]),
	CONSTRAINT FK_BirdPair_Bird_FemaleBird FOREIGN KEY ([female_bird_id]) REFERENCES [Bird]([bird_id]),
	CONSTRAINT FK_BirdPair_Order FOREIGN KEY ([order_id]) REFERENCES [Order]([order_id])
)
GO

DROP TABLE IF EXISTS [OrderItem]
CREATE TABLE [OrderItem]
(	
	[order_item_id] INT IDENTITY,
	[order_id] VARCHAR(10),
	[bird_id] VARCHAR(10),
	[accessory_id] VARCHAR(10),
	[unit_price] INT,
	[order_quantity] SMALLINT,
	CONSTRAINT PK_OrderItem PRIMARY KEY ([order_item_id]),
	CONSTRAINT FK_OrderItem_Order FOREIGN KEY ([order_id]) REFERENCES [Order]([order_id]),
	CONSTRAINT FK_OrderItem_Bird FOREIGN KEY ([bird_id]) REFERENCES [Bird]([bird_id]),
	CONSTRAINT FK_OrderItem_Accessory FOREIGN KEY ([accessory_id]) REFERENCES [Accessory]([accessory_id])
)
GO

DROP TABLE IF EXISTS [Feedback]
CREATE TABLE [Feedback]
(
	[feedback_id] INT IDENTITY,
	[customer] VARCHAR(20),
	[order_item_id] INT,
	[rating] SMALLINT,
	[comment] NVARCHAR(100),
	[feedback_date] DATETIME,
	CONSTRAINT PK_Feedback PRIMARY KEY ([feedback_id]),
	CONSTRAINT FK_Feedback_User FOREIGN KEY ([customer]) REFERENCES [User]([username]),
	CONSTRAINT FK_Feedback_OrderItem FOREIGN KEY ([order_item_id]) REFERENCES [OrderItem]([order_item_id])
)
GO

DROP TABLE IF EXISTS [OrderTracking]
CREATE TABLE [OrderTracking]
(
	[tracking_id] INT IDENTITY,
	[order_id] VARCHAR(10),
	[status] NVARCHAR(20),
	[content] NVARCHAR(100),
	CONSTRAINT PK_OrderTracking PRIMARY KEY ([tracking_id]),
	CONSTRAINT FK_OrderTracking_Order FOREIGN KEY ([order_id]) REFERENCES [Order]([order_id])
)
GO

DROP TABLE IF EXISTS [Image]
CREATE TABLE [Image]
(
	[image_id] INT IDENTITY,
	[image_data] VARBINARY(MAX),
	[bird_id] VARCHAR(10),
	[accessory_id] VARCHAR(10),
	CONSTRAINT FK_Image_Bird FOREIGN KEY ([bird_id]) REFERENCES [Bird]([bird_id]),
	CONSTRAINT FK_Image_Accessory FOREIGN KEY ([accessory_id]) REFERENCES [Accessory]([accessory_id])
)
GO


INSERT INTO [Bird] ([bird_id], [bird_name], [color], [age], [grown_age], [gender], [breed], [achievement], [reproduction_history], [price], [description], [dad_bird_id], [mom_bird_id], [discount], [status]) 
VALUES 
	('XT001', N'Vẹt Xích Thái', N'Xanh lá,vàng', 10, 36, 1, N'Vẹt Châu Á', N'Giải 3 Cuộc Thi Vẹt Châu Á Schauwerbung 2023', 
	0, 6500000, 
	N'Xét ở góc độ sinh học, Xích Thái (Vẹt Má Vàng) thuộc nhóm vẹt rừng đuôi dài có viền cổ – Ringneck/Long-tail Parakeets, với 2 đặc trưng của loài: chim trống trưởng thành có đường viền sẫm màu phía sau gáy (ring) và các cá thể chim đều có đuôi rất dài, chiếm khoảng 1/2 tổng chiều dài toàn thân. Xét ở góc độ vật nuôi – Alexandrine Parakeet được coi là loài vẹt khá thân thiện, dễ thuần, sức đề kháng khá tốt, với tuổi thọ có thể đạt đến 30-40 năm.
	Được đánh giá là loài vẹt có khả năng nhại tốt, thực tế chất lượng nhại giọng nói của Vẹt má vàng thua xa chim Nhồng hoặc vẹt xám Châu Phi. Chim bắt chước giọng người không giỏi lắm, đặc biệt khó bắt chước các từ nhiều nguyên âm o, a. Ghi nhận trên thế giới, chỉ một số ít cá thể có thể nhớ và học được đến khoảng 20 từ.',
	NULL, NULL, 0, 'available'),

	('IR001', 'Indian Ringneck', N'Xanh dương', 16, 18, 1, N'Vẹt Châu Á', NULL, 
	1, 9000000, 
	N'Indian Ringneck hay còn gọi là Rose-ringed Parakeets thực sự là những sinh vật kỳ diệu. Thực vậy, chỉ cần nhìn vào những con chim bạn có thể dễ dàng nhận ra chúng qua màu sắc, cái mỏ nổi và long đuôi dài. Cả chim trống và mái đều có đuôi lớn và dài bao gồm 12 lông, 2 lông đuôi lớn chím phần lớn kích thước của con vẹt. Về màu sắc chúng có những màu phổ biến như xanh lá, trắng, vàng, xanh dương. Một số dòng đặc biệt có các màu sắc khá đẹp như xám khói, tím, xanh pastel… Con trống và mái có vẻ ngoài rất giống nhau tuy nhiên những con vẹt trống khi trưởng thành có thể phân biệt bằng vòng đen, trắng hoặc hồng quanh cổ.
	Ringnecks có nguồn gốc từ Châu Á và Châu Phi và có thể được tìm thấy trong các khu rừng hoặc môi trường khô cằn và cũng xa lạ khi có thể thấy chúng tại các khu đô thị như ở California, Florida và cả vương quốc Anh.
	Giống như hầu hết các loài vẹt, ringneck thông minh và làm vật nuôi tốt. Chúng học hỏi khá nhanh và thích thể hiện. Ngoài ra chúng còn có thể nói và phát âm khá rõ, một số con nói khá tốt như các loài vẹt Xám Châu Phi hay Amazon tuy khả năng ghi nhớ về số lượng từ vựng không tốt bằng.',
	NULL, NULL, 5, 'available'),

	('IR002', 'Indian Ringneck', N'Trắng', 10, 18, 0, N'Vẹt Châu Á', N'Giải 2 Cuộc Thi Vẹt Châu Á Australasia 2022', 
	0, 9000000, 
	N'Indian Ringneck hay còn gọi là Rose-ringed Parakeets thực sự là những sinh vật kỳ diệu. Thực vậy, chỉ cần nhìn vào những con chim bạn có thể dễ dàng nhận ra chúng qua màu sắc, cái mỏ nổi và long đuôi dài. Cả chim trống và mái đều có đuôi lớn và dài bao gồm 12 lông, 2 lông đuôi lớn chím phần lớn kích thước của con vẹt. Về màu sắc chúng có những màu phổ biến như xanh lá, trắng, vàng, xanh dương. Một số dòng đặc biệt có các màu sắc khá đẹp như xám khói, tím, xanh pastel… Con trống và mái có vẻ ngoài rất giống nhau tuy nhiên những con vẹt trống khi trưởng thành có thể phân biệt bằng vòng đen, trắng hoặc hồng quanh cổ.
	Ringnecks có nguồn gốc từ Châu Á và Châu Phi và có thể được tìm thấy trong các khu rừng hoặc môi trường khô cằn và cũng xa lạ khi có thể thấy chúng tại các khu đô thị như ở California, Florida và cả vương quốc Anh.
	Giống như hầu hết các loài vẹt, ringneck thông minh và làm vật nuôi tốt. Chúng học hỏi khá nhanh và thích thể hiện. Ngoài ra chúng còn có thể nói và phát âm khá rõ, một số con nói khá tốt như các loài vẹt Xám Châu Phi hay Amazon tuy khả năng ghi nhớ về số lượng từ vựng không tốt bằng.',
	NULL, NULL, 0, 'pairing'),

	('XA001', N'Vẹt Xích Ấn', N'Xanh lá', 5, 18, 1, N'Vẹt Châu Á', NULL, 
	0, 15000000, 
	N'Vẹt xích Ấn – xích Nepal có nguồn gốc từ vùng đông nam châu Á, bao gồm Nepal, Ấn Độ, Pakistan, và Sri Lanka. Chúng thường sống trong các khu rừng, cánh đồng và vùng đồng cỏ.
	Vẹt xích Ấn có một cái mỏ lớn, màu đen và một đốm màu đỏ trên vai. Một đặc điểm nổi bật của chúng là vòng cổ màu đỏ tươi rực, tạo ra sự tương phản đẹp với bộ lông xanh sẫm. Chúng là những vẹt thông minh và thích thể hiện khả năng nói chuyện. Tuy nhiên, khả năng nói chuyện của từng cá thể có thể khác nhau.',
	NULL, NULL, 0, N'pairing'),

	('CP101', N'Vẹt xám', N'Xám', 2, 5, 0, N'Vẹt Châu Phi', N'Chưa có', 0, 
	2500000, NULL, NULL, NULL, 15, N'available'),

    ('CP201', N'Vẹt Cape Parrot', N'Xám, xanh', 3, 4, 1, N'Vẹt Châu Phi', N'Chưa có', 0, 
	3000000, NULL, NULL, NULL, 0, N'available'),

    ('CP301', N'Vẹt Senegal', N'Xanh lá, vàng', 3, 1, 0, N'Vẹt Châu Phi', N'Chưa có', 2, 
	8000000, NULL, NULL, NULL, 0, N'available'),

    ('CP401', N'Vẹt cổ trắng', N'Xanh lá, đỏ', 2, 1, 0, N'Vẹt Châu Phi', N'Chưa có', 1, 
	19000000, NULL, NULL, NULL, 0, N'pairing'),

    ('CP501', N'Vẹt Lovebird', N'Xanh, vàng, cam', 2, 1, 1, N'Vẹt Châu Phi', N'Chưa có', 1, 2000000, NULL, NULL, NULL, 0, N'pairing'),

	('WA301',N'Orange Winged Amazon',N'xanh lá, vàng',2,4,0,N'Vẹt Nam Mỹ Amazon',N'Top 1 hot líu lo',0,3000000,null,null,null,0,N'available'),

	('BA6002',N'Blue-fronted Amazon',N'xanh lá, xanh dương',3,4,0,N'Vẹt Nam Mỹ Amazon',N'Top 1 hot líu lo',null,3000000,null,null,null,0,N'pairing'),

	('FA303',N'Red Faced Amazon',N'xanh lá, đỏ',2,4,0,N'Vẹt Nam Mỹ Amazon',N'Top 1 hot líu lo',null,3000000,null,null,null,0,N'pairing'),

	('HA104',N'Double Yellow Headed Amazon',N'xanh lá, vàng, đỏ',4,4,0,N'Vẹt Nam Mỹ Amazon',N'Top 1 hot líu lo',0,4500000,null,null,null,0,N'available'),

	('NA505',N'Yellow Naped Amazon',N'xanh lá, vàng',5,4,0,N'Vẹt Nam Mỹ Amazon',N'Top 1 hot líu lo',0,9000000,null,null,null,0,N'available'),

	('CL201',N'Cockatiel Lutino',N'xám, vàng, cam',5,2,1,N'Vẹt Châu Úc',NULL,0,2500000,N'Vẹt Cockatiel Lutino nổi bật với lớp lông màu vàng cam ánh hồng, đầu có mảng màu tương tự, mắt đỏ rực, và đuôi dài màu cam. Loài vẹt này thường rất tình cảm, thân thiện, và dễ huấn luyện, làm cho nó trở thành một thú cưng lý tưởng cho người mới nuôi vẹt.',null,null,0,N'available'),

	('CW192',N'Cockatiel White Face',N'xám, trắng',4,2,0,N'Vẹt Châu Úc',NULL,1,3500000,N' Lông trắng mịn, mắt đỏ, không vùng màu cam trên mặt. Tính cách thân thiện, tinh quái. Dễ huấn luyện, thích tương tác.',null,null,0,N'available'),

	('RL391',N'Rainbow Lory',N'đen, đỏ, tím',5,4,0,N'Vẹt Châu Úc',NULL,0,9500000,N'Lông nhiều màu sắc rực rỡ, mỏ cam, tính cách vui vẻ, tươi mới, yêu đời. Yêu thích tương tác và cần chế độ ăn uống đa dạng, hoạt động vui chơi để duy trì sức khỏe tốt và làm phong phú cuộc sống của người nuôi.',null,null,0,N'pairing'),
	
	('RL409', N'Red Lory', N'đỏ', 5, 2, 1, N'Vẹt Châu Úc', NULL, 1, 15000000, N'Lông đỏ tươi sáng, mỏ và mắt đen nổi bật, tính cách hòa đồng, thích hát hò và tương tác, yêu thích ăn uống đa dạng, làm phong phú cuộc sống gia đình bằng niềm vui vẹt.', NULL, NULL, 0, N'pairing'),

	('VE358', N'Vẹt Eclectus', N'Xanh lá', 4, 2, 1, N'Vẹt Châu Úc', NULL, 1, 25000000, N'Vẹt Eclectus là một loài vẹt đa dạng màu sắc, với đực thường có lông màu xanh smaragd và cái có lông màu đỏ tươi. Chúng có mỏ mạnh mẽ và đôi mắt nâu sáng. Eclectus thích tương tác, thông minh và thích học tiếng nói. Tính cách độc lập và thích khám phá, yêu thích chế độ ăn uống chứa nhiều rau quả tươi ngon.', NULL, NULL, 0, N'available')
GO

INSERT INTO [Bird] VALUES ('NA605',N'Yellow Naped Amazon',N'xanh lá, vàng',5,4,0,N'Vẹt Nam Mỹ Amazon',N'Top 1 hot líu lo',0,9000000,null,null,null,0,N'Còn Hàng')
GO

INSERT INTO [Accessory] (accessory_id, accessory_name, unit_price, stock_quantity, description, discount, status) 
VALUES 
	('GT001', N'Găng tay bắt vẹt', 120000, 50, N'Dùng cho việc huấn luyện vẹt, tránh trầy xước hoặc bị đau', 0, 'Available'),
	('GA001', N'Máy ghi âm', 600000, 25, N'Dùng cho việc huấn luyện vẹt nói', 0, 'Available'),
	('CT001', N'Còi huấn luyện vẹt', 90000, 15, N'Huấn luyện trong việc nghe tín hiệu', 0, 'Available'),
	('SU231', N'Sữa tắm vẹt', 80000, 50, N'Loại bỏ mùi hôi, diệt khuẩn, triệt hạ vi trùng.', 0, 'Available'),
	('MV157', N'Muối tắm vẹt', 220000, 30, N'Làm mềm lông, tránh đóng vẩy, giảm stress, làm sạch da lông.', 0, 'Available'),
	('OB356', N'Ống bơm bột', 130000, 50, N'Ống bơm bột cao cấp dành cho vẹt non.', 0, 'Available')


INSERT INTO [dbo].[User]
           ([username],[password],[full_name],[phone],[email],[role],[address],[point],[register_date],[status])
     VALUES
		   ('customer','123','Hung','1234567890','hung@gmail.com','customer','Ha Noi',12,'2023-06-15','active'),
		   ('toan','123','Toan','1234567890','toan@gmail.com','customer','Ha Noi',12,'2023-06-15','active'),
		   ('hoang','123','Hoang','1234567890','hoang@gmail.com','customer','Ha Noi',12,'2023-06-15','active'),
		   ('hai','123','Hai','1234567890','hai@gmail.com','customer','Ha Noi',12,'2023-06-15','active'),
		   ('tu','123','Tu','1234567890','tu@gmail.com','customer','Ha Noi',12,'2023-06-15','inactive'),
		   ('staff','123','staff','1234567890','staff@gmail.com','staff','Ha Noi',12,'2023-06-15','active'),
		   ('staff1','123','staff','1234567890','staff@gmail.com','staff','Ha Noi',12,'2023-06-15','inactive'),
		   ('manager','123','manager','1234567890','manager@gmail.com','manager','Ha Noi',12,'2023-06-15','active'),
		   ('admin','123','admin','1234567890','admin@gmail.com','admin','Ha Noi',12,'2023-06-15','active')
GO

