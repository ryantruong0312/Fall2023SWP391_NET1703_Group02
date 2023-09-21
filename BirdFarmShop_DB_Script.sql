USE master
GO

DROP DATABASE IF EXISTS BirdFarmShop
CREATE DATABASE BirdFarmShop
GO

USE BirdFarmShop
GO


DROP TABLE IF EXISTS [User]
CREATE TABLE [User]
(
	[username] VARCHAR(25) NOT NULL,
	[password] VARCHAR(150),
	[full_name] NVARCHAR(50),
	[phone] VARCHAR(15),
	[email] VARCHAR(100),
	[role] VARCHAR(10),
	[address] NVARCHAR(100),
	[point] SMALLINT,
	[register_date] DATE,
	[login_by] VARCHAR(10),
	[status] NVARCHAR(20),
	CONSTRAINT PK_Profile PRIMARY KEY ([username]),
)
GO

DROP TABLE IF EXISTS [BirdBreed]
CREATE TABLE [BirdBreed]
(	
	[breed_id] VARCHAR(10),
	[breed_name] NVARCHAR(50),
	[breed_thumbnail] VARCHAR(MAX),
	CONSTRAINT PK_BirdBreed PRIMARY KEY ([breed_id])
)
GO

DROP TABLE IF EXISTS [Bird]
CREATE TABLE [Bird]
(
	[bird_id] VARCHAR(10) NOT NULL,
	[bird_name] NVARCHAR(50),
	[color] NVARCHAR(50),
	[age] SMALLINT,
	[grown_age] SMALLINT,
	[gender] BIT,
	[breed_id] VARCHAR(10),
	[achievement] NVARCHAR(200),
	[reproduction_history] SMALLINT,
	[price] INT,
	[description] NVARCHAR(MAX),
	[dad_bird_id] VARCHAR(10),
	[mom_bird_id] VARCHAR(10),
	[discount] SMALLINT,
	[status] NVARCHAR(20),
	CONSTRAINT PK_Bird PRIMARY KEY ([bird_id]),
	CONSTRAINT FK_Bird_BirdBreed FOREIGN KEY ([breed_id]) REFERENCES [BirdBreed]([breed_id]),
	CONSTRAINT FK_Dadbird FOREIGN KEY ([dad_bird_id]) REFERENCES [Bird]([bird_id]),
	CONSTRAINT FK_Mombird FOREIGN KEY ([mom_bird_id]) REFERENCES [Bird]([bird_id])
)
GO

