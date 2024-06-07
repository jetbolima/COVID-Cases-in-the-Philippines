-- 3.1. create a fast view for yearly regional percentage
-- of COVID cases as the millions of rows is slowing the query.

create materialized view covid_case_information.yearly_regional_case_percent as
	
	with first_cases as(
		select
			regionres,
			round(count(*) * 100/ 
				sum(count(*)) over(),2) as regional_percentage_2020
		from covid_case_information.nov_batch_clean
		where extract(year from daterepconf) = '2020'
		group by regionres),
	
	second_cases as (
		select
			regionres,
			round(count(*) * 100/
				sum(count(*)) over (),2) as regional_percentage_2021
		from covid_case_information.nov_batch_clean
		where extract(year from daterepconf) = '2021'
		group by regionres
	),
	
	third_cases as (
		select
			regionres,
			round(count(*) * 100/
				sum(count(*)) over (),2) as regional_percentage_2022
		from covid_case_information.nov_batch_clean as main
		where extract(year from daterepconf) = '2022'
		group by regionres
		)
	
	select
		f.regionres,
		f.regional_percentage_2020,
		s.regional_percentage_2021,
		t.regional_percentage_2022
	from first_cases as f
	join second_cases as s
		on f.regionres=s.regionres
	join third_cases as t
		on s.regionres=t.regionres
	
with data;


-- 3.2. create a fast view for total number of cases per health status
-- according to the age group.

create materialized view agegroup_healthstatus_count as
	select
		agegroup,
		healthstatus,
		count(*)
	from covid_case_information.nov_batch_clean
	group by agegroup,healthstatus
with data;