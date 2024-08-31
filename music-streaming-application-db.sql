USE [music_streaming]
GO
/****** Object:  Table [dbo].[album_songs]    Script Date: 8/31/2024 10:48:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[album_songs](
	[album_id] [int] NOT NULL,
	[song_id] [int] NOT NULL,
	[track_number] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[album_id] ASC,
	[song_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[albums]    Script Date: 8/31/2024 10:48:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[albums](
	[album_id] [int] IDENTITY(1,1) NOT NULL,
	[artist_id] [int] NULL,
	[title] [nvarchar](max) NOT NULL,
	[release_date] [date] NULL,
	[genre] [varchar](255) NULL,
	[created_at] [datetime] NULL,
	[image_path] [varchar](max) NULL,
	[description] [nvarchar](max) NULL,
 CONSTRAINT [PK__albums__B0E1DDB2E8074F5B] PRIMARY KEY CLUSTERED 
(
	[album_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[artist_songs]    Script Date: 8/31/2024 10:48:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[artist_songs](
	[artist_id] [int] NOT NULL,
	[song_id] [int] NOT NULL,
	[role_description] [varchar](50) NULL,
	[isOwner] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[artist_id] ASC,
	[song_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[artists]    Script Date: 8/31/2024 10:48:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[artists](
	[artist_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[bio] [text] NULL,
	[created_at] [datetime] NULL,
	[image_path] [varchar](max) NULL,
	[user_id] [int] NULL,
 CONSTRAINT [PK__artists__6CD040011B91493D] PRIMARY KEY CLUSTERED 
(
	[artist_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[listening_history]    Script Date: 8/31/2024 10:48:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[listening_history](
	[history_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[song_id] [int] NULL,
	[played_at] [datetime] NULL,
	[last_pause_time] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[history_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[otp_code]    Script Date: 8/31/2024 10:48:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[otp_code](
	[opt_id] [int] IDENTITY(1,1) NOT NULL,
	[opt_code] [char](6) NOT NULL,
	[created_at] [datetime] NOT NULL,
	[isUsed] [bit] NOT NULL,
	[user_id] [int] NOT NULL,
 CONSTRAINT [PK__OTPCode__3214EC0726F84CAA] PRIMARY KEY CLUSTERED 
(
	[opt_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[playlist_songs]    Script Date: 8/31/2024 10:48:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[playlist_songs](
	[playlist_id] [int] NOT NULL,
	[song_id] [int] NOT NULL,
	[added_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[playlist_id] ASC,
	[song_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[playlists]    Script Date: 8/31/2024 10:48:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[playlists](
	[playlist_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[title] [nvarchar](max) NOT NULL,
	[created_at] [datetime] NULL,
 CONSTRAINT [PK__playlist__FB9C1410FF82A294] PRIMARY KEY CLUSTERED 
(
	[playlist_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[refresh_token]    Script Date: 8/31/2024 10:48:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[refresh_token](
	[refresh_token_id] [int] IDENTITY(1,1) NOT NULL,
	[refresh_token] [varchar](128) NOT NULL,
	[expired_at] [datetime] NOT NULL,
	[user_id] [int] NOT NULL,
 CONSTRAINT [PK_RefreshToken] PRIMARY KEY CLUSTERED 
(
	[refresh_token_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[songs]    Script Date: 8/31/2024 10:48:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[songs](
	[song_id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](255) NOT NULL,
	[duration] [time](7) NULL,
	[file_path] [varchar](255) NOT NULL,
	[created_at] [datetime] NULL,
	[status] [varchar](50) NULL,
	[lyrics] [varchar](max) NULL,
	[image_path] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[song_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subscriptions]    Script Date: 8/31/2024 10:48:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subscriptions](
	[SubscriptionId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[DurationInDays] [int] NOT NULL,
	[Description] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[SubscriptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_favorites]    Script Date: 8/31/2024 10:48:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_favorites](
	[user_id] [int] NOT NULL,
	[song_id] [int] NOT NULL,
	[added_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC,
	[song_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 8/31/2024 10:48:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](255) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[created_at] [datetime] NULL,
	[subscription_type] [varchar](50) NULL,
	[role] [nvarchar](max) NULL,
	[image_path] [varchar](max) NULL,
 CONSTRAINT [PK__users__B9BE370FB719034F] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserSubscriptions]    Script Date: 8/31/2024 10:48:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserSubscriptions](
	[UserSubscriptionId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[SubscriptionId] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserSubscriptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [UQ__users__AB6E6164B9D97C16]    Script Date: 8/31/2024 10:48:07 AM ******/
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [UQ__users__AB6E6164B9D97C16] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[albums] ADD  CONSTRAINT [DF__albums__created___44FF419A]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[artists] ADD  CONSTRAINT [DF__artists__created__45F365D3]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[listening_history] ADD  DEFAULT (getdate()) FOR [played_at]
GO
ALTER TABLE [dbo].[playlist_songs] ADD  DEFAULT (getdate()) FOR [added_at]
GO
ALTER TABLE [dbo].[playlists] ADD  CONSTRAINT [DF__playlists__creat__48CFD27E]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[songs] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[user_favorites] ADD  DEFAULT (getdate()) FOR [added_at]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF__users__created_a__4BAC3F29]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF__users__role__656C112C]  DEFAULT ('user') FOR [role]
GO
ALTER TABLE [dbo].[album_songs]  WITH CHECK ADD FOREIGN KEY([album_id])
REFERENCES [dbo].[albums] ([album_id])
GO
ALTER TABLE [dbo].[album_songs]  WITH CHECK ADD FOREIGN KEY([song_id])
REFERENCES [dbo].[songs] ([song_id])
GO
ALTER TABLE [dbo].[albums]  WITH CHECK ADD  CONSTRAINT [FK__albums__artist_i__4D94879B] FOREIGN KEY([artist_id])
REFERENCES [dbo].[artists] ([artist_id])
GO
ALTER TABLE [dbo].[albums] CHECK CONSTRAINT [FK__albums__artist_i__4D94879B]
GO
ALTER TABLE [dbo].[artist_songs]  WITH CHECK ADD FOREIGN KEY([artist_id])
REFERENCES [dbo].[artists] ([artist_id])
GO
ALTER TABLE [dbo].[artist_songs]  WITH CHECK ADD FOREIGN KEY([song_id])
REFERENCES [dbo].[songs] ([song_id])
GO
ALTER TABLE [dbo].[artists]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[listening_history]  WITH CHECK ADD FOREIGN KEY([song_id])
REFERENCES [dbo].[songs] ([song_id])
GO
ALTER TABLE [dbo].[listening_history]  WITH CHECK ADD  CONSTRAINT [FK__listening__user___4F7CD00D] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[listening_history] CHECK CONSTRAINT [FK__listening__user___4F7CD00D]
GO
ALTER TABLE [dbo].[otp_code]  WITH CHECK ADD  CONSTRAINT [FK__OTPCode__Created__59FA5E80] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[otp_code] CHECK CONSTRAINT [FK__OTPCode__Created__59FA5E80]
GO
ALTER TABLE [dbo].[playlist_songs]  WITH CHECK ADD  CONSTRAINT [FK__playlist___playl__5070F446] FOREIGN KEY([playlist_id])
REFERENCES [dbo].[playlists] ([playlist_id])
GO
ALTER TABLE [dbo].[playlist_songs] CHECK CONSTRAINT [FK__playlist___playl__5070F446]
GO
ALTER TABLE [dbo].[playlist_songs]  WITH CHECK ADD FOREIGN KEY([song_id])
REFERENCES [dbo].[songs] ([song_id])
GO
ALTER TABLE [dbo].[playlists]  WITH CHECK ADD  CONSTRAINT [FK__playlists__user___52593CB8] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[playlists] CHECK CONSTRAINT [FK__playlists__user___52593CB8]
GO
ALTER TABLE [dbo].[refresh_token]  WITH CHECK ADD  CONSTRAINT [FK_RefreshToken_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[refresh_token] CHECK CONSTRAINT [FK_RefreshToken_User]
GO
ALTER TABLE [dbo].[user_favorites]  WITH CHECK ADD FOREIGN KEY([song_id])
REFERENCES [dbo].[songs] ([song_id])
GO
ALTER TABLE [dbo].[user_favorites]  WITH CHECK ADD  CONSTRAINT [FK__user_favo__user___5535A963] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[user_favorites] CHECK CONSTRAINT [FK__user_favo__user___5535A963]
GO
ALTER TABLE [dbo].[UserSubscriptions]  WITH CHECK ADD  CONSTRAINT [FK_UserSubscriptions_Subscriptions] FOREIGN KEY([SubscriptionId])
REFERENCES [dbo].[Subscriptions] ([SubscriptionId])
GO
ALTER TABLE [dbo].[UserSubscriptions] CHECK CONSTRAINT [FK_UserSubscriptions_Subscriptions]
GO
ALTER TABLE [dbo].[UserSubscriptions]  WITH CHECK ADD  CONSTRAINT [FK_UserSubscriptions_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[UserSubscriptions] CHECK CONSTRAINT [FK_UserSubscriptions_Users]
GO
GO
INSERT [dbo].[album_songs] ([album_id], [song_id], [track_number]) VALUES (1, 1, 1)
INSERT [dbo].[album_songs] ([album_id], [song_id], [track_number]) VALUES (2, 2, 2)
INSERT [dbo].[album_songs] ([album_id], [song_id], [track_number]) VALUES (3, 3, 3)
INSERT [dbo].[album_songs] ([album_id], [song_id], [track_number]) VALUES (4, 4, 4)
INSERT [dbo].[album_songs] ([album_id], [song_id], [track_number]) VALUES (5, 5, 5)
GO
SET IDENTITY_INSERT [dbo].[albums] ON 

INSERT [dbo].[albums] ([album_id], [artist_id], [title], [release_date], [genre], [created_at], [image_path], [description]) VALUES (1, 1, N'1989', CAST(N'2014-10-27' AS Date), N'Pop', CAST(N'2024-08-12T23:59:02.303' AS DateTime), NULL, NULL)
INSERT [dbo].[albums] ([album_id], [artist_id], [title], [release_date], [genre], [created_at], [image_path], [description]) VALUES (2, 2, N'Divide', CAST(N'2017-03-03' AS Date), N'Pop', CAST(N'2024-08-12T23:59:02.303' AS DateTime), NULL, NULL)
INSERT [dbo].[albums] ([album_id], [artist_id], [title], [release_date], [genre], [created_at], [image_path], [description]) VALUES (3, 3, N'Map of the Soul: 7', CAST(N'2020-02-21' AS Date), N'K-pop', CAST(N'2024-08-12T23:59:02.303' AS DateTime), NULL, NULL)
INSERT [dbo].[albums] ([album_id], [artist_id], [title], [release_date], [genre], [created_at], [image_path], [description]) VALUES (4, 4, N'Sweetener', CAST(N'2018-08-17' AS Date), N'Pop', CAST(N'2024-08-12T23:59:02.303' AS DateTime), NULL, NULL)
INSERT [dbo].[albums] ([album_id], [artist_id], [title], [release_date], [genre], [created_at], [image_path], [description]) VALUES (5, 5, N'After Hours', CAST(N'2020-03-20' AS Date), N'R&B', CAST(N'2024-08-12T23:59:02.303' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[albums] OFF
GO
INSERT [dbo].[artist_songs] ([artist_id], [song_id], [role_description], [isOwner]) VALUES (1, 1, N'Main artist', 1)
INSERT [dbo].[artist_songs] ([artist_id], [song_id], [role_description], [isOwner]) VALUES (2, 2, N'Main artist', 1)
INSERT [dbo].[artist_songs] ([artist_id], [song_id], [role_description], [isOwner]) VALUES (3, 3, N'Main artist', 1)
INSERT [dbo].[artist_songs] ([artist_id], [song_id], [role_description], [isOwner]) VALUES (4, 4, N'Main artist', 1)
INSERT [dbo].[artist_songs] ([artist_id], [song_id], [role_description], [isOwner]) VALUES (5, 5, N'Main artist', 1)
INSERT [dbo].[artist_songs] ([artist_id], [song_id], [role_description], [isOwner]) VALUES (8, 7, N'Main artist', NULL)
GO
SET IDENTITY_INSERT [dbo].[artists] ON 

INSERT [dbo].[artists] ([artist_id], [name], [bio], [created_at], [image_path], [user_id]) VALUES (1, N'Taylor Swift', N'American singer-songwriter', CAST(N'2024-08-12T23:59:02.290' AS DateTime), NULL, NULL)
INSERT [dbo].[artists] ([artist_id], [name], [bio], [created_at], [image_path], [user_id]) VALUES (2, N'Ed Sheeran', N'English singer-songwriter', CAST(N'2024-08-12T23:59:02.290' AS DateTime), NULL, NULL)
INSERT [dbo].[artists] ([artist_id], [name], [bio], [created_at], [image_path], [user_id]) VALUES (3, N'BTS', N'South Korean boy band', CAST(N'2024-08-12T23:59:02.290' AS DateTime), NULL, NULL)
INSERT [dbo].[artists] ([artist_id], [name], [bio], [created_at], [image_path], [user_id]) VALUES (4, N'Ariana Grande', N'American singer and actress', CAST(N'2024-08-12T23:59:02.290' AS DateTime), NULL, NULL)
INSERT [dbo].[artists] ([artist_id], [name], [bio], [created_at], [image_path], [user_id]) VALUES (5, N'The Weeknd', N'Canadian singer and songwriter', CAST(N'2024-08-12T23:59:02.290' AS DateTime), NULL, NULL)
INSERT [dbo].[artists] ([artist_id], [name], [bio], [created_at], [image_path], [user_id]) VALUES (8, N'Nguyen Thanh Anh Tu', NULL, CAST(N'2024-08-25T00:20:01.920' AS DateTime), NULL, 7)
SET IDENTITY_INSERT [dbo].[artists] OFF
GO
SET IDENTITY_INSERT [dbo].[listening_history] ON 

INSERT [dbo].[listening_history] ([history_id], [user_id], [song_id], [played_at], [last_pause_time]) VALUES (1, 1, 1, CAST(N'2024-08-12T23:59:02.310' AS DateTime), NULL)
INSERT [dbo].[listening_history] ([history_id], [user_id], [song_id], [played_at], [last_pause_time]) VALUES (2, 1, 2, CAST(N'2024-08-12T23:59:02.310' AS DateTime), NULL)
INSERT [dbo].[listening_history] ([history_id], [user_id], [song_id], [played_at], [last_pause_time]) VALUES (3, 2, 5, CAST(N'2024-08-12T23:59:02.310' AS DateTime), NULL)
INSERT [dbo].[listening_history] ([history_id], [user_id], [song_id], [played_at], [last_pause_time]) VALUES (4, 3, 3, CAST(N'2024-08-12T23:59:02.310' AS DateTime), NULL)
INSERT [dbo].[listening_history] ([history_id], [user_id], [song_id], [played_at], [last_pause_time]) VALUES (5, 3, 4, CAST(N'2024-08-12T23:59:02.310' AS DateTime), NULL)
INSERT [dbo].[listening_history] ([history_id], [user_id], [song_id], [played_at], [last_pause_time]) VALUES (6, 3, 7, CAST(N'2024-08-27T16:21:34.977' AS DateTime), CAST(N'00:02:11' AS Time))
SET IDENTITY_INSERT [dbo].[listening_history] OFF
GO
SET IDENTITY_INSERT [dbo].[otp_code] ON 

INSERT [dbo].[otp_code] ([opt_id], [opt_code], [created_at], [isUsed], [user_id]) VALUES (1, N'202489', CAST(N'2024-08-29T14:52:31.020' AS DateTime), 1, 7)
SET IDENTITY_INSERT [dbo].[otp_code] OFF
GO
INSERT [dbo].[playlist_songs] ([playlist_id], [song_id], [added_at]) VALUES (1, 1, CAST(N'2024-08-12T23:59:02.307' AS DateTime))
INSERT [dbo].[playlist_songs] ([playlist_id], [song_id], [added_at]) VALUES (2, 1, CAST(N'2024-08-20T16:59:57.760' AS DateTime))
INSERT [dbo].[playlist_songs] ([playlist_id], [song_id], [added_at]) VALUES (2, 5, CAST(N'2024-08-12T23:59:02.307' AS DateTime))
INSERT [dbo].[playlist_songs] ([playlist_id], [song_id], [added_at]) VALUES (3, 3, CAST(N'2024-08-12T23:59:02.307' AS DateTime))
INSERT [dbo].[playlist_songs] ([playlist_id], [song_id], [added_at]) VALUES (3, 4, CAST(N'2024-08-12T23:59:02.307' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[playlists] ON 

INSERT [dbo].[playlists] ([playlist_id], [user_id], [title], [created_at]) VALUES (1, 1, N'John''s Pop Playlist', CAST(N'2024-08-12T23:59:02.307' AS DateTime))
INSERT [dbo].[playlists] ([playlist_id], [user_id], [title], [created_at]) VALUES (2, 2, N'Jane''s Chill Mix', CAST(N'2024-08-12T23:59:02.307' AS DateTime))
INSERT [dbo].[playlists] ([playlist_id], [user_id], [title], [created_at]) VALUES (3, 3, N'Bobby''s Workout Mix', CAST(N'2024-08-12T23:59:02.307' AS DateTime))
SET IDENTITY_INSERT [dbo].[playlists] OFF
GO
SET IDENTITY_INSERT [dbo].[songs] ON 

INSERT [dbo].[songs] ([song_id], [title], [duration], [file_path], [created_at], [status], [lyrics], [image_path]) VALUES (1, N'Shake It Off', CAST(N'00:03:39' AS Time), N'/music/taylor_swift/shake_it_off.mp3', CAST(N'2024-08-12T23:59:02.303' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[songs] ([song_id], [title], [duration], [file_path], [created_at], [status], [lyrics], [image_path]) VALUES (2, N'Shape of You', CAST(N'00:03:53' AS Time), N'/music/ed_sheeran/shape_of_you.mp3', CAST(N'2024-08-12T23:59:02.303' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[songs] ([song_id], [title], [duration], [file_path], [created_at], [status], [lyrics], [image_path]) VALUES (3, N'Boy With Luv', CAST(N'00:03:49' AS Time), N'/music/bts/boy_with_luv.mp3', CAST(N'2024-08-12T23:59:02.303' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[songs] ([song_id], [title], [duration], [file_path], [created_at], [status], [lyrics], [image_path]) VALUES (4, N'God is a woman', CAST(N'00:03:17' AS Time), N'/music/ariana_grande/god_is_a_woman.mp3', CAST(N'2024-08-12T23:59:02.303' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[songs] ([song_id], [title], [duration], [file_path], [created_at], [status], [lyrics], [image_path]) VALUES (5, N'Blinding Lights', CAST(N'00:03:20' AS Time), N'/music/the_weeknd/blinding_lights.mp3', CAST(N'2024-08-12T23:59:02.303' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[songs] ([song_id], [title], [duration], [file_path], [created_at], [status], [lyrics], [image_path]) VALUES (7, N'December', CAST(N'00:04:18' AS Time), N'https://res.cloudinary.com/dlszawdms/raw/upload/v1724750352/sna9c1j4maqmc1bn9kqh.mp3', CAST(N'2024-08-27T16:19:14.883' AS DateTime), N'True', N'Ðã bao gi? em h?t suy tu? Mang câu chuy?n em vi?t lên thu Ch? d? th?y yên bình trong gi?a muôn vàn dau thuong Tôi yêu t?ng c? ch? thân quen Hát m?y l?i xua h?t mây den Và em bi?t r?ng tôi s? luôn ? d?y Ð? l?y h?t nh?ng n?i bu?n Ðã luôn theo em Vì tôi yêu em, tôi bi?t th? gian còn r?t h?ng h? H? dâu bi?t em mê nh?c mê tho Ch? luôn mong khi?n cho em nghi ng? Mình tôi thôi, có m?y ai nhìn th?y em cu?i Ð?ng mãi nghe nh?ng l?i vu vo Vì ch?ng bi?t s? d?n bao gi? tôi m?t em Em say cu?ng quên h?t xung quanh Tôi âm th?m theo gót th?t nhanh Ch? d? th?y dáng ngu?i hòa v?i ti?ng dàn du duong Huong vang d?ng trên chi?c hôn môi Ðêm nay ch? còn m?i ta thôi Và em bi?t r?ng tôi s? luôn ? d?y Ð? l?y h?t nh?ng n?i bu?n Ðã mãi theo em Vì tôi yêu em, tôi bi?t th? gian còn r?t h?ng h? H? dâu bi?t em mê nh?c mê tho Ch? luôn mong khi?n cho em nghi ng? Mình tôi thôi, có m?y ai nhìn th?y em cu?i Ð?ng mãi nghe nh?ng l?i vu vo Vì ch?ng bi?t s? d?n bao gi? tôi m?t em Vì tôi yêu em, tôi bi?t th? gian còn r?t h?ng h? H? dâu bi?t em mê nh?c mê tho Ch? luôn mong khi?n cho em nghi ng? Mình tôi thôi, có m?y ai nhìn th?y em cu?i Ð?ng mãi nghe nh?ng l?i vu vo Vì ch?ng bi?t s? d?n bao gi? tôi m?t em Ð?ng mãi nghe nh?ng l?i vu vo Vì ch?ng bi?t s? d?n bao gi? tôi m?t em', N'https://res.cloudinary.com/dlszawdms/image/upload/v1724750354/x4z01gbosolwfome4jmi.jpg')
SET IDENTITY_INSERT [dbo].[songs] OFF
GO
INSERT [dbo].[user_favorites] ([user_id], [song_id], [added_at]) VALUES (1, 2, CAST(N'2024-08-12T23:59:02.310' AS DateTime))
INSERT [dbo].[user_favorites] ([user_id], [song_id], [added_at]) VALUES (2, 5, CAST(N'2024-08-12T23:59:02.310' AS DateTime))
INSERT [dbo].[user_favorites] ([user_id], [song_id], [added_at]) VALUES (3, 4, CAST(N'2024-08-12T23:59:02.310' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([user_id], [username], [email], [password], [created_at], [subscription_type], [role], [image_path]) VALUES (1, N'john_doe', N'john@example.com', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', CAST(N'2024-08-12T23:59:02.307' AS DateTime), N'Premium', N'Admin', NULL)
INSERT [dbo].[users] ([user_id], [username], [email], [password], [created_at], [subscription_type], [role], [image_path]) VALUES (2, N'jane_smith', N'jane@example.com', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', CAST(N'2024-08-12T23:59:02.307' AS DateTime), N'Free', N'User', NULL)
INSERT [dbo].[users] ([user_id], [username], [email], [password], [created_at], [subscription_type], [role], [image_path]) VALUES (3, N'bobby_brown', N'bobby@example.com', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', CAST(N'2024-08-12T23:59:02.307' AS DateTime), N'Free', N'User', NULL)
INSERT [dbo].[users] ([user_id], [username], [email], [password], [created_at], [subscription_type], [role], [image_path]) VALUES (7, N'TuNguyen', N'tunguyen100312@gmail.com', N'90fbd1dd82157961e9cd497cfd7764cb1f5b53e3a1ae3affb4efe87cd6c68b9c', CAST(N'2024-08-25T00:20:01.723' AS DateTime), NULL, N'Artist', NULL)
SET IDENTITY_INSERT [dbo].[users] OFF
GO
SET ANSI_PADDING ON
GO