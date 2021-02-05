USE project1;

--Analyze how many users will see the average vandalized wikipedia page before the offending edit is reversed.

--select * from revisions;

--get vandalized pages
drop view vandalized_pages;
create view vandalized_pages as
select event_entity, event_comment, page_title, page_seconds_since_previous_revision
from revisions
where event_entity = 'revision' and event_comment like '%vandal%';


--get users per second in dec
drop view dec_users;
CREATE view dec_users as
select curr, sum(num_occurences/2678400) as users_per_sec from clickstream 
group by curr;

drop view title_w_revision_users;
create view title_w_revision_users as
select vandalized_pages.page_title, sum(dec_users.users_per_sec * vandalized_pages.page_seconds_since_previous_revision)
as users_per_revision
from vandalized_pages
inner join dec_users on dec_users.curr = vandalized_pages.page_title
group by vandalized_pages.page_title;


select avg(users_per_revision) as users_per_vandalize from title_w_revision_users;
