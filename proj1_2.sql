USE project1;

--What English wikipedia article has the largest fraction of its readers follow an internal link to another wikipedia article?

--*** APPROACH #2 USING CLICKSTREAM DATA ***

--create view for total views dec 2020
drop view total;
CREATE view total as
select curr, sum(num_occurences) as total_views from clickstream 
group by curr;


--create view for num of link follow occurences

drop view link;
create view link as
select prev, type_of, sum(num_occurences) as link_occurences from clickstream 
where type_of = 'link'
group by prev, type_of;


--test views
--select * from total where curr = 'Ronell_Wilson';
--select * from link where prev = 'Ronell_Wilson';

--join link and total views
select link.prev as page_title, sum(link.link_occurences/total.total_views) as prop_follow_link from link 
inner join total on total.curr = link.prev
where total.total_views > 10000 
group by link.prev
order by prop_follow_link desc;

/*
select link.prev, link.type_of, sum(link.num_occurences/total.total_views) as pct_follow_link 
from clickstream as link 
inner join total on total.curr = link.prev 
where link.type_of  = 'link'
group by link.prev, link.type_of
order by pct_follow_link desc ;
*/





--*** OLD INCORRECT APPROACH *** 

--select prev, count(*) as link_follows from clickstream where type_of = 'link' group by prev;

--multiply each column in december dataset to extrapolate (times 3 (to get 24 hours in a day) and times 31 (to get 31 days in month of Dec))


/*CREATE view total_views as
select domain_code, page_title , sum(count_views * 93) as dec_views , total_response_size 
from december_extrap 
group by domain_code , page_title , total_response_size;*/



/*
select subq.page_title, subq.num_occurences, subq.dec_views, sum(subq.num_occurences/subq.dec_views) as fraction from
(select page_title, num_occurences, dec_views, type_of from total_views as total inner join clickstream on clickstream.prev = total.page_title) as subq
where subq.type_of = 'link'
group by subq.page_title, subq.num_occurences, subq.dec_views
order by fraction desc;
*/