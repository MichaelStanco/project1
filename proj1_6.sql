USE project1;

--Run an analysis you find interesting on the wikipedia datasets we're using.

--Mariah Carey as Christmas nears


--sept 2020 clickstreams
drop table clickstreamsept;
CREATE TABLE clickstreamsept (
		prev string,
		curr string,
		type_of string,
		num_occurences int
	)
	ROW FORMAT DELIMITED
	FIELDS TERMINATED BY '\t';

--oct 2020 clickstreams
drop table clickstreamoct;
CREATE TABLE clickstreamoct (
		prev string,
		curr string,
		type_of string,
		num_occurences int
	)
	ROW FORMAT DELIMITED
	FIELDS TERMINATED BY '\t';

--nov 2020 clickstreams
drop table clickstreamnov;
CREATE TABLE clickstreamnov (
		prev string,
		curr string,
		type_of string,
		num_occurences int
	)
	ROW FORMAT DELIMITED
	FIELDS TERMINATED BY '\t';

--dec 2020 clickstreams
drop table clickstreamdec;
CREATE TABLE clickstreamdec (
		prev string,
		curr string,
		type_of string,
		num_occurences int
	)
	ROW FORMAT DELIMITED
	FIELDS TERMINATED BY '\t';

LOAD DATA LOCAL INPATH '/home/nyystanco6/projects/project1/clickstreamdata/clickstream-enwiki-2020-12.tsv' INTO TABLE clickstreamdec;
LOAD DATA LOCAL INPATH '/home/nyystanco6/projects/project1/clickstreamdata/clickstream-enwiki-2020-11.tsv' INTO TABLE clickstreamnov;
LOAD DATA LOCAL INPATH '/home/nyystanco6/projects/project1/clickstreamdata/clickstream-enwiki-2020-10.tsv' INTO TABLE clickstreamoct;
LOAD DATA LOCAL INPATH '/home/nyystanco6/projects/project1/clickstreamdata/clickstream-enwiki-2020-09.tsv' INTO TABLE clickstreamsept;

drop view totaldec;
CREATE view totaldec as
select curr, sum(num_occurences) as total_views from clickstreamdec
where curr like 'Mariah_Carey%'
group by curr;

drop view totalnov;
CREATE view totalnov as
select curr, sum(num_occurences) as total_views from clickstreamnov
where curr like 'Mariah_Carey%'
group by curr;

drop view totaloct;
CREATE view totaloct as
select curr, sum(num_occurences) as total_views from clickstreamoct
where curr like 'Mariah_Carey%'
group by curr;

drop view totalsept;
CREATE view totalsept as
select curr, sum(num_occurences) as total_views from clickstreamsept
where curr like 'Mariah_Carey%'
group by curr;


select b.page_title, totalsept.total_views as sept_views,oct_views, nov_views, dec_views 
from totalsept inner join 
(
select a.page_title, totaloct.total_views as oct_views, nov_views, dec_views 
from totaloct inner join 
(
select totalnov.curr as page_title, totalnov.total_views as nov_views, totaldec.total_views as dec_views
from totaldec 
inner join totalnov 
on totalnov.curr = totaldec.curr
) as a 
on a.page_title = totaloct.curr) as b
on b.page_title = totalsept.curr;





