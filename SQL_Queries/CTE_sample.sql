# Select all Hollywood movies released after the year 2000 that made more than 500 million $ profit or more profit.

# Hollywood movies released after the year 2000
# more than 500 million $ profit or more profit

 
WITH 
x as (select * from movies where industry="hollywood" and release_year>2000) ,
y as (select * from financials where (revenue-budget)>500) 
SELECT x.title,x.release_year
FROM x,y
WHERE x.movie_id=y.movie_id;