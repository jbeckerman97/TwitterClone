-- This file populates almost all the tables (except table 'deleted') with sample values

ALTER TABLE users ADD UNIQUE (screen_name);
INSERT IGNORE INTO users
VALUES (DEFAULT, "FirstUser", "Jacob", DEFAULT, DEFAULT, DEFAULT), -- 1
	   (DEFAULT, "SecondUser", "Aurora", DEFAULT, DEFAULT, DEFAULT), -- 2
       (DEFAULT, "ThirdUser", "Julien", DEFAULT, DEFAULT, DEFAULT), -- 3
       (DEFAULT, "FourthUser", "Zoe", DEFAULT, DEFAULT, DEFAULT), -- 4
       (DEFAULT, "FifthUser", "Schuyler", DEFAULT, DEFAULT, DEFAULT), -- 5
       (DEFAULT, "SixthUser", "Kate", DEFAULT, DEFAULT, DEFAULT), -- 6
       (DEFAULT, "SeventhUser", "Jake", DEFAULT, DEFAULT, DEFAULT), -- 7
       (DEFAULT, "EighthUser", "Jake", DEFAULT, DEFAULT, DEFAULT), -- 8
       (DEFAULT, "NinthUser", "Joe", DEFAULT, DEFAULT, DEFAULT), -- 9
       (DEFAULT, "TenthUser", "Steven", DEFAULT, DEFAULT, DEFAULT), -- 10
       (DEFAULT, "EleventhUser", "Jeff", DEFAULT, DEFAULT, DEFAULT); -- 11
       
INSERT IGNORE INTO tweets
VALUES (DEFAULT, (SELECT id FROM users WHERE id = 1), "Hello!", '2017-01-01 12:34:22', DEFAULT, DEFAULT), -- 1
	   (DEFAULT, (SELECT id FROM users WHERE id = 1), "Bonjour!", '2015-10-31 22:00:00', DEFAULT, DEFAULT), -- 2
       (DEFAULT, (SELECT id FROM users WHERE id = 2), "Hola!", '1997-01-18 01:23:45', DEFAULT, DEFAULT), -- 3
       (DEFAULT, (SELECT id FROM users WHERE id = 2), "Hallo!", '1999-09-09 23:45:56', DEFAULT, DEFAULT), -- 4
       (DEFAULT, (SELECT id FROM users WHERE id = 3), "Salam!", '1967-11-19 13:23:01', DEFAULT, DEFAULT), -- 5
       (DEFAULT, (SELECT id FROM users WHERE id = 3), "Kaixo!", '1969-01-03 11:30:00', DEFAULT, DEFAULT), -- 6
       (DEFAULT, (SELECT id FROM users WHERE id = 4), "Zdravo!", '2015-06-19 11:11:11', DEFAULT, DEFAULT), -- 7
       (DEFAULT, (SELECT id FROM users WHERE id = 4), "Hola!", '2015-06-19 11:11:12', DEFAULT, DEFAULT), -- 8
       (DEFAULT, (SELECT id FROM users WHERE id = 5), "Hello!", '1927-12-20 01:29:32', DEFAULT, DEFAULT), -- 9
       (DEFAULT, (SELECT id FROM users WHERE id = 5), "Moni!", '1985-07-14 10:49:06', DEFAULT, DEFAULT), -- 10
       (DEFAULT, (SELECT id FROM users WHERE id = 6), "Bonghjornu!", '2003-04-01 02:23:49', DEFAULT, DEFAULT), -- 11
       (DEFAULT, (SELECT id FROM users WHERE id = 6), "Zdravo!", '2003-08-21 02:23:49', DEFAULT, DEFAULT), -- 12
       (DEFAULT, (SELECT id FROM users WHERE id = 7), "Ahoj!", '2009-10-31 06:06:06', DEFAULT, DEFAULT), -- 13
       (DEFAULT, (SELECT id FROM users WHERE id = 7), "Hej!", '2004-12-11 13:30:21', DEFAULT, DEFAULT), -- 14
       (DEFAULT, (SELECT id FROM users WHERE id = 8), "Hallo!", '2017-12-24 23:59:59', DEFAULT, DEFAULT), -- 15
       (DEFAULT, (SELECT id FROM users WHERE id = 8), "Saluton!", '2017-12-25 00:00:00', DEFAULT, DEFAULT), -- 16
       (DEFAULT, (SELECT id FROM users WHERE id = 9), "Tere!", '2013-08-13 12:01:50', DEFAULT, DEFAULT), -- 17
       (DEFAULT, (SELECT id FROM users WHERE id = 9), "Hei!", '2007-05-25 09:27:01', DEFAULT, DEFAULT), -- 18
       (DEFAULT, (SELECT id FROM users WHERE id = 10), "Ola!", '2015-10-02 01:49:27', DEFAULT, DEFAULT), -- 19
       (DEFAULT, (SELECT id FROM users WHERE id = 10), "Bonjou!", '2012-04-22 15:18:26', DEFAULT, DEFAULT), -- 20
       (DEFAULT, (SELECT id FROM users WHERE id = 11), "Shalom!", '2007-10-19 17:56:38', DEFAULT, DEFAULT), -- 21
       (DEFAULT, (SELECT id FROM users WHERE id = 11), "Nyob zoo!", '2015-11-10 21:50:30', DEFAULT, DEFAULT); -- 22
       
