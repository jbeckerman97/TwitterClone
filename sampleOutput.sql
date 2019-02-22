-- This file contains queries showing the functions the database should have
-- ID values are hardcoded because I wasn't sure how else I would retrieve data about a specific user

-- Showing the original contents of each table (except for delete, which will be shown later)
SELECT * FROM users;
SELECT * FROM tweets;
SELECT * FROM favorites;
SELECT * FROM retweets;
SELECT * FROM followers;

-- Post a tweet, show updated tables
INSERT INTO tweets
VALUES (DEFAULT, (SELECT id FROM users WHERE id = 5), "just slipped in the snow lol", '2017-03-31 20:26:54', DEFAULT, DEFAULT);

UPDATE IGNORE users
SET num_tweets = num_tweets + 1
WHERE users.id = (
	SELECT author_id FROM tweets
    ORDER BY tweets.id DESC
    LIMIT 1);
    
-- Following and unfollowing

INSERT IGNORE INTO followers
VALUES ( (SELECT id FROM users WHERE id = 5), (SELECT id FROM users WHERE id = 11), '2017-02-14');

UPDATE IGNORE users
SET num_followers = num_followers + 1
WHERE users.id = 11;

UPDATE IGNORE users
SET num_following = num_following + 1
WHERE users.id = 5;

-- See a user's timeline - users.id = 5
-- retweet_date_time is always the time of the tweet that was retweeted - not sure what to change
SELECT users.screen_name, tweets.message, tweets.msg_date_time, retweets.retweet_date_time
FROM users
	JOIN retweets
		ON users.id = retweets.original_author_id
	JOIN tweets
		ON (tweets.id, tweets.author_id) = (retweets.tweet_id, retweets.original_author_id)
WHERE (tweets.author_id, 5) = (retweets.original_author_id, retweets.retweet_author_id)
UNION
SELECT users.screen_name, tweets.message, tweets.msg_date_time, retweets.retweet_date_time
FROM users
	JOIN tweets
		ON users.id = tweets.author_id
	JOIN retweets
		ON tweets.author_id = retweets.retweet_author_id
WHERE tweets.author_id = 5
ORDER BY msg_date_time;

-- Retweet
INSERT IGNORE INTO retweets
VALUES (5, (SELECT author_id FROM tweets WHERE id = 5), 2, (SELECT msg_date_time FROM tweets WHERE id = 5) );

UPDATE IGNORE users
SET num_retweets = num_retweeted + 1
WHERE id = 2;

UPDATE IGNORE tweets
SET num_retweets = num_retweets + 1
WHERE id = 5;

-- Delete a tweet
INSERT INTO deleted
VALUES (DEFAULT, 23, (SELECT author_id FROM tweets WHERE id = 23), (SELECT message FROM tweets WHERE id = 23), (SELECT msg_date_time FROM tweets WHERE id = 23), 
	    '2017-04-02 12:56:37');

DELETE FROM tweets
WHERE id = 23;

SELECT * FROM deleted;
SELECT * FROM tweets;

-- Favorite/unfavorite tweets
INSERT IGNORE INTO favorites
VALUES (22, (SELECT author_id FROM tweets WHERE id = 22), '2012-04-30 04:54:22', 4);

UPDATE IGNORE tweets
SET num_favorites = num_favorites + 1
WHERE id = 22;

UPDATE IGNORE users
SET num_favorites = num_favorites + 1
WHERE id = 4;

DELETE FROM favorites
WHERE (tweet_id, author_id, favoriting_author_id) IN ((19, 10, 2));

UPDATE IGNORE users
SET num_favorites = num_favorites - 1
WHERE id = 2;

UPDATE IGNORE tweets
SET num_favorites = num_favorites - 1
WHERE id = 19;

-- See user's favorited tweets
SELECT tweets.message
FROM users
	JOIN favorites
		ON users.id = favorites.favoriting_author_id
	JOIN tweets
		ON favorites.tweet_id = tweets.id
WHERE users.id = 1;

-- See who a user is following
SELECT s.screen_name
FROM followers
	JOIN users u
		ON followers.follower_id = u.id
	JOIN users s
		ON followers.following_id = s.id
WHERE u.id = 11;

-- See a user's followers
SELECT s.screen_name
FROM followers
	JOIN users u
		ON followers.following_id = u.id
	JOIN users s
		ON followers.follower_id = s.id
WHERE u.id = 1;

-- See how many times a tweet has been favorited and retweeted
SELECT tweets.message, tweets.num_favorites, tweets.num_retweets FROM tweets
WHERE tweets.id = 22;

-- See how many followers a user has and how many users one is following
SELECT users.screen_name, users.num_followers, users.num_following FROM users
WHERE users.id = 3;