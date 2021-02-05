-- Which English wikipedia article got the most traffic on January 20, 2021?

USE project1;

--SELECT page_title, sum(count_views) as views1 FROM q1 group by page_title order by views1 desc;