# SQL_IMDB_Assignment

Assignment to Design a database for IMDB

Requirements - table created to acheive the requirement:
-----------------------------------------------------------
1. Movie should have multiple media(Video or Image) - movie, movie_medias
     As storing the media files directly can cause the DB to slow down leading to latency/performance issue.It is not advisable to use BLOB/.. datatype. Instead I have used varchar(120), So I could store the path of the media files
2. Movie can belongs to multiple Genre - movies, movie_genres, genres
3. Movie can have multiple reviews and Review can belongs to a user - movies, movie_reviews, users
4. Artist can have multiple skills - user, user_skills, skills
5. Artist can perform multiple role in a single film - movies, movie_cast, users
