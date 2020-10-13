/*
Lab | SQL Queries 3
1. How many distinct (different) actors' last names are there?
2. In how many different languages where the films originally produced?
3. How many movies were not originally filmed in English?
4. Get 10 the longest movies from 2006.
5. How many days has been the company operating (check DATEDIFF() function)?
6. Show rental info with additional columns month and weekday. Get 20.
7. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
8. How many rentals were in the last month of activity?
*/

#1. How many distinct (different) actors' last names are there?
use sakila;
select count(distinct (last_name)) as distinct_names from actor;

#2. In how many different languages where the films originally produced?
#null values - not possible 
select count(distinct (original_language_id)) from film;

#4. Get 10 the longest movies from 2006.
select title, length, release_year from film where release_year = 2006 
order by length desc
limit 10;

#5. How many days has been the company operating (check DATEDIFF() function)?
select datediff(max(last_update), min(rental_date)) as operating from rental;

#6. Show rental info with additional columns month and weekday. Get 20.
# for rental date 
select *, monthname(rental_date) as 'month', dayname(rental_date) as weekday from rental
limit 20;

#7. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
select *, 
case
	when dayofweek(return_date) = 6 or dayofweek(return_date) = 7 then "weekend"
	else "workday"
end as "return_date day_type"
from rental;

#8. How many rentals were in the last month of activity?

select count(rental_id) from rental 
where ( "2006-02-14" - INTERVAL 30 DAY) <= rental_date;
          


/*
Lab | SQL Queries 4
Instructions

1. Get film ratings.
2. Get release years.
3. Get all films with ARMAGEDDON in the title.
4. Get all films with APOLLO in the title
5. Get all films which title ends with APOLLO.
6. Get all films with word DATE in the title.
7. Get 10 films with the longest title.
8. Get 10 the longest films.
9. How many films include Behind the Scenes content?
10. List films ordered by release year and title in alphabetical order.
*/

use sakila;
#1. Get film ratings.
select title, rating from film;

#2. Get release years.
select title, release_year from film;

#3. Get all films with ARMAGEDDON in the title.
select title from film 
where title regexp 'ARMAGEDDON';

#4. Get all films with APOLLO in the title
select title from film 
where title like '%APOLLO%';

#5. Get all films which title ends with APOLLO.
select title from film 
where title like '%APOLLO';

#6. Get all films with word DATE in the title.
select title from film 
where title regexp ' DATE|DATE ';

#7. Get 10 films with the longest title.
select title from film
order by length(title) desc
limit 10;

#8. Get 10 the longest films.
select title, film.length from film
order by film.length desc
limit 10;

#9. How many films include Behind the Scenes content?
select count(title) from film 
where special_features regexp 'Behind the Scenes';

#10. List films ordered by release year and title in alphabetical order.
select release_year, title from film
order by release_year, title;

