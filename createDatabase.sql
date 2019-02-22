-- This file contains the creation of the database as well as the tables used

CREATE DATABASE IF NOT EXISTS twitter;
USE twitter;

CREATE TABLE IF NOT EXISTS users (
	id INT NOT NULL AUTO_INCREMENT,
    screen_name VARCHAR(25) NOT NULL,
    person_name VARCHAR(200) NOT NULL,
    num_followers INT DEFAULT 0,
    num_following INT DEFAULT 0,
    num_tweets INT DEFAULT 0,
    PRIMARY KEY(id) );
    
CREATE TABLE IF NOT EXISTS tweets (
	id INT NOT NULL AUTO_INCREMENT,
    author_id INT NOT NULL,
    message VARCHAR(200) NOT NULL,
    msg_date DATE,
    msg_time TIME,
    num_favorites INT DEFAULT 0,
    num_retweets INT DEFAULT 0,
    PRIMARY KEY (id),
    FOREIGN KEY (author_id)
		REFERENCES users(id) );
        
CREATE TABLE IF NOT EXISTS followers (
	follower INT NOT NULL,
    following INT NOT NULL,
    follow_date DATE,
    PRIMARY KEY (follower, following),
    FOREIGN KEY (follower)
		REFERENCES users(id),
	FOREIGN KEY (following)
		REFERENCES users(id) );
        
CREATE TABLE IF NOT EXISTS favorites (
	tweet_id INT, -- Allows for NULL - if NULL, tweet has been deleted
    author_id INT NOT NULL,
    favorite_date DATE,
    PRIMARY KEY (tweet_id, author_id),
    FOREIGN KEY (tweet_id)
		REFERENCES tweets(id),
	FOREIGN KEY (author_id)
		REFERENCES users(id) );
        
CREATE TABLE IF NOT EXISTS retweets (
	tweet_id INT, -- Allows for NULL - if NULL, tweet has been deleted
    original_author_id INT NOT NULL,
    retweet_author_id INT NOT NULL,
    retweet_date DATE,
    PRIMARY KEY(tweet_id, original_author_id, retweet_author_id),
    FOREIGN KEY (tweet_id)
		REFERENCES tweets(id),
	FOREIGN KEY (original_author_id)
		REFERENCES users(id),
	FOREIGN KEY (retweet_author_id)
		REFERENCES users(id) );
        
-- Idea behind this table - mock way to recover deleted tweets for investigative purposes
CREATE TABLE IF NOT EXISTS deleted (
	id INT NOT NULL AUTO_INCREMENT,
    original_tweet_id INT NOT NULL,
    author_id INT NOT NULL,
    message VARCHAR(200) NOT NULL,
    posted_date DATE,
    posted_time TIME,
    delete_date DATE,
    delete_time TIME,
    PRIMARY KEY (id),
    FOREIGN KEY (original_tweet_id)
		REFERENCES tweets(id),
	FOREIGN KEY (author_id)
		REFERENCES users(id),
	FOREIGN KEY (message)
		REFERENCES tweets(message),
	FOREIGN KEY (posted_date)
		REFERENCES tweets(msg_date),
	FOREIGN KEY (posted_time)
		REFERENCES tweets(msg_time) );