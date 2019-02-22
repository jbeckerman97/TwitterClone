-- This file updates the num_X columns in various tables

UPDATE IGNORE users
SET num_followers = (
		SELECT COUNT(following_id) FROM followers
		WHERE users.id = followers.following_id ),
    num_following = (
		SELECT COUNT(follower_id) FROM followers
        WHERE users.id = followers.follower_id ),
	num_tweets = (
		SELECT COUNT(author_id) FROM tweets
        WHERE users.id = tweets.author_id),
	num_favorites = (
		SELECT COUNT(favoriting_author_id) FROM favorites
        WHERE users.id = favorites.favoriting_author_id );
        
UPDATE IGNORE tweets
SET num_favorites = (
		SELECT COUNT(tweet_id) FROM favorites
        WHERE tweets.id = favorites.tweet_id ),
	num_retweets = (
		SELECT COUNT(tweet_id) FROM retweets
        WHERE tweets.id = retweets.tweet_id );

-- Added column 'date-joined' to users table after initial table construction, so I'm filling out that column for each user in pre-sampleOutput tables
UPDATE IGNORE users
SET date_joined = '2001-01-01 01:01:01'
WHERE id = 1;

UPDATE IGNORE users
SET date_joined = '2002-02-02 02:02:02'
WHERE id = 2;
    
UPDATE IGNORE users
SET date_joined = '2003-03-03 03:03:03'
WHERE id = 3;
    
UPDATE IGNORE users
SET date_joined = '2004-04-04 04:04:04'
WHERE id = 4;
    
UPDATE IGNORE users
SET date_joined = '2005-05-05 05:05:05'
WHERE id = 5;
    
UPDATE IGNORE users
SET date_joined = '2006-06-06 06:06:06'
WHERE id = 6;
    
UPDATE IGNORE users
SET date_joined = '2007-07-07 07:07:07'
WHERE id = 7;
    
UPDATE IGNORE users
SET date_joined = '2008-08-08 08:08:08'
WHERE id = 8;
    
UPDATE IGNORE users
SET date_joined = '2009-09-09 09:09:09'
WHERE id = 9;
    
UPDATE IGNORE users
SET date_joined = '2010-10-10 10:10:10'
WHERE id = 10;

UPDATE IGNORE users
SET date_joined = '2011-11-11 11:11:11'
WHERE id = 11;

-- Added num_retweets and num_retweeted after initial table construction, so I'm updating with counts

UPDATE IGNORE users
SET num_retweets = (
		SELECT COUNT(original_author_id) FROM retweets
		WHERE users.id = original_author_id ),
    num_retweeted = (
		SELECT COUNT(retweet_author_id) FROM retweets
        WHERE users.id = retweet_author_id );
		