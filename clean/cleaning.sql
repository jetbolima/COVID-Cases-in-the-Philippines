-- 2.1. delete regions where it is null.

delete from covid_case_information.nov_batch_clean
where regionres is null;

-- 2.2. delete provinces that are null which are also not from
-- "Returning Overseas Filipino"

delete from covid_case_information.nov_batch_clean
where provres is null and regionres<>'ROF';

-- 2.3. delete cities that are null which are also not from
-- "Returning Overseas Filipino"

delete from covid_case_information.nov_batch_clean
where citymunres is null and regionres<>'ROF';

-- 2.4. delete admitted or quarantined where status is null.

delete from covid_case_information.nov_batch_clean
where admitted is null or quarantined is null;

-- 2.5. delete negative age or age that is null.

delete from covid_case_information.nov_batch_clean
where age is null or age < 0;

-- 2.6. delete null pregnant status if the sex is female.

delete from covid_case_information.nov_batch_clean
where sex = 'FEMALE' and pregnanttab is null;

-- 2.7. we are dropping validation status for cleaning purposes but
-- whether if this important is up to the reader.
-- The data can be appended to accomodate this column.

alter table covid_case_information.nov_batch_clean
drop column validation status;