INSERT IGNORE INTO followers
VALUES ( (SELECT id FROM users WHERE id = 1), (SELECT id FROM users WHERE id = 2), '2016-03-04 11:22:33'),
	   ( (SELECT id FROM users WHERE id = 2), (SELECT id FROM users WHERE id = 3), '1984-03-02 22:33:44'),
       ( (SELECT id FROM users WHERE id = 2), (SELECT id FROM users WHERE id = 4), '1984-11-16 12:44:55'),
       ( (SELECT id FROM users WHERE id = 4), (SELECT id FROM users WHERE id = 3), '2002-05-22 13:55:59'),
       ( (SELECT id FROM users WHERE id = 5), (SELECT id FROM users WHERE id = 1), '2017-03-03 01:11:22'),
       ( (SELECT id FROM users WHERE id = 6), (SELECT id FROM users WHERE id = 10), '1994-05-13 02:22:33'),
       ( (SELECT id FROM users WHERE id = 6), (SELECT id FROM users WHERE id = 5), '2014-10-17 03:33:44'),
       ( (SELECT id FROM users WHERE id = 8), (SELECT id FROM users WHERE id = 10), '1986-08-15 04:44:55'),
       ( (SELECT id FROM users WHERE id = 9), (SELECT id FROM users WHERE id = 8), '2017-03-10 05:55:00'),
       ( (SELECT id FROM users WHERE id = 10), (SELECT id FROM users WHERE id = 3), '2006-11-10 06:00:11'),
       ( (SELECT id FROM users WHERE id = 11), (SELECT id FROM users WHERE id = 1), '2015-01-30 07:11:22'),
       ( (SELECT id FROM users WHERE id = 11), (SELECT id FROM users WHERE id = 5), '2010-09-25 08:12:23'),
       ( (SELECT id FROM users WHERE id = 11), (SELECT id FROM users WHERE id = 6), '2016-11-04 09:13:24'),
       ( (SELECT id FROM users WHERE id = 11), (SELECT id FROM users WHERE id = 10), '1962-02-19 10:14:25');