DROP TABLE IF EXISTS [Accessory]
CREATE TABLE [Accessory]
(
	[accessory_id] VARCHAR(10) NOT NULL,
	[accessory_name] NVARCHAR(50),
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
	[customer] VARCHAR(25),
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
	[customer] VARCHAR(25),
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

DROP TABLE IF EXISTS [BirdNest]
CREATE TABLE [BirdNest]
(
	[nest_id] INT IDENTITY,
	[nest_name] NVARCHAR(50),
	[is_thumbnail] BIT,
	[dad_bird_id] VARCHAR(10),
	[mom_bird_id] VARCHAR(10),
	[baby_quantity] SMALLINT,
	[status] NVARCHAR(20),
	[price] INT,
	[description] NVARCHAR(MAX),
	CONSTRAINT PK_BirdNest PRIMARY KEY ([nest_id]),
	CONSTRAINT FK_BirdNest_Bird_dadbird FOREIGN KEY ([dad_bird_id]) REFERENCES [Bird]([bird_id]),
	CONSTRAINT FK_BirdNest_Bird_mombird FOREIGN KEY ([mom_bird_id]) REFERENCES [Bird]([bird_id])
)
GO

DROP TABLE IF EXISTS [Image]
CREATE TABLE [Image]
(
	[image_id] INT IDENTITY,
	[image_url] VARCHAR(MAX),
	[is_thumbnail] BIT,
	[bird_id] VARCHAR(10),
	[nest_id] INT,
	[accessory_id] VARCHAR(10),
	CONSTRAINT FK_Image_Bird FOREIGN KEY ([bird_id]) REFERENCES [Bird]([bird_id]),
	CONSTRAINT FK_Image_Accessory FOREIGN KEY ([accessory_id]) REFERENCES [Accessory]([accessory_id]),
	CONSTRAINT FK_Image_BirdNest FOREIGN KEY ([nest_id]) REFERENCES [BirdNest]([nest_id])
)
GO


INSERT INTO [BirdBreed] ([breed_id],[breed_name],[breed_thumbnail])
VALUES
	('australian', N'Vẹt Châu Úc', 'https://runghoangda.com/wp-content/uploads/2022/06/vet-cockatoo-gia-bao-nhieu-6.jpg'),
	('asian', N'Vẹt Châu Á', 'https://bizweb.dktcdn.net/100/326/708/files/top-8-loai-vet-mau-xanh-lam-5.jpg?v=1613884133577'),
	('african', N'Vẹt Châu Phi', 'https://petmeshop.com/wp-content/uploads/2020/09/Vet-African-Grey-2.jpg'),
	('amazon', N'Vẹt Nam Mỹ/Amazon', 'https://bizweb.dktcdn.net/100/326/708/files/blue-fronted-amazon-1-6bde88b3-11f7-49c7-8afb-4535ab69af5e.jpg?v=1614651669559'),
	('hybrid', N'Vẹt Lai', 'https://media-cache-ec0.pinimg.com/736x/c9/20/4e/c9204e17e221732fe0e981c2f9cedc6d.jpg'),
	('macaw', N'Vẹt Nam Mỹ/Macaw', 'https://runghoangda.com/wp-content/uploads/2022/06/vet-cockatoo-gia-bao-nhieu-6.jpg')
GO

INSERT INTO [Bird] ([bird_id], [bird_name], [color], [age], [grown_age], [gender], [breed_id], [achievement], [reproduction_history], [price], [description], [dad_bird_id], [mom_bird_id], [discount], [status]) 
VALUES 
	('XT001', N'Vẹt Xích Thái', N'Xanh lá,vàng', 10, 36, 1, 'asian', N'Giải 3 Cuộc Thi Vẹt Châu Á Schauwerbung 2023', 
	0, 6500000, 
	N'Xét ở góc độ sinh học, Xích Thái (Vẹt Má Vàng) thuộc nhóm vẹt rừng đuôi dài có viền cổ – Ringneck/Long-tail Parakeets, với 2 đặc trưng của loài: chim trống trưởng thành có đường viền sẫm màu phía sau gáy (ring) và các cá thể chim đều có đuôi rất dài, chiếm khoảng 1/2 tổng chiều dài toàn thân. Xét ở góc độ vật nuôi – Alexandrine Parakeet được coi là loài vẹt khá thân thiện, dễ thuần, sức đề kháng khá tốt, với tuổi thọ có thể đạt đến 30-40 năm.
	Được đánh giá là loài vẹt có khả năng nhại tốt, thực tế chất lượng nhại giọng nói của Vẹt má vàng thua xa chim Nhồng hoặc vẹt xám Châu Phi. Chim bắt chước giọng người không giỏi lắm, đặc biệt khó bắt chước các từ nhiều nguyên âm o, a. Ghi nhận trên thế giới, chỉ một số ít cá thể có thể nhớ và học được đến khoảng 20 từ.',
	NULL, NULL, 0, 'available'),

	('IR001', 'Indian Ringneck', N'Xanh dương', 16, 18, 1, 'asian', N'Chưa có', 
	1, 9000000, 
	N'Indian Ringneck hay còn gọi là Rose-ringed Parakeets thực sự là những sinh vật kỳ diệu. Thực vậy, chỉ cần nhìn vào những con chim bạn có thể dễ dàng nhận ra chúng qua màu sắc, cái mỏ nổi và long đuôi dài. Cả chim trống và mái đều có đuôi lớn và dài bao gồm 12 lông, 2 lông đuôi lớn chím phần lớn kích thước của con vẹt. Về màu sắc chúng có những màu phổ biến như xanh lá, trắng, vàng, xanh dương. Một số dòng đặc biệt có các màu sắc khá đẹp như xám khói, tím, xanh pastel… Con trống và mái có vẻ ngoài rất giống nhau tuy nhiên những con vẹt trống khi trưởng thành có thể phân biệt bằng vòng đen, trắng hoặc hồng quanh cổ.
	Ringnecks có nguồn gốc từ Châu Á và Châu Phi và có thể được tìm thấy trong các khu rừng hoặc môi trường khô cằn và cũng xa lạ khi có thể thấy chúng tại các khu đô thị như ở California, Florida và cả vương quốc Anh.
	Giống như hầu hết các loài vẹt, ringneck thông minh và làm vật nuôi tốt. Chúng học hỏi khá nhanh và thích thể hiện. Ngoài ra chúng còn có thể nói và phát âm khá rõ, một số con nói khá tốt như các loài vẹt Xám Châu Phi hay Amazon tuy khả năng ghi nhớ về số lượng từ vựng không tốt bằng.',
	NULL, NULL, 5, 'available'),

	('IR002', 'Indian Ringneck', N'Trắng', 10, 18, 0, 'asian', N'Giải 2 Cuộc Thi Vẹt Châu Á Australasia 2022', 
	0, 9000000, 
	N'Indian Ringneck hay còn gọi là Rose-ringed Parakeets thực sự là những sinh vật kỳ diệu. Thực vậy, chỉ cần nhìn vào những con chim bạn có thể dễ dàng nhận ra chúng qua màu sắc, cái mỏ nổi và long đuôi dài. Cả chim trống và mái đều có đuôi lớn và dài bao gồm 12 lông, 2 lông đuôi lớn chím phần lớn kích thước của con vẹt. Về màu sắc chúng có những màu phổ biến như xanh lá, trắng, vàng, xanh dương. Một số dòng đặc biệt có các màu sắc khá đẹp như xám khói, tím, xanh pastel… Con trống và mái có vẻ ngoài rất giống nhau tuy nhiên những con vẹt trống khi trưởng thành có thể phân biệt bằng vòng đen, trắng hoặc hồng quanh cổ.
	Ringnecks có nguồn gốc từ Châu Á và Châu Phi và có thể được tìm thấy trong các khu rừng hoặc môi trường khô cằn và cũng xa lạ khi có thể thấy chúng tại các khu đô thị như ở California, Florida và cả vương quốc Anh.
	Giống như hầu hết các loài vẹt, ringneck thông minh và làm vật nuôi tốt. Chúng học hỏi khá nhanh và thích thể hiện. Ngoài ra chúng còn có thể nói và phát âm khá rõ, một số con nói khá tốt như các loài vẹt Xám Châu Phi hay Amazon tuy khả năng ghi nhớ về số lượng từ vựng không tốt bằng.',
	NULL, NULL, 0, 'pairing'),

	('XA001', N'Vẹt Xích Ấn', N'Xanh lá', 5, 18, 1, 'asian', N'Chưa có', 
	0, 15000000, 
	N'Vẹt xích Ấn – xích Nepal có nguồn gốc từ vùng đông nam châu Á, bao gồm Nepal, Ấn Độ, Pakistan, và Sri Lanka. Chúng thường sống trong các khu rừng, cánh đồng và vùng đồng cỏ.
	Vẹt xích Ấn có một cái mỏ lớn, màu đen và một đốm màu đỏ trên vai. Một đặc điểm nổi bật của chúng là vòng cổ màu đỏ tươi rực, tạo ra sự tương phản đẹp với bộ lông xanh sẫm. Chúng là những vẹt thông minh và thích thể hiện khả năng nói chuyện. Tuy nhiên, khả năng nói chuyện của từng cá thể có thể khác nhau.',
	NULL, NULL, 0, 'pairing'),

	('CP101', N'Vẹt xám', N'Xám', 2, 5, 0, 'african', N'Chưa có', 0, 
	2500000, 
	NULL, 
	NULL, NULL, 15, 'available'),

    ('CP201', N'Vẹt Cape Parrot', N'Xám, xanh', 3, 4, 1, 'african', N'Chưa có', 0, 
	3000000, NULL, 
	NULL, NULL, 0, 'pairing'),

    ('CP301', N'Vẹt Senegal', N'Xanh lá, vàng', 3, 1, 0, 'african', N'Chưa có', 2, 
	8000000, 
	NULL, 
	NULL, NULL, 0, 'available'),

    ('CP401', N'Vẹt cổ trắng', N'Xanh lá, đỏ', 2, 1, 0, 'african', N'Chưa có', 1, 
	19000000, 
	NULL, 
	NULL, NULL, 0, 'reproducing'),

    ('CP501', N'Vẹt Lovebird', N'Xanh, vàng, cam', 2, 1, 1, 'african', N'Chưa có', 1, 2000000, 
    NULL, 
    NULL, NULL, 0, 'reproducing'),

	('WA301', N'Vẹt Orange Winged Amazon', N'xanh lá, vàng', 2, 4, 0, 'amazon', N'Top 1 hot líu lo', 0, 3000000, 
	NULL, 
	NULL, NULL, 0, 'available'),

	('BA6002', N'Vẹt Blue-fronted Amazon', N'xanh lá, xanh dương', 3, 4, 0, 'amazon', N'Top 1 hot líu lo', 0, 3000000, 
	NULL, 
	NULL, NULL, 0, 'available'),

	('FA303', N'Vẹt Red Faced Amazon', N'xanh lá, đỏ', 2, 4, 0, 'amazon', N'Top 1 hot líu lo', 0, 3000000,
	NULL, 
	NULL, NULL, 0, 'available'),

	('HA104', N'Vẹt Double Yellow Headed Amazon', N'xanh lá, vàng, đỏ', 4, 4, 0, 'amazon', N'Top 1 hot líu lo', 0, 4500000,
	NULL, 
	NULL, NULL, 0, 'available'),

	('NA505', N'Vẹt Yellow Naped Amazon',N'xanh lá, vàng', 5, 4, 0, 'amazon', N'Top 1 hot líu lo', 0, 9000000,
	NULL, 
	NULL, NULL, 0, 'sold'),

	('CL201', N'Vẹt Cockatiel Lutino', N'xám, vàng, cam', 5, 2, 1, 'australian', N'Chưa có', 0, 2500000,
	N'Vẹt Cockatiel Lutino nổi bật với lớp lông màu vàng cam ánh hồng, đầu có mảng màu tương tự, mắt đỏ rực, và đuôi dài màu cam. Loài vẹt này thường rất tình cảm, thân thiện, và dễ huấn luyện, làm cho nó trở thành một thú cưng lý tưởng cho người mới nuôi vẹt.',
	NULL, NULL, 0, 'available'),

	('CW192', N'Vẹt Cockatiel White Face', N'xám, trắng', 4, 2, 0, 'australian', N'Chưa có', 1, 3500000,
	N'Lông trắng mịn, mắt đỏ, không vùng màu cam trên mặt. Tính cách thân thiện, tinh quái. Dễ huấn luyện, thích tương tác.',
	NULL, NULL, 0, 'available'),

	('RL391', N'Vẹt Rainbow Lory', N'đen, đỏ, tím, xanh lá, vàng', 5, 4, 0, 'australian', N'Chưa có', 0, 9500000,
	N'Lông nhiều màu sắc rực rỡ, mỏ cam, tính cách vui vẻ, tươi mới, yêu đời. Yêu thích tương tác và cần chế độ ăn uống đa dạng, hoạt động vui chơi để duy trì sức khỏe tốt và làm phong phú cuộc sống của người nuôi.',
	NULL, NULL, 0, N'pairing'),
	
	('RL409', N'Vẹt Red Lory', N'đỏ', 5, 2, 1, 'australian', NULL, 1, 15000000, 
	N'Lông đỏ tươi sáng, mỏ và mắt đen nổi bật, tính cách hòa đồng, thích hát hò và tương tác, yêu thích ăn uống đa dạng, làm phong phú cuộc sống gia đình bằng niềm vui vẹt.', 
	NULL, NULL, 0, N'pairing'),

	('VE358', N'Vẹt Eclectus', N'Xanh lá', 4, 2, 1, 'australian', NULL, 1, 25000000, 
	N'Vẹt Eclectus là một loài vẹt đa dạng màu sắc, với đực thường có lông màu xanh smaragd và cái có lông màu đỏ tươi. Chúng có mỏ mạnh mẽ và đôi mắt nâu sáng. Eclectus thích tương tác, thông minh và thích học tiếng nói. Tính cách độc lập và thích khám phá, yêu thích chế độ ăn uống chứa nhiều rau quả tươi ngon.', 
	NULL, NULL, 0, N'available'),

	('HM350', N'Hahn’s Macaw', N'xanh lá, đỏ', 12, 45, 1, 'macaw', N'chưa có',0, 15000000 ,N'Hahn’s Macaw rất thông minh và nổi bật với khả năng nói rất tốt nên chúng vẫn là một lựa chọn tốt cho những người yêu chim muốn có vẹt đuôi dài nhưng chưa sẵn sàng đón tiếp một thành viên quá to lớn.',
	NULL, NULL, 0, 'available'),
	
	('YC090', N'Yellow Collared Macaw', N'xanh lá', 11, 50, 1, 'macaw', N'chưa có',0, 25000000 ,N'Vẹt Yellow-collared Macaw có kích thước nhỏ hơn so với một số loài vẹt khác, với chiều dài khoảng 35-37 cm. Bộ lông của chúng chủ yếu màu xanh da trời và vàng, với cổ màu vàng rực rỡ, đó là nguồn gốc của tên gọi của loài vẹt này. Chúng có vẻ ngoài dễ thương và thu hút, và thường được nuôi làm vật nuôi trong các gia đình',
	NULL, NULL, 0, 'available'),
	
	('SM808', N'Scarlet Macaw', N'đỏ, vàng, xanh dương', 15, 60, 1, 'macaw', N'chưa có',0, 200000000 ,N'Scarlet thông minh, xinh đẹp và cũng rất ham học hỏi. Scarlet được huấn luyện đúng cách sẽ có thể làm được nhiều trò cũng như có tài ăn nói rất giỏi. Scarlet tràn đầy năng lượng, thích chơi đùa và tương tác với chủ nuôi, khá ồn ào và thích gây sự chú ý.',
	NULL, NULL, 0, 'available'),
	
	('HM101', N'Hyacinth Macaw', N'xanh dương', 17, 60, 1, 'macaw', N'chưa có',0, 700000000 ,N'Hyacinth là giống vẹt đắt đỏ nhất thế giới và cũng là giống vẹt được cho là một trong những loài vẹt lớn nhất thế giới. Vẹt khá thuần và trầm tính, và là vật nuôi tuyệt vời. Chúng ngọt ngào, dịu dàng và không thích làm ồn cũng như rất thích vui đùa và gắn bó với gia đình, đặc biệt là chúng rất thân thiện với trẻ con.',
	NULL, NULL, 0, 'available'),
	
	('GW125', N'Green Winged Macaw', N'đỏ, xanh dương, xanh lá', 20, 60, 1, 'macaw', N'chưa có',0, 160000000 ,N'Green Winged thuộc trong top những loài vẹt Nam Mỹ có kích thước lớn nhất, to thứ nhì sau Vẹt Hyacinth. Green-winged tuy lớn con nhưng lại nổi tiếng là loài vẹt hiền hoà, được ví von như gã khổng lồ dịu dàng. Loài vẹt này do đó được yêu thích không phải chỉ bởi bộ lông xinh đẹp với ba màu đỏ, xanh lá và xanh dương nhưng còn vì sự dịu dàng, trầm tính hơn những loài Macaw khác. Do đó, Green-winged được chọn là người bạn đồng hành hoặc vật nuôi gia đình rất tốt.',
	NULL, NULL, 0, 'available')	
GO

INSERT INTO [Accessory] ([accessory_id], [accessory_name], [unit_price], [stock_quantity], [description], [discount], [status]) 
VALUES 
	('GT001', N'Găng tay bắt vẹt', 120000, 50, N'Dùng cho việc huấn luyện vẹt, tránh trầy xước hoặc bị đau', 0, 'available'),

	('GA001', N'Máy ghi âm', 600000, 25, N'Dùng cho việc huấn luyện vẹt nói', 0, 'available'),

	('CT001', N'Còi huấn luyện vẹt', 90000, 15, N'Huấn luyện trong việc nghe tín hiệu', 0, 'available'),

	('LN001', N'Lồng Ngoại Nhập Lớn Inox Cho Vẹt Size M',  13800000, 0,
	N'Lồng nuôi vẹt inox với chất liệu là inox tránh được chuột cắn phá như các lồng gỗ, tre không những thế còn không bị móc mọt gặm. Là lựa chọn tối ưu cho sự an toàn của vẹt.
	Kích thước: 61x52x151cm
	Không gian bên trong lồng lớn.
	Có thể biến tấu khi vẹt sinh sản.
	Chốt khóa chắc chắn và dễ thao tác khóa.
	Nan lồng chắc chắn dễ dàng chịu được tác động của chiếc mỏ vẹt.',
	0, 'out of stock'),

	('BL001', N'Balo Du Lịch Vận Chuyển Vẹt', 500000, 12, 
	N'Pet Me Shop chuyên bán và cung cấp Balo du lịch ngoại nhập chuyên dụng dành cho vẹt. Thiết kế chuyên dụng, chất liệu bền bỉ, phù hợp cho các loại vẹt size nhỏ và vừa. Giúp bạn đi đâu cũng có thể mang thú cưng đi bên cạnh mình một cách thoải mái nhất, tiện lợi nhất. Thiết kế chắc chắn, hiện đại mang phong cách thời trang.
	Kích thước: Size M (31x28x41)
	Xuất xứ: Đài Loan
	Chất liệu: Nhựa cao cấp',
	5, 'available'),

	('LM001', N'Lồng Màu (Mái Vòm)', 450000, 20,
	N'Lồng chim thép sơn tĩnh điện rất an toàn cho chim. Lồng rất chắc chắn và khoảng không gian rộng cho chú chim thoải mái hơn. Chuồng Nuôi Chim được sản xuất theo tiêu chuẩn công nghiệp bền đẹp, được hàn từ dây thép chất lượng cao, qua quy trình sơn tĩnh điện theo tiêu chuẩn.
	Size: 37x28x46
	Xuất xứ: Đài Loan
	Chất liệu: thép sơn tĩnh điện',
	10, 'available'),

	('SU231', N'Sữa tắm vẹt', 80000, 50, 
	N'Loại bỏ mùi hôi, diệt khuẩn, triệt hạ vi trùng.', 
	0, 'Available'),

	('MV157', N'Muối tắm vẹt', 220000, 30, 
	N'Làm mềm lông, tránh đóng vẩy, giảm stress, làm sạch da lông.', 
	0, 'Available'),

	('OB356', N'Ống bơm bột', 130000, 50, 
	N'Ống bơm bột cao cấp dành cho vẹt non.', 
	0, 'Available'), 

	('KC213', N'Kéo Cắt Móng Vẹt', 100000, 50, 
	N'Kéo cắt móng chân chuyên dụng dành cho vẹt với thiết kế cao cấp, an toàn, giúp bạn có thể tự làm đẹp móng chân cho bé vẹt tại nhà.', 
	0, 'available'),

	('DX202', N'Dây xích đeo chân dành cho chim vẹt', 70000, 50, 
	N'Dây xích deo chân dành choc him vẹt giúp bạn giữ vẹt trong khoản không giới hạn', 
	0, 'available'),

	('NK200', N'Máy Nhiệt Kế Điện Tử Pha Bột Cho Vẹt', 120000, 25, 
	N'Nhiệt kế điện tử hỗ trợ người nuôi canh đo nhiệt độ bột thích hợp không quá nguội hoặc quá nóng ảnh hưởng đến sức khỏe bé vẹt nhà bạn.', 
	0, 'available')
GO

INSERT INTO [dbo].[User] ([username],[password],[full_name],[phone],[email],[role],[address],[point],[register_date],[login_by],[status])
VALUES
	('customer','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMiLCJpYXQiOjE2OTUyMjkyNTh9.H2Ot0OvkGby0DxT1L4BvPCkeowjnvu5vj2x_jouZF0o','Hung','0912345678','hung@gmail.com','customer',N'353/7 Nguyễn Trãi, phường Nguyễn Cư Trinh, quận 1, TP.HCM',12,'2023-06-15','form','active'),
	('toan','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMiLCJpYXQiOjE2OTUyMjkyNTh9.H2Ot0OvkGby0DxT1L4BvPCkeowjnvu5vj2x_jouZF0o','Toan','0998765432','toan@gmail.com','customer',N'18/5/6 Trương Phước Phan, phường Bình Trị Đông, quận Bình Tân',12,'2023-06-15','form','active'),
	('hoang','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMiLCJpYXQiOjE2OTUyMjkyNTh9.H2Ot0OvkGby0DxT1L4BvPCkeowjnvu5vj2x_jouZF0o','Hoang','0987654321','hoang@gmail.com','customer',N'73/7 Trần Bình Trọng, phường 1, quận 5',12,'2023-06-15','form','active'),
	('hai','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMiLCJpYXQiOjE2OTUyMjkyNTh9.H2Ot0OvkGby0DxT1L4BvPCkeowjnvu5vj2x_jouZF0o','Hai','0923456789','hai@gmail.com','customer',N'199/5 Trần Bình Trọng, phường 3, quận 5',12,'2023-06-15','form','active'),
	('tu','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMiLCJpYXQiOjE2OTUyMjkyNTh9.H2Ot0OvkGby0DxT1L4BvPCkeowjnvu5vj2x_jouZF0o','Tu','0954321678','tu@gmail.com','customer',N'56/1/2A Bùi Minh Trực, phường 5, quận 8',12,'2023-06-15','form','inactive'),
	('staff','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMiLCJpYXQiOjE2OTUyMjkyNTh9.H2Ot0OvkGby0DxT1L4BvPCkeowjnvu5vj2x_jouZF0o','staff','0934567890','staff@gmail.com','staff',N'Ha Noi',12,'2023-06-15','form','active'),
	('staff1','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMiLCJpYXQiOjE2OTUyMjkyNTh9.H2Ot0OvkGby0DxT1L4BvPCkeowjnvu5vj2x_jouZF0o','staff','0987654321','staff@gmail.com','staff',N'Ha Noi',12,'2023-06-15','form','inactive'),
	('manager','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMiLCJpYXQiOjE2OTUyMjkyNTh9.H2Ot0OvkGby0DxT1L4BvPCkeowjnvu5vj2x_jouZF0o','manager','0965432109','manager@gmail.com','manager',N'Ha Noi',12,'2023-06-15','form','active'),
	('admin','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMiLCJpYXQiOjE2OTUyMjkyNTh9.H2Ot0OvkGby0DxT1L4BvPCkeowjnvu5vj2x_jouZF0o','admin','0978901234','admin@gmail.com','admin',N'Ha Noi',12,'2023-06-15','form','active')
GO


INSERT INTO [dbo].[Image] ([image_url],[is_thumbnail],[bird_id],[nest_id],[accessory_id])
VALUES
    ('https://petmeshop.com/wp-content/uploads/2020/09/Long-ngoai-nhap-inox-lon-cho-vet-4.jpg', 
    1, NULL, NULL, 'LN001'),
	('https://petmeshop.com/wp-content/uploads/2020/09/Long-ngoai-nhap-inox-lon-cho-vet-6.jpg', 
    0, NULL, NULL, 'LN001'),
	('https://petmeshop.com/wp-content/uploads/2020/09/Long-ngoai-nhap-inox-lon-cho-vet-7.jpg', 
    0, NULL, NULL, 'LN001'),
	('https://petmeshop.com/wp-content/uploads/2020/09/Long-ngoai-nhap-inox-lon-cho-vet-8.jpg', 
    0, NULL, NULL, 'LN001'),

	('https://petmeshop.com/wp-content/uploads/2020/09/Ba-lo-van-chuyen-vet-0.jpg', 
    0, NULL, NULL, 'LN001'),
	('https://petmeshop.com/wp-content/uploads/2020/09/Ba-lo-van-chuyen-vet-4.jpg', 
    0, NULL, NULL, 'LN001'),
	('https://petmeshop.com/wp-content/uploads/2020/09/Ba-lo-van-chuyen-vet-1.jpg', 
    1, NULL, NULL, 'LN001')
GO
