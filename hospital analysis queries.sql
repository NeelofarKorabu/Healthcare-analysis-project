create database project;

use project;
select * from dialysis_1;
select * from dialysis_2;

-- 1st answer Number of Patients across various summaries

select sum(`Number of patients included in the transfusion summary`) as Number_of_patients_included_in_the_transfusion_summary,
sum(`Number of patients in hypercalcemia summary`) as Number_of_patients_in_hypercalcemia_summary ,
sum(`Number of patient-months in hypercalcemia summary`) as Number_of_patients_months_in_hypercalcemia_summary,
sum(`Number of patients in Serum phosphorus summary`) as Number_of_patients_in_serum_phosphorus_summary,
sum(`Number of patient-months in Serum phosphorus summary`) as Number_of_patient_months_in_serum_phosphorus_summary,
sum(`Number of patients included in hospitalization summary`) as Number_of_patients_included_in_hospitalization_summary,
sum(`Number of hospitalizations included in hospital readm summary`) as Number_of_hospitalizations_included_in_hospital_readm_summary,
sum(`Number of Patients included in survival summary`) as Number_of_Patients_included_in_survival_summary,
sum(`Number of Patients included in fistula summary`) as Number_of_Patients_included_in_fistula_summary,
sum(`Number of patients in long term catheter summary`) as Number_of_patients_in_long_term_catheter_summary,
sum(`Number of patient months in long term catheter summary`) as Number_of_patient_months_in_long_term_catheter_summary,
sum(`Number of patients in nPCR summary`) as Number_of_patients_in_nPCR_summary,
sum(`Number of patient-months in nPCR summary`) as Number_of_patient_months_in_nPCR_summary
from dialysis_1;

-- 2nd quetion Profit Vs Non-Profit Stats
 
 select count(case when `Profit or Non-Profit`="Profit" then `Profit or Non-Profit` end) as Profit,
 count(case when `Profit or Non-Profit`="Non-Profit" then `Profit or Non-Profit` end) as Non_Profit
 from dialysis_1;

-- 3rd quetion Chain Organizations w.r.t. Total Performance Score as No Score

select d1.`Chain Organization`,count(d2.Total_Performance_Score) from dialysis_1 as d1
join dialysis_2 as d2
on d1.`Facility Name`= d2.Facility_name
where d2.Total_Performance_Score="No Score"
group by d1.`Chain Organization`;

select * from dialysis_2;
drop table dialysis_2;

 -- 4th quetion Top 10 City wise Dialysis Stations Stats
 
 select city,sum(`# of Dialysis Stations`) from dialysis_1
 group by city;
 
 select `Chain Organization`,sum(`# of Dialysis Stations`) from dialysis_1
 group by`Chain Organization`;

 
 -- 5th answer # of Category Text  - As Expected

 select count(case when `Patient Transfusion category text` ="As Expected" then `Patient Transfusion category text`  end) as Patient_Transfusion_category_text,
 count(case when `Patient hospitalization category text`="As Expected" then `Patient hospitalization category text`  end) as Patient_hospitalization_category_text,
 count(case when `Patient Survival Category Text`="As Expected" then `Patient Survival Category Text`  end) as Patient_Survival_Category_Text,
 count(case when `Patient Infection category text`="As Expected" then `Patient Infection category text` end) as Patient_Infection_category_text,
 count(case when `Fistula Category Text`="As Expected" then `Fistula Category Text` end) as Fistula_Category_Text,
 count(case when `SWR category text`="As Expected" then `SWR category text` end) as SWR_category_text,
 count(case when `PPPW category text`="As Expected" then `PPPW category text` end) as PPPW_category_text
 from dialysis_1;
 
 -- 6th quetion Average Payment Reduction Rate 

 select avg(PY2020_Payment_Reduction_Percentage) as Average_Payment_Reduction from dialysis_2;
 
 
 
 
 
 
 -- importing file through infile function
create table dialysis_2
(CMS_Certification_Number_CCN int,
Facility_name varchar(255),
City varchar(255),
State varchar(255),
Total_Performance_Score varchar(255),
PY2020_Payment_Reduction_Percentage float);
drop table dialysis_2;

select * from dialysis_2;


LOAD DATA INFILE 'dialysis_2.csv' 
INTO TABLE dialysis_2
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;










