USE project1;

--sudo su hdfs -l -c 'hdfs nyystanco6 -safemode leave'

--load in pageviews data for 01/20/21
/*
CREATE TABLE q1 (
	domain_code string,
	page_title string,
	count_views int,
	total_response_size int)
	ROW FORMAT DELIMITED
	FIELDS TERMINATED BY ' '
	TBLPROPERTIES("skip.header.line.count"="0");

LOAD DATA LOCAL INPATH '/home/nyystanco6/projects/project1/q1/pageviews-20210120-000000' INTO TABLE q1;
LOAD DATA LOCAL INPATH '/home/nyystanco6/projects/project1/q1/pageviews-20210120-010000' INTO TABLE q1;
LOAD DATA LOCAL INPATH '/home/nyystanco6/projects/project1/q1/pageviews-20210120-020000' INTO TABLE q1;
LOAD DATA LOCAL INPATH '/home/nyystanco6/projects/project1/q1/pageviews-20210120-030000' INTO TABLE q1;
LOAD DATA LOCAL INPATH '/home/nyystanco6/projects/project1/q1/pageviews-20210120-040000' INTO TABLE q1;
LOAD DATA LOCAL INPATH '/home/nyystanco6/projects/project1/q1/pageviews-20210120-050000' INTO TABLE q1;
LOAD DATA LOCAL INPATH '/home/nyystanco6/projects/project1/q1/pageviews-20210120-060000' INTO TABLE q1;
LOAD DATA LOCAL INPATH '/home/nyystanco6/projects/project1/q1/pageviews-20210120-070000' INTO TABLE q1;
LOAD DATA LOCAL INPATH '/home/nyystanco6/projects/project1/q1/pageviews-20210120-080000' INTO TABLE q1;
--
LOAD DATA LOCAL INPATH '/home/nyystanco6/projects/project1/q1/pageviews-20210120-090000' INTO TABLE q1;
LOAD DATA LOCAL INPATH '/home/nyystanco6/projects/project1/q1/pageviews-20210120-100000' INTO TABLE q1;
LOAD DATA LOCAL INPATH '/home/nyystanco6/projects/project1/q1/pageviews-20210120-110000' INTO TABLE q1;
LOAD DATA LOCAL INPATH '/home/nyystanco6/projects/project1/q1/pageviews-20210120-120000' INTO TABLE q1;
LOAD DATA LOCAL INPATH '/home/nyystanco6/projects/project1/q1/pageviews-20210120-130000' INTO TABLE q1;
LOAD DATA LOCAL INPATH '/home/nyystanco6/projects/project1/q1/pageviews-20210120-140000' INTO TABLE q1;
LOAD DATA LOCAL INPATH '/home/nyystanco6/projects/project1/q1/pageviews-20210120-150000' INTO TABLE q1;
LOAD DATA LOCAL INPATH '/home/nyystanco6/projects/project1/q1/pageviews-20210120-160000' INTO TABLE q1;
--
LOAD DATA LOCAL INPATH '/home/nyystanco6/projects/project1/q1/pageviews-20210120-170000' INTO TABLE q1;
LOAD DATA LOCAL INPATH '/home/nyystanco6/projects/project1/q1/pageviews-20210120-180000' INTO TABLE q1;
LOAD DATA LOCAL INPATH '/home/nyystanco6/projects/project1/q1/pageviews-20210120-190000' INTO TABLE q1;
LOAD DATA LOCAL INPATH '/home/nyystanco6/projects/project1/q1/pageviews-20210120-200000' INTO TABLE q1;
LOAD DATA LOCAL INPATH '/home/nyystanco6/projects/project1/q1/pageviews-20210120-210000' INTO TABLE q1;
LOAD DATA LOCAL INPATH '/home/nyystanco6/projects/project1/q1/pageviews-20210120-220000' INTO TABLE q1;
LOAD DATA LOCAL INPATH '/home/nyystanco6/projects/project1/q1/pageviews-20210120-230000' INTO TABLE q1;

ALTER TABLE q1 RENAME TO pageviews01202021;
*/

--load in wiki revisions data

drop table revisions;

