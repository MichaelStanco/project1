USE project1;

--What series of wikipedia articles, starting with Hotel California, keeps the largest fraction of its readers clicking on internal links? 
--This is similar to (2), but you should continue the analysis past the first article. There are multiple ways you can count this fraction, 
--be careful to be clear about the method you find most appropriate.

--select * from clickstream where prev like 'Hotel_California%'
drop view link_hotel ;
create view link_hotel as
select * from clickstream where prev = 'Hotel_California' and type_of = 'link';

--create view for total views dec 2020
drop view total;
CREATE view total as
select curr, sum(num_occurences) as total_views from clickstream 
group by curr;

--get fraction of users from Hotel_Calif

--join link and total views from q2
drop view link;
create view link as
select prev, type_of, sum(num_occurences) as link_occurences from clickstream 
where type_of = 'link'
group by prev, type_of;

drop view q2_prop;
create view q2_prop as
select link.prev as page_title, sum(link.link_occurences/total.total_views) as prop_follow_link from link 
inner join total on total.curr = link.prev
group by link.prev
order by prop_follow_link desc;


--master query answer for #3
select phase3.hotel_calif_title, phase3.title_after_hotel, phase3.title_x4 as third_title_visited,
sum(phase3.phase2_fraction * q2_prop.prop_follow_link) as proportion_takes_this_path
from q2_prop inner join
(select phase2_pre.hotel_calif_title, phase2_pre.title_after_hotel, phase2_pre.title_x4, 
sum(phase2_pre.hotel_fraction * (phase2_pre.after_calif_occ/total.total_views)) as phase2_fraction 
from total 
inner join
(select phase1.hotel_calif_title, phase1.title_after_hotel, phase1.hotel_fraction, after_calif.prev as title_x3, 
after_calif.curr as title_x4, after_calif.num_occurences as after_calif_occ
from clickstream as after_calif
inner join
(select prev as hotel_calif_title, link_hotel.curr as title_after_hotel, sum(link_hotel.num_occurences/total.total_views) as hotel_fraction
from link_hotel
inner join total on total.curr = link_hotel.prev
group by prev, link_hotel.curr) as phase1
on phase1.title_after_hotel = after_calif.prev
where after_calif.type_of = 'link' and after_calif.curr <> 'Hotel_California') as phase2_pre
on total.curr = phase2_pre.title_x4
group by phase2_pre.hotel_calif_title, phase2_pre.title_after_hotel, phase2_pre.title_x4) as phase3
on phase3.title_x4 = q2_prop.page_title 
group by phase3.hotel_calif_title, phase3.title_after_hotel, phase3.title_x4
order by proportion_takes_this_path desc;








