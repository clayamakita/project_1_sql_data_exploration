-- 1 DATA IMPORT AND PREPARATION

-- import flat file of CovidDeaths.csv
	-- change only data type of date column: from varchar to data do banco de dados (DT_DBDATE)

-- write script to replace empty values with NULL in all columns
SELECT 'UPDATE CovidDeaths SET ' + name + ' = NULL WHERE ' + name + ' = '''';'
FROM syscolumns
WHERE id = object_id('CovidDeaths')
  AND isnullable = 1;

-- copy output and run the scripts
UPDATE CovidDeaths SET iso_code = NULL WHERE iso_code = '';
UPDATE CovidDeaths SET continent = NULL WHERE continent = '';
UPDATE CovidDeaths SET location = NULL WHERE location = '';
UPDATE CovidDeaths SET date = NULL WHERE date = '';
UPDATE CovidDeaths SET population = NULL WHERE population = '';
UPDATE CovidDeaths SET total_cases = NULL WHERE total_cases = '';
UPDATE CovidDeaths SET new_cases = NULL WHERE new_cases = '';
UPDATE CovidDeaths SET new_cases_smoothed = NULL WHERE new_cases_smoothed = '';
UPDATE CovidDeaths SET total_deaths = NULL WHERE total_deaths = '';
UPDATE CovidDeaths SET new_deaths = NULL WHERE new_deaths = '';
UPDATE CovidDeaths SET new_deaths_smoothed = NULL WHERE new_deaths_smoothed = '';
UPDATE CovidDeaths SET total_cases_per_million = NULL WHERE total_cases_per_million = '';
UPDATE CovidDeaths SET new_cases_per_million = NULL WHERE new_cases_per_million = '';
UPDATE CovidDeaths SET new_cases_smoothed_per_million = NULL WHERE new_cases_smoothed_per_million = '';
UPDATE CovidDeaths SET total_deaths_per_million = NULL WHERE total_deaths_per_million = '';
UPDATE CovidDeaths SET new_deaths_per_million = NULL WHERE new_deaths_per_million = '';
UPDATE CovidDeaths SET new_deaths_smoothed_per_million = NULL WHERE new_deaths_smoothed_per_million = '';
UPDATE CovidDeaths SET reproduction_rate = NULL WHERE reproduction_rate = '';
UPDATE CovidDeaths SET icu_patients = NULL WHERE icu_patients = '';
UPDATE CovidDeaths SET icu_patients_per_million = NULL WHERE icu_patients_per_million = '';
UPDATE CovidDeaths SET hosp_patients = NULL WHERE hosp_patients = '';
UPDATE CovidDeaths SET hosp_patients_per_million = NULL WHERE hosp_patients_per_million = '';
UPDATE CovidDeaths SET weekly_icu_admissions = NULL WHERE weekly_icu_admissions = '';
UPDATE CovidDeaths SET weekly_icu_admissions_per_million = NULL WHERE weekly_icu_admissions_per_million = '';
UPDATE CovidDeaths SET weekly_hosp_admissions = NULL WHERE weekly_hosp_admissions = '';
UPDATE CovidDeaths SET weekly_hosp_admissions_per_million = NULL WHERE weekly_hosp_admissions_per_million = '';

-- verify the results from the scripts
SELECT *
FROM CovidDeaths;

-- write script to change data type from charvar to float in almost all columns
SELECT 'ALTER TABLE CovidDeaths ALTER COLUMN ' + name + ' FLOAT;'
FROM syscolumns
WHERE id = object_id('CovidDeaths')
  AND isnullable = 1;

-- copy output from script and run the scripts from the columns that need to be changed
ALTER TABLE CovidDeaths ALTER COLUMN population FLOAT;
ALTER TABLE CovidDeaths ALTER COLUMN total_cases FLOAT;
ALTER TABLE CovidDeaths ALTER COLUMN new_cases FLOAT;
ALTER TABLE CovidDeaths ALTER COLUMN new_cases_smoothed FLOAT;
ALTER TABLE CovidDeaths ALTER COLUMN total_deaths FLOAT;
ALTER TABLE CovidDeaths ALTER COLUMN new_deaths FLOAT;
ALTER TABLE CovidDeaths ALTER COLUMN new_deaths_smoothed FLOAT;
ALTER TABLE CovidDeaths ALTER COLUMN total_cases_per_million FLOAT;
ALTER TABLE CovidDeaths ALTER COLUMN new_cases_per_million FLOAT;
ALTER TABLE CovidDeaths ALTER COLUMN new_cases_smoothed_per_million FLOAT;
ALTER TABLE CovidDeaths ALTER COLUMN total_deaths_per_million FLOAT;
ALTER TABLE CovidDeaths ALTER COLUMN new_deaths_per_million FLOAT;
ALTER TABLE CovidDeaths ALTER COLUMN new_deaths_smoothed_per_million FLOAT;
ALTER TABLE CovidDeaths ALTER COLUMN reproduction_rate FLOAT;
ALTER TABLE CovidDeaths ALTER COLUMN icu_patients FLOAT;
ALTER TABLE CovidDeaths ALTER COLUMN icu_patients_per_million FLOAT;
ALTER TABLE CovidDeaths ALTER COLUMN hosp_patients FLOAT;
ALTER TABLE CovidDeaths ALTER COLUMN hosp_patients_per_million FLOAT;
ALTER TABLE CovidDeaths ALTER COLUMN weekly_icu_admissions FLOAT;
ALTER TABLE CovidDeaths ALTER COLUMN weekly_icu_admissions_per_million FLOAT;
ALTER TABLE CovidDeaths ALTER COLUMN weekly_hosp_admissions FLOAT;
ALTER TABLE CovidDeaths ALTER COLUMN weekly_hosp_admissions_per_million FLOAT;

-- verify the results from the scripts
SELECT *
FROM CovidDeaths;

-- check few random total values with original table
SELECT SUM(population)
FROM CovidDeaths
WHERE date = '2020-01-01';

SELECT SUM(total_cases)
FROM CovidDeaths
WHERE date = '2020-07-30';

SELECT SUM(reproduction_rate)
FROM CovidDeaths
WHERE date = '2020-12-25';

SELECT SUM(icu_patients)
FROM CovidDeaths
WHERE date = '2021-03-07';


-- do the same steps with the CovidVaccinations database

-- import flat file of CovidVaccinations.csv
	-- change only data type of date column: from varchar to data do banco de dados (DT_DBDATE)

-- write script to replace empty values with NULL in all columns
SELECT 'UPDATE CovidVaccinations SET ' + name + ' = NULL WHERE ' + name + ' = '''';'
FROM syscolumns
WHERE id = object_id('CovidVaccinations')
  AND isnullable = 1;

