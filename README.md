# PROJECT 1 - REVATURE - MICHAEL STANCO

## Project Description

Project 1 will consist of using big data tools to answer questions about datasets from Wikipedia. There are a series of basic analysis questions.

The questions should be answered using Hive or MapReduce. Feel free to use whichever tool seems best to you given the question or a combination of the two. For each question you should have a repeatable process that would work on a larger dataset, not just an ad hoc calculation.

    1. Which English wikipedia article got the most traffic on January 20, 2021?
    2. What English wikipedia article has the largest fraction of its readers follow an internal link to another wikipedia article?
    3. What series of wikipedia articles, starting with Hotel California, keeps the largest fraction of its readers clicking on internal links? This is similar to (2), but you should continue the analysis past the first article. There are multiple ways you can count this fraction, be careful to be clear about the method you find most appropriate.
    4. Find an example of an English wikipedia article that is relatively more popular in the Americas than elsewhere. There is no location data associated with the wikipedia pageviews data, but there are timestamps. You'll need to make some assumptions about internet usage over the hours of the day.
    5. Analyze how many users will see the average vandalized wikipedia page before the offending edit is reversed.
    6. Run an analysis you find interesting on the wikipedia datasets we're using.
    
Bring a simple slide deck providing an overview of your results. You should present your results, a high level overview of the process used to achieve those results, and any assumptions and simplifications you made on the way to those results.

## Technologies Used

* Hadoop MapReduce
* YARN
* HDFS
* Scala 2.13
* Hive
* Git + GitHub

## Features

For the above questions, there are executable Hive queries to perform sufficient analysis. 

A link to slide results can be found here:
https://docs.google.com/presentation/d/1L9MIHEpRBYj0WIZQaeFdwf5Ojmu87NPQDjmXIFCATlY/edit?usp=sharing

## Getting Started - Windows & Unix

Run the following commands line by line to emulate my project environment:<br/>
git clone https://github.com/MichaelStanco/project1 <br/>
cd project1<br/>
mkdir q1<br/>
cd q1<br/>
wget https://dumps.wikimedia.org/other/pageviews/2021/2021-01/pageviews-20210120-000000.gz <br/>
wget https://dumps.wikimedia.org/other/pageviews/2021/2021-01/pageviews-20210120-010000.gz <br/>
wget https://dumps.wikimedia.org/other/pageviews/2021/2021-01/pageviews-20210120-020000.gz <br/>
wget https://dumps.wikimedia.org/other/pageviews/2021/2021-01/pageviews-20210120-030000.gz <br/>
wget https://dumps.wikimedia.org/other/pageviews/2021/2021-01/pageviews-20210120-040000.gz <br/>
wget https://dumps.wikimedia.org/other/pageviews/2021/2021-01/pageviews-20210120-050000.gz <br/>
wget https://dumps.wikimedia.org/other/pageviews/2021/2021-01/pageviews-20210120-060000.gz <br/>
wget https://dumps.wikimedia.org/other/pageviews/2021/2021-01/pageviews-20210120-070000.gz <br/>
wget https://dumps.wikimedia.org/other/pageviews/2021/2021-01/pageviews-20210120-080000.gz <br/>
wget https://dumps.wikimedia.org/other/pageviews/2021/2021-01/pageviews-20210120-090000.gz <br/>
wget https://dumps.wikimedia.org/other/pageviews/2021/2021-01/pageviews-20210120-100000.gz <br/>
wget https://dumps.wikimedia.org/other/pageviews/2021/2021-01/pageviews-20210120-110000.gz <br/>
wget https://dumps.wikimedia.org/other/pageviews/2021/2021-01/pageviews-20210120-120000.gz <br/>
wget https://dumps.wikimedia.org/other/pageviews/2021/2021-01/pageviews-20210120-130000.gz <br/>
wget https://dumps.wikimedia.org/other/pageviews/2021/2021-01/pageviews-20210120-140000.gz <br/>
wget https://dumps.wikimedia.org/other/pageviews/2021/2021-01/pageviews-20210120-150000.gz <br/>
wget https://dumps.wikimedia.org/other/pageviews/2021/2021-01/pageviews-20210120-160000.gz <br/>
wget https://dumps.wikimedia.org/other/pageviews/2021/2021-01/pageviews-20210120-170000.gz <br/>
wget https://dumps.wikimedia.org/other/pageviews/2021/2021-01/pageviews-20210120-180000.gz <br/>
wget https://dumps.wikimedia.org/other/pageviews/2021/2021-01/pageviews-20210120-190000.gz <br/>
wget https://dumps.wikimedia.org/other/pageviews/2021/2021-01/pageviews-20210120-200000.gz <br/>
wget https://dumps.wikimedia.org/other/pageviews/2021/2021-01/pageviews-20210120-210000.gz <br/>
wget https://dumps.wikimedia.org/other/pageviews/2021/2021-01/pageviews-20210120-220000.gz <br/>
wget https://dumps.wikimedia.org/other/pageviews/2021/2021-01/pageviews-20210120-230000.gz <br/>
gunzip *.gz<br/>
cd ..<br/>
mkdir revisiondata<br/>
cd revisiondata<br/>
wget https://dumps.wikimedia.org/other/mediawiki_history/2020-12/enwiki/2020-12.enwiki.2020-12.tsv.bz2    <br/>
bzip2 -d 2020-12.enwiki.2020-12.tsv.bz2  <br/>
cd ..<br/>
mkdir clickstreamdata<br/>
cd clickstreamdata<br/>
wget https://dumps.wikimedia.org/other/clickstream/2020-12/clickstream-enwiki-2020-12.tsv.gz <br/>
wget https://dumps.wikimedia.org/other/clickstream/2020-12/clickstream-enwiki-2020-11.tsv.gz   <br/>
wget https://dumps.wikimedia.org/other/clickstream/2020-12/clickstream-enwiki-2020-10.tsv.gz   <br/>
wget https://dumps.wikimedia.org/other/clickstream/2020-12/clickstream-enwiki-2020-09.tsv.gz   <br/>
gunzip *.gz<br/>
cd ..<br/>
mkdir q4<br/>
cd q4<br/>
wget https://dumps.wikimedia.org/other/pageviews/2020/2020-12/pageviews-20201211-090000.gz<br/>
wget https://dumps.wikimedia.org/other/pageviews/2020/2020-12/pageviews-20201211-000000.gz<br/>
gunzip *.gz<br/>



## Usage

Load queries into Hive and execute in the following order:
- you may have to uncomment some load table blocks
- change LOAD DATA LOCAL INPATH to your created project1 directory from above
* populateDBproj1.sql
* proj1_1.sql
* proj1_2.sql
* proj1_3.sql
* proj1_4.sql
* proj1_5.sql
* proj1_6.sql

## Contributors

Michael Stanco

## License

This project uses the following license: [MIT License](https://mit-license.org/).
