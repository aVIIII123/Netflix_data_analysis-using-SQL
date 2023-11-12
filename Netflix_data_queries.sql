SELECT *
FROM data

--QUESTIONS AND THEIR ANSWERES RELATED TO THE NETFLIX DATA

1.How many movies and TV shows are available on Netflix?

SELECT DISTINCT type,COUNT(type) AS total
FROM data
GROUP BY type

2.What are the top 10 countries with the most content available on Netflix?

SELECT TOP 10 country, COUNT(type) as total
FROM data
WHERE country is not null
GROUP BY country
ORDER BY 2 DESC

3.How many movies and TV shows were added to Netflix each year?

SELECT YEAR(date_added) as YEAR_added, SUM(CASE WHEN type LIKE 'Movie' THEN 1 ELSE 0 END) AS movies,SUM(CASE WHEN type LIKE 'TV Show' THEN 1 ELSE 0 END) AS TV_Shows
FROM data
WHERE YEAR(date_added) is not null
GROUP BY YEAR(date_added)
ORDER BY 1

4.Who are the top 10 directors with the most content on Netflix?

SELECT TOP 10 director, COUNT(type) as total, SUM(CASE WHEN type LIKE 'Movie' THEN 1 ELSE 0 END) AS movies,SUM(CASE WHEN type LIKE 'TV Show' THEN 1 ELSE 0 END) AS TV_Shows
FROM data
WHERE director is not null
GROUP BY director
ORDER BY 2 DESC


5.What are the top 10 genres of content available on Netflix?

--TOP TEN GENRES
SELECT TOP 10 genres, COUNT(*) AS count
FROM data
GROUP BY genres
ORDER BY 2 DESC

--TOP TEN GENRES BY AVERAGE DURATION
SELECT TOP 10 genres,AVG(duration)  AS avg_duration 
FROM data
GROUP BY genres
ORDER BY 2 DESC

6.What is the average duration of movies and TV shows on Netflix?
SELECT type, AVG(duration) AS avg_duration
FROM data
GROUP BY type

7.What are the top 10 actors/actresses with the most appearances in Netflix content?

SELECT TOP 10 cast , COUNT(*) as total_appearences
FROM data
WHERE cast is not null
GROUP BY cast
ORDER BY 2 DESC

8.How many movies and TV shows on Netflix were released in each year?

SELECT release_year, SUM(CASE WHEN type LIKE 'Movie' THEN 1 ELSE 0 END) AS movies,SUM(CASE WHEN type LIKE 'TV Show' THEN 1 ELSE 0 END) AS TV_Shows
FROM data
GROUP BY release_year
ORDER BY 1

9.What is the distribution of content types (movies vs. TV shows) on Netflix?

SELECT SUM(CASE WHEN type LIKE 'Movie' THEN 1 ELSE 0 END) AS movies,SUM(CASE WHEN type LIKE 'TV Show' THEN 1 ELSE 0 END) AS TV_Shows
FROM data
