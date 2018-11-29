use 0412002940_lokaverkefni;

/*3.Write a query to display the movie title, movie year, and movie cost for all movies that contain the word “hope” anywhere in the title. Sort
the results in ascending order by title. (The results are shown in figure P7.55.);*/

select movie_title,movie_year,movie_cost 
from movie
where movie_title like '%hope%' order by movie_title;

/*4. Write a query to display the movie title, movie year, and movie genre for all action movies. (The results are shown in Figure P7.56.);*/



select * from movie;
select movie_title,movie_year,movie_genre 
from movie 
where movie_genre = 'action';

/*5. Write a query to display the movie number, movie title, and movie cost for all movies with a cost greater than $40. (The results are shown;*/

select movie_num,movie_title ,movie_cost 
from movie 
where movie_cost > 40;


/*6.Write a query to display the movie number, movie title, movie cost, and movie genre for all movies that are either action or comedy movies
and that have a cost that is less than $50. Sort the results in ascending order by genre. (The results are shown in Figure P7.58.);*/

select movie_title,movie_cost,movie_genre 
from movie 
where (movie_genre ='action' or movie_genre ='comedy') 
and movie_cost < 50 order by movie_genre;

/*7. Write a query to display the movie number, and movie description for all movies where the movie description is a combination of the movie
title, movie year, and movie genre with the movie year enclosed in parentheses. (The results are shown in Figure P7.59.);*/

select movie_num,concat(movie_title,' (',movie_year,') ',movie_genre) 
as movie_description from movie;

/*8.Write a query to display the movie genre and the number of movies in each genre. (The results are shown in Figure P7.60.);*/

select movie_genre,count(*) as movie_number 
from movie group by movie_genre;

/*9. Write a query to display the average cost of all of the movies. (The results are shown in Figure P7.61.);*/

select avg(movie_cost) as average_pirce 
from movie;

/*10.Write a query to display the movie genre and average cost of movies in each genre. (The results are shown in Figure P7.62.);*/

select movie_genre,avg(movie_cost) as movie_cost 
from movie 
group by movie_genre;

/*11. Write a query to display the movie title, movie genre, price description, and price rental fee for all movies with a price code. (The results
are shown in Figure P7.63.);*/

select movie_title,movie_genre,price_description,price_rentfee 
from movie as m 
inner join price as p on m.price_code = p.price_code;

/*12.Write a query to display the movie genre and average price rental fee for movies in each genre that have a price. (The results are shown
in Figure P7.64.);*/

select movie_genre,avg(price_rentfee) as 'average rental fee'
from movie as m inner join price as p on m.price_code = p.price_code 
group by movie_genre ;

/*13. Write a query to display the movie title, movie year, and the movie cost divided by the price rental fee for each movie that has a price to
determine the number of rentals it will take to break even on the purchase of the movie. (The results are shown in Figure P7.65.);*/

select movie_title,movie_year,movie_cost / price_rentfee as break 
from movie as m inner join price as p on m.price_code = p.price_code
 group by movie_title ;

/*14. Write a query to display the movie title and movie year for all movies that have a price code. (The results are shown in Figure P7.66.);*/

select movie_title,movie_year 
from movie as m inner join price as p on m.price_code = p.price_code 
where p.price_code is not null ;

/*15. Write a query to display the movie title, movie year, and movie cost for all movies that have a cost between $44.99 and $49.99. (The
results are shown in Figure P7.67.);*/

select movie_title,movie_year,movie_cost 
from movie where movie_cost >44.99 and movie_cost < 49.99;

/*16. Write a query to display the movie title, movie year, price description, and price rental fee for all movies that are in the genres family,
comedy, or drama. (The results are shown in Figure P7.68.);*/

select movie_title,movie_year,price_description,price_rentfee,movie_genre
from movie as m inner join price as p on m.price_code = p.price_code 
where movie_genre = 'family'or movie_genre = 'drama' or movie_genre = 'comedy';

/*17. Write a query to display the minimum balance, maximum balance, and average balance for memberships that have a rental. (The results
are shown in Figure P7.71.);*/

select min(mem_balance) as minnum ,max(mem_balance) 
as max, avg(mem_balance) as avg from membership;

/*18. Write a query to display the membership name (concatenate the first name and last name with a space between them into a single
column), membership address (concatenate the street, city, state, and zip codes into a single column with spaces. (The results are shown
in Figure P7.72.);*/

select concat(mem_fname,' ',mem_lname) as Membership_name ,
concat(mem_street,' ',mem_city,' ',mem_state,' ',mem_zip) 
as Membership_address from membership;

/*19. Write a query to display the rental number, rental date, video number, movie title, due date, and return date for all videos that were
returned after the due date. Sort the results by rental number and movie title. (The results are shown in Figure P7.73.);*/

select r.rent_num,r.rent_date,v.vid_num,movie_title,detail_duedate,detail_returndate 
from membership as m 
inner join rental as r on m.mem_num = mem_num 
inner join detailrental as dr on r.rent_num = dr.rent_num 
inner join video as v on dr.vid_num = v.vid_num 
inner join movie as o on v.movie_num;