-- copy output and run the scripts
UPDATE CovidVaccinations SET iso_code = NULL WHERE iso_code = '';
UPDATE CovidVaccinations SET continent = NULL WHERE continent = '';
UPDATE CovidVaccinations SET location = NULL WHERE location = '';
UPDATE CovidVaccinations SET date = NULL WHERE date = '';
UPDATE CovidVaccinations SET new_tests = NULL WHERE new_tests = '';
UPDATE CovidVaccinations SET total_tests = NULL WHERE total_tests = '';
UPDATE CovidVaccinations SET total_tests_per_thousand = NULL WHERE total_tests_per_thousand = '';
UPDATE CovidVaccinations SET new_tests_per_thousand = NULL WHERE new_tests_per_thousand = '';
UPDATE CovidVaccinations SET new_tests_smoothed = NULL WHERE new_tests_smoothed = '';
UPDATE CovidVaccinations SET new_tests_smoothed_per_thousand = NULL WHERE new_tests_smoothed_per_thousand = '';
UPDATE CovidVaccinations SET positive_rate = NULL WHERE positive_rate = '';
UPDATE CovidVaccinations SET tests_per_case = NULL WHERE tests_per_case = '';
UPDATE CovidVaccinations SET tests_units = NULL WHERE tests_units = '';
UPDATE CovidVaccinations SET total_vaccinations = NULL WHERE total_vaccinations = '';
UPDATE CovidVaccinations SET people_vaccinated = NULL WHERE people_vaccinated = '';
UPDATE CovidVaccinations SET people_fully_vaccinated = NULL WHERE people_fully_vaccinated = '';
UPDATE CovidVaccinations SET new_vaccinations = NULL WHERE new_vaccinations = '';
UPDATE CovidVaccinations SET new_vaccinations_smoothed = NULL WHERE new_vaccinations_smoothed = '';
UPDATE CovidVaccinations SET total_vaccinations_per_hundred = NULL WHERE total_vaccinations_per_hundred = '';
UPDATE CovidVaccinations SET people_vaccinated_per_hundred = NULL WHERE people_vaccinated_per_hundred = '';
UPDATE CovidVaccinations SET people_fully_vaccinated_per_hundred = NULL WHERE people_fully_vaccinated_per_hundred = '';
UPDATE CovidVaccinations SET new_vaccinations_smoothed_per_million = NULL WHERE new_vaccinations_smoothed_per_million = '';
UPDATE CovidVaccinations SET stringency_index = NULL WHERE stringency_index = '';
UPDATE CovidVaccinations SET population_density = NULL WHERE population_density = '';
UPDATE CovidVaccinations SET median_age = NULL WHERE median_age = '';
UPDATE CovidVaccinations SET aged_65_older = NULL WHERE aged_65_older = '';
UPDATE CovidVaccinations SET aged_70_older = NULL WHERE aged_70_older = '';
UPDATE CovidVaccinations SET gdp_per_capita = NULL WHERE gdp_per_capita = '';
UPDATE CovidVaccinations SET extreme_poverty = NULL WHERE extreme_poverty = '';
UPDATE CovidVaccinations SET cardiovasc_death_rate = NULL WHERE cardiovasc_death_rate = '';
UPDATE CovidVaccinations SET diabetes_prevalence = NULL WHERE diabetes_prevalence = '';
UPDATE CovidVaccinations SET female_smokers = NULL WHERE female_smokers = '';
UPDATE CovidVaccinations SET male_smokers = NULL WHERE male_smokers = '';
UPDATE CovidVaccinations SET handwashing_facilities = NULL WHERE handwashing_facilities = '';
UPDATE CovidVaccinations SET hospital_beds_per_thousand = NULL WHERE hospital_beds_per_thousand = '';
UPDATE CovidVaccinations SET life_expectancy = NULL WHERE life_expectancy = '';
UPDATE CovidVaccinations SET human_development_index = NULL WHERE human_development_index = '';
UPDATE CovidVaccinations SET excess_mortality = NULL WHERE excess_mortality = '';

