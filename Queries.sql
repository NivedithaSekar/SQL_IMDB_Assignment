create database movies;
use movies;
show tables;
CREATE TABLE users (
    userID INT PRIMARY KEY,
    user_name VARCHAR(50) NOT NULL,
    gender VARCHAR(10),
    user_role VARCHAR(20),
    contact_details VARCHAR(50)
);
CREATE TABLE skills (
    skill VARCHAR(50) PRIMARY KEY,
    skill_description VARCHAR(100)
);
CREATE TABLE genres (
    genre VARCHAR(25) PRIMARY KEY
);
CREATE TABLE languages (
    lang VARCHAR(30) PRIMARY KEY,
    region VARCHAR(30)
);
CREATE TABLE movies (
    movie_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(30) NOT NULL,
    release_date DATE NOT NULL,
    original_lang VARCHAR(30),
    CONSTRAINT original_mv_lang FOREIGN KEY (original_lang)
        REFERENCES languages (lang)
);

CREATE TABLE movie_languages (
    movie_id INT,
    lang VARCHAR(30),
    FOREIGN KEY (lang)
        REFERENCES languages (lang),
    FOREIGN KEY (movie_id)
        REFERENCES movies (movie_id)
);

CREATE TABLE movie_genres (
    movie_id INT,
    genre VARCHAR(25),
    FOREIGN KEY (genre)
        REFERENCES genres (genre),
    FOREIGN KEY (movie_id)
        REFERENCES movies (movie_id)
);

CREATE TABLE movie_reviews (
    reviewed_for INT,
    reviewed_by INT,
    review VARCHAR(200),
    posted_at DATETIME,
    FOREIGN KEY (reviewed_for)
        REFERENCES movies (movie_id),
    FOREIGN KEY (reviewed_by)
        REFERENCES users (userID)
);

CREATE TABLE movie_medias (
    id INT PRIMARY KEY,
    media_type VARCHAR(10),
    related_to_movie INT,
    media_file_path VARCHAR(1024),
    FOREIGN KEY (related_to_movie)
        REFERENCES movies (movie_id)
);

CREATE TABLE user_skills (
    userID INT NOT NULL,
    skill VARCHAR(50) NOT NULL,
    proficiency_level INT NOT NULL,
    user_about_skill varchar(150),
    FOREIGN KEY (userID)
        REFERENCES users (userID),
    FOREIGN KEY (skill)
        REFERENCES skills (skill),
    CONSTRAINT proficiency_check CHECK (proficiency_level <= 10
        AND proficiency_level > 0)
);

create table movie_cast (
	movie_id int not null,
    artist_id int not null,
    role_played varchar(25),
    role_description varchar(150),
    FOREIGN KEY (artist_id)
        REFERENCES users (userID),
    FOREIGN KEY (movie_id)
        REFERENCES movies (movie_id)
);