/*20. Write a query to display the rental number, rental date, video number, movie title, due date, return date, detail fee, and number of days
past the due date that the video was returned for each video that was returned after the due date. Sort the results by rental number and
movie title. (The results are shown in Figure P7.74.);*/

select r.rent_num,r.rent_date,v.vid_num,o.movie_title,detail_duedate,detail_returndate ,datediff(detail_duedate,detail_returndate) as days_past_due 
from membership as m 
inner join rental as r on m.mem_num = mem_num 
inner join detailrental as dr on r.rent_num = dr.rent_num 
inner join video as v on dr.vid_num = v.vid_num 
inner join movie as o on v.movie_num;

/*21.Write a query to display the rental number, rental date, movie title, and detail fee for each movie that was returned on or before the due
date. (The results are shown in Figure P7.75.);*/


select r.rent_num ,r.rent_date,movie_title,detail_face as 'detail fee'
from membership as m 
inner join rental as r on m.mem_num = mem_num 
inner join detailrental as dr on r.rent_num = dr.rent_num 
inner join video as v on dr.vid_num = v.vid_num 
inner join movie as o on v.movie_num
group by rent_date,movie_title;

/*22. Write a query to display the membership number, last name, first name, and total rental fees earnedfrom that membership. (The results
are shown in Figure P7.76.) The total rental fee is the sum of all of the detail fees (without the late fees) from all movies that the
membership has rented.;*/

select mem_num,mem_lname,mem_fname ,sum(detail_face) as 'retnal fee'
from membership as m 
inner join rental as r on m.mem_num = mem_num 
inner join detailrental as dr on r.rent_num =dr.rent_num 
group by mem_num,mem_lname;

/*23. Write a query to display the movie number, movie genre, average movie cost of movies in that genre, movie cost of that individual movie,
and the percentage difference between the average movie cost and the individual movie cost. (The results are shown in Figure P7.77.)
(Note: The percentage difference is calculated as the cost of the individual movie minus the average cost of movies in that genre, divided
by the average cost of movies in that genre multiplied by 100. For example, if the average cost of movies in the “family” genre is $25, if a
given family movie cost $26, then the calculation would be ((26 – 25) / 25 * 100), which would work out to be 4.00%. This indicates that
this movie costs 4% more than the average family movie.);*/

select movie_num,movie_genre ,avg(movie_cost) as 'avg movie cost' ,movie_cost, (movie_cost - avg(movie_cost)) / avg(movie_cost) * 100  as 'perecent difference'
from movie group by movie_genre;

/*24.Alter the DETAILRENTAL table to include a derived attribute named DETAIL_DAYSLATE to store integers up to 3 digits. The attribute
should accept null values;*/

alter table detailrental add detail_dayslate real(3,0);

/*25.Alter the VIDEO table to include an attribute named VID_STATUS to store character data up to 4 characters long. The attribute should not
accept null values. The attribute should have a constraint to enforce the domain (“IN”, “OUT”, and “LOST”) and have a default value of
“IN”;*/
alter table video add vid_status varchar(4) default 'in' not null
check(vid_status in('in','out','lost'));

/*26.Update the VID_STATUS attribute of the VIDEO table using a subquery to set the VID_STATUS to “OUT” for all videos that have a null
value in the DETAIL_RETURNDATE attribute of the DETAILRENTAL table.;*/
update video
set vid_status = 'out'
where vid_num in(select vid_num from detailrental where detail_returndate is null);

/*27.*/
alter table price
add price_rentdays double(2,0) not null default 3;

/*28.. Update the PRICE table to place the values shown in the following table in the PRICE_RENTDAYS attribute*/
update price
set price_rentdays = 5 where price_code in(1,3);

update price
set price_rentdays = 7 where price_code =4;

/*Create a stored procedure named prc_new_rental to insert new rows in the RENTAL table. The procedure should satisfy the following
conditions.
a. The membership number will be provided as a parameter.
b. Use a Count () function to verify that the membership number exists in the MEMBERSHIP table. If it does not exist, then a message
should be displayed stating that the membership does not exist and no data should be written to the database.
c. If the membership does exist, then retrieve the membership balance and display a message stating the balance amount as the
previous balance. (For example, if the membership has a balance of $5.00, then display “Previous balance: $5.00”.
d. Insert a new row in the rental table using the sequence created in #42 above to generate the value for RENT_NUM, the current
system date for the value for RENT_DATE, and the membership number provided as the value for MEM_NUM.*/
DELIMITER //   
CREATE PROCEDURE PRC_NEW_RENTAL(IN Rental VARCHAR(255))
 BEGIN
 SELECT COUNT(mem_num) FROM Rental;
 if mem_num is not null then;
 select "The membership does not exist and no data should be written to the database."
 else mem_num is null then SELECT MEM_BALANCE INTO PREV_MEM_BALANCE FROM MEMBERSHIP

  
 END ; //