-- verify the results from the scripts
SELECT *
FROM CovidVaccinations;

-- write script to change data type from charvar to float in almost all columns
SELECT 'ALTER TABLE CovidVaccinations ALTER COLUMN ' + name + ' FLOAT;'
FROM syscolumns
WHERE id = object_id('CovidVaccinations')
  AND isnullable = 1;

-- copy output and run the scripts from the columns that need to be changed
ALTER TABLE CovidVaccinations ALTER COLUMN new_tests FLOAT;
ALTER TABLE CovidVaccinations ALTER COLUMN total_tests FLOAT;
ALTER TABLE CovidVaccinations ALTER COLUMN total_tests_per_thousand FLOAT;
ALTER TABLE CovidVaccinations ALTER COLUMN new_tests_per_thousand FLOAT;
ALTER TABLE CovidVaccinations ALTER COLUMN new_tests_smoothed FLOAT;
ALTER TABLE CovidVaccinations ALTER COLUMN new_tests_smoothed_per_thousand FLOAT;
ALTER TABLE CovidVaccinations ALTER COLUMN positive_rate FLOAT;
ALTER TABLE CovidVaccinations ALTER COLUMN tests_per_case FLOAT;
ALTER TABLE CovidVaccinations ALTER COLUMN total_vaccinations FLOAT;
ALTER TABLE CovidVaccinations ALTER COLUMN people_vaccinated FLOAT;
ALTER TABLE CovidVaccinations ALTER COLUMN people_fully_vaccinated FLOAT;
ALTER TABLE CovidVaccinations ALTER COLUMN new_vaccinations FLOAT;
ALTER TABLE CovidVaccinations ALTER COLUMN new_vaccinations_smoothed FLOAT;
ALTER TABLE CovidVaccinations ALTER COLUMN total_vaccinations_per_hundred FLOAT;
ALTER TABLE CovidVaccinations ALTER COLUMN people_vaccinated_per_hundred FLOAT;
ALTER TABLE CovidVaccinations ALTER COLUMN people_fully_vaccinated_per_hundred FLOAT;
ALTER TABLE CovidVaccinations ALTER COLUMN new_vaccinations_smoothed_per_million FLOAT;
ALTER TABLE CovidVaccinations ALTER COLUMN stringency_index FLOAT;
ALTER TABLE CovidVaccinations ALTER COLUMN population_density FLOAT;
ALTER TABLE CovidVaccinations ALTER COLUMN median_age FLOAT;
ALTER TABLE CovidVaccinations ALTER COLUMN aged_65_older FLOAT;
ALTER TABLE CovidVaccinations ALTER COLUMN aged_70_older FLOAT;
ALTER TABLE CovidVaccinations ALTER COLUMN gdp_per_capita FLOAT;
ALTER TABLE CovidVaccinations ALTER COLUMN extreme_poverty FLOAT;
ALTER TABLE CovidVaccinations ALTER COLUMN cardiovasc_death_rate FLOAT;
ALTER TABLE CovidVaccinations ALTER COLUMN diabetes_prevalence FLOAT;
ALTER TABLE CovidVaccinations ALTER COLUMN female_smokers FLOAT;
ALTER TABLE CovidVaccinations ALTER COLUMN male_smokers FLOAT;
ALTER TABLE CovidVaccinations ALTER COLUMN handwashing_facilities FLOAT;
ALTER TABLE CovidVaccinations ALTER COLUMN hospital_beds_per_thousand FLOAT;
ALTER TABLE CovidVaccinations ALTER COLUMN life_expectancy FLOAT;
ALTER TABLE CovidVaccinations ALTER COLUMN human_development_index FLOAT;
ALTER TABLE CovidVaccinations ALTER COLUMN excess_mortality FLOAT;

-- verify the results from the scripts
SELECT *
FROM CovidVaccinations;

-- check few random total values with original table
SELECT SUM(total_tests)
FROM CovidVaccinations
WHERE date = '2020-02-28';

SELECT SUM(total_vaccinations)
FROM CovidVaccinations
WHERE location = 'Brazil';

SELECT SUM(people_fully_vaccinated)
FROM CovidVaccinations
WHERE date = '2021-05-31';

SELECT SUM(diabetes_prevalence)
FROM CovidVaccinations
WHERE date = '2020-12-15';

