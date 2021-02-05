USE project1;
--Find an example of an English wikipedia article that is relatively more popular in the Americas than elsewhere. 
--There is no location data associated with the wikipedia pageviews data, but there are timestamps. 
--You'll need to make some assumptions about internet usage over the hours of the day.

--friday dec 11
drop  table dec11_pgviews_9utc;
CREATE TABLE dec11_pgviews_9utc (
	domain_code string,
	page_title string,
	count_views int,
	total_response_size int)
	ROW FORMAT DELIMITED
	FIELDS TERMINATED BY ' '
	TBLPROPERTIES("skip.header.line.count"="0");
	
drop  table dec11_pgviews_0utc;
CREATE TABLE dec11_pgviews_0utc (
	domain_code string,
	page_title string,
	count_views int,
	total_response_size int)
	ROW FORMAT DELIMITED
	FIELDS TERMINATED BY ' '
	TBLPROPERTIES("skip.header.line.count"="0");	
LOAD DATA LOCAL INPATH '/home/nyystanco6/projects/project1/q4/pageviews-20201211-090000' INTO TABLE dec11_pgviews_9utc;
LOAD DATA LOCAL INPATH '/home/nyystanco6/projects/project1/q4/pageviews-20201211-000000' INTO TABLE dec11_pgviews_0utc;


select zero.page_title, sum(zero.count_views/nine.count_views) as us_popularity_rating
from dec11_pgviews_9utc as nine
inner join dec11_pgviews_0utc as zero on zero.page_title = nine.page_title 
where zero.count_views > 100 and nine.count_views > 100 and zero.page_title not in ('Main_Page', 'Special:Search', '-')
group by zero.page_title
order by us_popularity_rating desc;