CREATE TABLE  revisions (
	wiki_db 	string ,
	event_entity 	string,
	event_type 	string ,
	event_timestamp 	string ,
	event_comment 	string ,
	event_user_id 	bigint ,
	event_user_text_historical 	string ,
	event_user_text 	string ,
	event_user_blocks_historical 	array<string>,
	event_user_blocks 	array<string>,
	event_user_groups_historical 	array<string>,
	event_user_groups 	array<string>,
	event_user_is_bot_by_historical 	array<string>,
	event_user_is_bot_by 	array<string>,
	event_user_is_created_by_self 	boolean ,
	event_user_is_created_by_system 	boolean ,
	event_user_is_created_by_peer 	boolean ,
	event_user_is_anonymous 	boolean ,
	event_user_registration_timestamp 	string ,
	event_user_creation_timestamp 	string ,
	event_user_first_edit_timestamp 	string ,
	event_user_revision_count 	bigint ,
	event_user_seconds_since_previous_revision 	bigint ,
	page_id 	bigint ,
	page_title_historical 	string ,
	page_title 	string ,
	page_namespace_is_content_historical 	boolean ,
	page_namespace 	int ,
	page_namespace_is_content 	boolean ,
	page_is_redirect 	boolean ,
	page_is_deleted 	boolean ,
	page_creation_timestamp 	string ,
	page_first_edit_timestamp 	string ,
	page_revision_count 	bigint ,
	page_seconds_since_previous_revision 	bigint ,
	user_id 	bigint ,
	user_text_historical 	string ,
	user_text 	string ,
	user_blocks_historical 	array<string>,
	user_blocks 	array<string>,
	user_groups_historical 	array<string>,
	user_groups 	array<string>,
	user_is_bot_by_historical 	array<string>,
	user_is_bot_by 	array<string>,
	user_is_created_by_self 	boolean ,
	user_is_created_by_system 	boolean ,
	user_is_created_by_peer 	boolean ,
	user_is_anonymous 	boolean ,
	user_registration_timestamp 	string ,
	user_creation_timestamp 	string ,
	user_first_edit_timestamp 	string ,
	revision_id 	bigint ,
	revision_parent_id 	bigint ,
	revision_minor_edit 	boolean ,
	revision_deleted_parts 	array<string>,
	revision_deleted_parts_are_suppressed 	boolean,
	revision_text_bytes 	bigint ,
	revision_text_bytes_diff 	bigint ,
	revision_text_sha1 	string ,
	revision_content_model 	string ,
	revision_content_format 	string ,
	revision_is_deleted_by_page_deletion 	boolean ,
	revision_deleted_by_page_deletion_timestamp 	string ,
	revision_is_identity_reverted 	boolean,
	revision_first_identity_reverting_revision_id 	bigint ,
	revision_seconds_to_identity_revert 	bigint ,
	revision_is_identity_revert 	boolean ,
	revision_is_from_before_page_creation 	boolean,
	revision_tags 	array<string>)
	ROW FORMAT DELIMITED
	FIELDS TERMINATED BY '\t';
LOAD DATA LOCAL INPATH '/home/nyystanco6/projects/project1/revisiondata/2020-12.enwiki.2020-12.tsv' INTO TABLE revisions;


--load in clickstream data

drop table clickstream;
CREATE TABLE clickstream (
		prev string,
		curr string,
		type_of string,
		num_occurences int
	)
	ROW FORMAT DELIMITED
	FIELDS TERMINATED BY '\t';

LOAD DATA LOCAL INPATH '/home/nyystanco6/projects/project1/clickstreamdata/clickstream-enwiki-2020-12.tsv' INTO TABLE clickstream;

--select * from clickstream ;


--december extrapolation as monthly data
--2 dates worth of data used for extrapolation:

--Sunday, Dec. 13
--Wednesday, Dec. 23

--every 3 hours
/*
drop table december_extrap;
CREATE TABLE december_extrap (
	domain_code string,
	page_title string,
	count_views int,
	total_response_size int)
	ROW FORMAT DELIMITED
	FIELDS TERMINATED BY ' '
	TBLPROPERTIES("skip.header.line.count"="0");

--dec13data
LOAD DATA LOCAL INPATH '/home/nyystanco6/projects/project1/december_extrap/pageviews-20201213-000000' INTO TABLE december_extrap;

LOAD DATA LOCAL INPATH '/home/nyystanco6/projects/project1/december_extrap/pageviews-20201213-030000' INTO TABLE december_extrap;

LOAD DATA LOCAL INPATH '/home/nyystanco6/projects/project1/december_extrap/pageviews-20201213-060000' INTO TABLE december_extrap;

LOAD DATA LOCAL INPATH '/home/nyystanco6/projects/project1/december_extrap/pageviews-20201213-090000' INTO TABLE december_extrap;

LOAD DATA LOCAL INPATH '/home/nyystanco6/projects/project1/december_extrap/pageviews-20201213-120000' INTO TABLE december_extrap;

LOAD DATA LOCAL INPATH '/home/nyystanco6/projects/project1/december_extrap/pageviews-20201213-150000' INTO TABLE december_extrap;

LOAD DATA LOCAL INPATH '/home/nyystanco6/projects/project1/december_extrap/pageviews-20201213-180000' INTO TABLE december_extrap;

LOAD DATA LOCAL INPATH '/home/nyystanco6/projects/project1/december_extrap/pageviews-20201213-230000' INTO TABLE december_extrap;

--dec 23
LOAD DATA LOCAL INPATH '/home/nyystanco6/projects/project1/december_extrap/pageviews-20201223-000000' INTO TABLE december_extrap;

LOAD DATA LOCAL INPATH '/home/nyystanco6/projects/project1/december_extrap/pageviews-20201223-030000' INTO TABLE december_extrap;

LOAD DATA LOCAL INPATH '/home/nyystanco6/projects/project1/december_extrap/pageviews-20201223-060000' INTO TABLE december_extrap;

LOAD DATA LOCAL INPATH '/home/nyystanco6/projects/project1/december_extrap/pageviews-20201223-090000' INTO TABLE december_extrap;

LOAD DATA LOCAL INPATH '/home/nyystanco6/projects/project1/december_extrap/pageviews-20201223-120000' INTO TABLE december_extrap;

LOAD DATA LOCAL INPATH '/home/nyystanco6/projects/project1/december_extrap/pageviews-20201223-150000' INTO TABLE december_extrap;

LOAD DATA LOCAL INPATH '/home/nyystanco6/projects/project1/december_extrap/pageviews-20201223-180000' INTO TABLE december_extrap;

LOAD DATA LOCAL INPATH '/home/nyystanco6/projects/project1/december_extrap/pageviews-20201223-230000' INTO TABLE december_extrap;
*/

