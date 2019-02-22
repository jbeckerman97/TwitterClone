-- This file containes various ALTER TABLE statements that cause error when trying to run a query more than once
-- The order of the statements is the order in which I used them

ALTER TABLE tweets
CHANGE msg_date msg_date_time DATE;

ALTER TABLE tweets
MODIFY msg_date_time DATETIME,
DROP COLUMN msg_time;

ALTER TABLE followers
CHANGE follow_date follow_date_time DATE;

ALTER TABLE followers
MODIFY follow_date_time DATETIME;

ALTER TABLE favorites
CHANGE favorite_date favorite_date_time DATE;

ALTER TABLE favorites
MODIFY favorite_date_time DATETIME;

ALTER TABLE retweets
CHANGE retweet_date retweet_date_time DATE;

ALTER TABLE retweets
MODIFY retweet_date_time DATETIME;

ALTER TABLE deleted
CHANGE posted_date posted_date_time DATE,
CHANGE delete_date delete_date_time DATE;

ALTER TABLE deleted
MODIFY posted_date_time DATETIME,
MODIFY delete_date_time DATETIME,
DROP COLUMN posted_time,
DROP COLUMN delete_time;

ALTER TABLE followers
CHANGE follower follower_id INT NOT NULL,
CHANGE following following_id INT NOT NULL;

ALTER TABLE favorites
ADD COLUMN favoriting_author_id INT NOT NULL;

ALTER TABLE users
ADD COLUMN num_favorites INT DEFAULT 0;

ALTER TABLE users
ADD COLUMN date_joined DATETIME;

ALTER TABLE users
ADD COLUMN num_retweets INT DEFAULT 0;

ALTER TABLE users
ADD COLUMN num_retweeted INT DEFAULT 0;

ALTER TABLE favorites
DROP PRIMARY KEY, ADD PRIMARY KEY (tweet_id, author_id, favoriting_author_id);