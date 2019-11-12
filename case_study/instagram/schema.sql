CREATE DATABASE instagram;

USE instagram;

/*

CREATE TABLE users (
    uid INTEGER AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
); 

*/
-- INTEGER is alias for INT


/* 

CREATE TABLE photos (
    pid INTEGER AUTO_INCREMENT PRIMARY KEY,
    image_url VARCHAR(255) NOT NULL,
    user_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(uid)
); 

*/


/* 

CREATE TABLE comments (
    cid INTEGER AUTO_INCREMENT PRIMARY KEY,
    comment_text VARCHAR(255) NOT NULL,
    photo_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(photo_id) REFERENCES photos(pid),
    FOREIGN KEY(user_id) REFERENCES users(uid)
);

*/



CREATE TABLE likes
(
    user_id INTEGER NOT NULL,
    photo_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(uid),
    FOREIGN KEY(photo_id) REFERENCES photos(pid),
    PRIMARY KEY(user_id, photo_id)
);


CREATE TABLE follows
(
    follower_id INTEGER NOT NULL,
    -- person who is following 
    followee_id INTEGER NOT NULL,
    -- person who has been followed by other people
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(follower_id) REFERENCES users(uid),
    FOREIGN KEY(followee_id) REFERENCES users(uid),
    PRIMARY KEY(follower_id, followee_id)
);


/* 

CREATE TABLE tags (
  tid INTEGER AUTO_INCREMENT PRIMARY KEY,
  tag_name VARCHAR(255) UNIQUE,
  created_at TIMESTAMP DEFAULT NOW()
);

*/


CREATE TABLE photo_tags
(
    photo_id INTEGER NOT NULL,
    tag_id INTEGER NOT NULL,
    FOREIGN KEY(photo_id) REFERENCES photos(pid),
    FOREIGN KEY(tag_id) REFERENCES tags(tid),
    PRIMARY KEY(photo_id, tag_id)
);


-- DESC users;
-- DESC photos;
-- DESC comments;
-- DESC likes;
-- DESC follows;
-- DESC tags;
-- DESC photo_tags;