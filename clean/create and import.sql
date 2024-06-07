-- 1.1. create table for importing.

create table nov_batch_raw (
	CaseCode text NOT NULL,
	Age smallint,
	AgeGroup text,
	Sex varchar(50),
	DateSpecimen date,
	DateResultRelease date,
	DateRepConf date,
	DateDied date,
	DateRecover date,
	RemovalType text,
	Admitted bool,
	RegionRes text,
	ProvRes text,
	CityMunRes text,
	CityMuniPSGC text,
	BarangayRes text,
	BarangayPSGC text,
	HealthStatus text,
	Quarantined bool,
	DateOnset date,
	Pregnanttab text,
	ValidationStatus text
);


-- 1.2. import data.
-- there is a faster way of copying using PROGRAM but this
-- code is kept for documentation.

copy covid_case_information.nov_batch_raw from 'C:\Users\User\Desktop\Job Hunting\Porfolio Projects\covid_case_information\DOH COVID Case Information Batch 0.csv'
	with delimiter ',' csv header;

copy covid_case_information.nov_batch_raw from 'C:\Users\User\Desktop\Job Hunting\Porfolio Projects\covid_case_information\DOH COVID Case Information Batch 1.csv'
	with delimiter ',' csv header;

copy covid_case_information.nov_batch_raw from 'C:\Users\User\Desktop\Job Hunting\Porfolio Projects\covid_case_information\DOH COVID Case Information Batch 2.csv'
	with delimiter ',' csv header;

copy covid_case_information.nov_batch_raw from 'C:\Users\User\Desktop\Job Hunting\Porfolio Projects\covid_case_information\DOH COVID Case Information Batch 3.csv'
	with delimiter ',' csv header;

copy covid_case_information.nov_batch_raw from 'C:\Users\User\Desktop\Job Hunting\Porfolio Projects\covid_case_information\DOH COVID Case Information Batch 4.csv'
	with delimiter ',' csv header;


-- 1.3. duplicate table for cleaning and drop unneeded columns. 

create table covid_case_information.nov_batch_clean as
	select * from covid_case_information.nov_batch_raw;

alter table covid_case_information.nov_batch_clean
drop column datespecimen,
drop column dateresultrelease,
drop column datedied,
drop column daterecover,
drop column barangayres,
drop column barangaypsgc,
drop column dateonset;