-- This insert has the date & time the tweet was favorited as the same time the tweet was posted. This is just for testing purposes       
INSERT IGNORE INTO favorites
VALUES (1, (SELECT author_id FROM tweets WHERE id = 1), (SELECT msg_date_time FROM tweets WHERE id = 1), 1),
	   (2, (SELECT author_id FROM tweets WHERE id = 2), (SELECT msg_date_time FROM tweets WHERE id = 2), 1),
       (3, (SELECT author_id FROM tweets WHERE id = 3), (SELECT msg_date_time FROM tweets WHERE id = 3), 2),
       (4, (SELECT author_id FROM tweets WHERE id = 4), (SELECT msg_date_time FROM tweets WHERE id = 4), 8),
       (5, (SELECT author_id FROM tweets WHERE id = 5), (SELECT msg_date_time FROM tweets WHERE id = 5), 11),
       (6, (SELECT author_id FROM tweets WHERE id = 6), (SELECT msg_date_time FROM tweets WHERE id = 6), 10),
       (7, (SELECT author_id FROM tweets WHERE id = 7), (SELECT msg_date_time FROM tweets WHERE id = 7), 3),
       (8, (SELECT author_id FROM tweets WHERE id = 8), (SELECT msg_date_time FROM tweets WHERE id = 8), 5),
       (9, (SELECT author_id FROM tweets WHERE id = 9), (SELECT msg_date_time FROM tweets WHERE id = 9), 6),
       (10, (SELECT author_id FROM tweets WHERE id = 10), (SELECT msg_date_time FROM tweets WHERE id = 10), 6),
       (12, (SELECT author_id FROM tweets WHERE id = 12), (SELECT msg_date_time FROM tweets WHERE id = 12), 6),
       (14, (SELECT author_id FROM tweets WHERE id = 14), (SELECT msg_date_time FROM tweets WHERE id = 14), 7),
       (15, (SELECT author_id FROM tweets WHERE id = 15), (SELECT msg_date_time FROM tweets WHERE id = 15), 9),
       (17, (SELECT author_id FROM tweets WHERE id = 17), (SELECT msg_date_time FROM tweets WHERE id = 17), 9),
       (19, (SELECT author_id FROM tweets WHERE id = 19), (SELECT msg_date_time FROM tweets WHERE id = 19), 2),
       (22, (SELECT author_id FROM tweets WHERE id = 22), (SELECT msg_date_time FROM tweets WHERE id = 22), 4),
       (22, (SELECT author_id FROM tweets WHERE id = 22), (SELECT msg_date_time FROM tweets WHERE id = 22), 5);

-- This insert has the date & time the tweet was retweeted as the same time the tweet was posted. This is just for testing purposes
INSERT IGNORE INTO retweets
VALUES (1, (SELECT author_id FROM tweets WHERE id = 1), 11, (SELECT msg_date_time FROM tweets WHERE id = 1) ),
	   (1, (SELECT author_id FROM tweets WHERE id = 1), 4, (SELECT msg_date_time FROM tweets WHERE id = 1) ),
       (4, (SELECT author_id FROM tweets WHERE id = 4), 5, (SELECT msg_date_time FROM tweets WHERE id = 4) ),
       (6, (SELECT author_id FROM tweets WHERE id = 6), 2, (SELECT msg_date_time FROM tweets WHERE id = 6) ),
       (6, (SELECT author_id FROM tweets WHERE id = 6), 3, (SELECT msg_date_time FROM tweets WHERE id = 6) ),
       (6, (SELECT author_id FROM tweets WHERE id = 6), 4, (SELECT msg_date_time FROM tweets WHERE id = 6) ),
       (8, (SELECT author_id FROM tweets WHERE id = 8), 7, (SELECT msg_date_time FROM tweets WHERE id = 8) ),
       (10, (SELECT author_id FROM tweets WHERE id = 10), 6, (SELECT msg_date_time FROM tweets WHERE id = 10) ),
       (12, (SELECT author_id FROM tweets WHERE id = 12), 10, (SELECT msg_date_time FROM tweets WHERE id = 12) ),
       (14, (SELECT author_id FROM tweets WHERE id = 14), 10, (SELECT msg_date_time FROM tweets WHERE id = 14) ),
       (16, (SELECT author_id FROM tweets WHERE id = 16), 9, (SELECT msg_date_time FROM tweets WHERE id = 16) ),
       (18, (SELECT author_id FROM tweets WHERE id = 18), 8, (SELECT msg_date_time FROM tweets WHERE id = 18) ),
       (20, (SELECT author_id FROM tweets WHERE id = 20), 9, (SELECT msg_date_time FROM tweets WHERE id = 20) ),
       (22, (SELECT author_id FROM tweets WHERE id = 22), 3, (SELECT msg_date_time FROM tweets WHERE id = 22) );