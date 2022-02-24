

* descriptives ;

ods excel file="F:\Projekter\FSEID00004942\FrederikPlesnerLyngse\Omnicron\Output_Revision1\PrimaryCases_stat_3.xlsx" ;
proc freq data= data.Primary_cases_stat ;
	table Suspected_omicron_index / nocol norow nopercent nocum;
run;
* Sex ;
proc freq data= data.Primary_cases_stat ;
	table female_index*Suspected_omicron_index / nocol norow nopercent nocum;
run;
* Age ;
proc freq data= data.Primary_cases_stat ;
	table Age_index_10*Suspected_omicron_index / nocol norow nopercent nocum;
run;
* Houshold Size ;
proc freq data= data.Primary_cases_stat ;
	table house_members*Suspected_omicron_index / nocol norow nopercent nocum;
run;
proc freq data= data.Primary_cases_stat ;
	table Vaccination_status_index*Suspected_omicron_index / nocol norow nopercent nocum;
run;
proc freq data= data.Primary_cases_stat ;
	table Vaccination_status_index_2*Suspected_omicron_index / nocol norow nopercent nocum;
run;

ods excel close ;

proc freq data= data.Primary_cases_stat ;
	table Partially_vaccinated_index*Suspected_omicron_index / nocol norow nopercent nocum;
run;
proc freq data= data.Analysis_final ;
	table Partially_vaccinated*Suspected_omicron_index / nocol norow nopercent nocum;
run;


ods excel file="F:\Projekter\FSEID00004942\FrederikPlesnerLyngse\Omnicron\Output_Revision1\PotentialSecondaryCases_stat_3.xlsx" ;
proc freq data= data.Analysis_final ;
	table Suspected_omicron_index / nocol norow nopercent nocum;
run;
* Sex ;
proc freq data= data.Analysis_final ;
	table female*Suspected_omicron_index / nocol norow nopercent nocum;
run;
* Age ;
proc freq data= data.Analysis_final ;
	table Age_10*Suspected_omicron_index / nocol norow nopercent nocum;
run;
* Houshold Size ;
proc freq data= data.Analysis_final ;
	table house_members*Suspected_omicron_index / nocol norow nopercent nocum;
run;
* Vacc ;
proc freq data= data.Analysis_final ;
	table Vaccination_status*Suspected_omicron_index / nocol norow nopercent nocum;
run;
ods excel close ;

proc freq data= data.Analysis_final ;
	table Vaccination_status_2*Suspected_omicron_index / nocol norow nopercent nocum;
run;


ods excel file="F:\Projekter\FSEID00004942\FrederikPlesnerLyngse\Omnicron\Output_Revision1\PositiveSecondaryCases_stat_3.xlsx" ;
proc freq data= data.Analysis_final ;
	where ever_test_pos_100 = 100 ;
	table Suspected_omicron_index / nocol norow nopercent nocum;
run;
* Sex ;
proc freq data= data.Analysis_final ;
	where ever_test_pos_100 = 100 ;
	table female*Suspected_omicron_index / nocol norow nopercent nocum;
run;
* Age ;
proc freq data= data.Analysis_final ;
	where ever_test_pos_100 = 100 ;
	table Age_10*Suspected_omicron_index / nocol norow nopercent nocum;
run;
* Houshold Size ;
proc freq data= data.Analysis_final ;
	where ever_test_pos_100 = 100 ;
	table house_members*Suspected_omicron_index / nocol norow nopercent nocum;
run;
* Vacc ;
proc freq data= data.Analysis_final ;
	where ever_test_pos_100 = 100 ;
	table Vaccination_status*Suspected_omicron_index / nocol norow nopercent nocum;
run;
proc freq data= data.Analysis_final ;
	where ever_test_pos_100 = 100 ;
	table Vaccination_status_2*Suspected_omicron_index / nocol norow nopercent nocum;
run;
ods excel close ;





* By Primary Level ;

ods excel file="F:\Projekter\FSEID00004942\FrederikPlesnerLyngse\Omnicron\Output_Revision1\PotentialSecondaryCases_stat_3_ByPrimary.xlsx" ;
proc freq data= data.Analysis_final ;
	table Suspected_omicron_index / nocol norow nopercent nocum;
run;
* Sex ;
proc freq data= data.Analysis_final ;
	table female_index*Suspected_omicron_index / nocol norow nopercent nocum;
run;
* Age ;
proc freq data= data.Analysis_final ;
	table Age_index_10*Suspected_omicron_index / nocol norow nopercent nocum;
run;
* Houshold Size ;
proc freq data= data.Analysis_final ;
	table house_members*Suspected_omicron_index / nocol norow nopercent nocum;
run;
* Vacc ;
proc freq data= data.Analysis_final ;
	table Vaccination_status_index*Suspected_omicron_index / nocol norow nopercent nocum;
run;
proc freq data= data.Analysis_final ;
	table Vaccination_status_index_2*Suspected_omicron_index / nocol norow nopercent nocum;
run;
ods excel close ;


ods excel file="F:\Projekter\FSEID00004942\FrederikPlesnerLyngse\Omnicron\Output_Revision1\PositiveSecondaryCases_stat_3_ByPrimary.xlsx" ;
proc freq data= data.Analysis_final ;
	where ever_test_pos_100 = 100 ;
	table Suspected_omicron_index / nocol norow nopercent nocum;
run;
* Sex ;
proc freq data= data.Analysis_final ;
	where ever_test_pos_100 = 100 ;
	table female_index*Suspected_omicron_index / nocol norow nopercent nocum;
run;
* Age ;
proc freq data= data.Analysis_final ;
	where ever_test_pos_100 = 100 ;
	table Age_index_10*Suspected_omicron_index / nocol norow nopercent nocum;
run;
* Houshold Size ;
proc freq data= data.Analysis_final ;
	where ever_test_pos_100 = 100 ;
	table house_members*Suspected_omicron_index / nocol norow nopercent nocum;
run;
* Vacc ;
proc freq data= data.Analysis_final ;
	where ever_test_pos_100 = 100 ;
	table Vaccination_status_index*Suspected_omicron_index / nocol norow nopercent nocum;
run;
proc freq data= data.Analysis_final ;
	where ever_test_pos_100 = 100 ;
	table Vaccination_status_index_2*Suspected_omicron_index / nocol norow nopercent nocum;
run;
ods excel close ;


