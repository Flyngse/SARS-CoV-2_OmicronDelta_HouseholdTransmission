


* Full model ;
ods excel file="F:\Projekter\FSEID00004942\FrederikPlesnerLyngse\Omnicron\Output_Revision1\FullModel.xlsx" ;
proc surveylogistic data =  data.Analysis_final ;
	cluster house_number ;
	class 
		pnr
		Age_index_10 (ref="25")
		Age_10 (ref="25")
		house_number 
		house_members
		Vaccination_status_index (ref="Fully vaccinated")
		Vacc_omicron_group (ref="DEL_FullVacc")
		;

	model 
		ever_test_pos_100 (event = '100') = 
											Vacc_omicron_group
											Vaccination_status_index
											Age_index_10
											Age_10
											house_members
											female
											female_index
											;
run; quit;
ods excel close ;

* Restrict on Primary cases >10 years ;
ods excel file="F:\Projekter\FSEID00004942\FrederikPlesnerLyngse\Omnicron\Output_Revision1\FullModel_NoPrimaryKids.xlsx" ;
proc surveylogistic data =  data.Analysis_final ;
	where Age_index_10 > 10 ;
	cluster house_number ;
	class 
		pnr
		Age_index_10 (ref="25")
		Age_10 (ref="25")
		house_number 
		house_members
		Vaccination_status_index (ref="Fully vaccinated")
		Vacc_omicron_group (ref="DEL_FullVacc")
		;

	model 
		ever_test_pos_100 (event = '100') = 
											Vacc_omicron_group
											Vaccination_status_index
											Age_index_10
											Age_10
											house_members
											female
											female_index
											;
run; quit;
ods excel close ;

* Restrict on 2 person HH ;
ods excel file="F:\Projekter\FSEID00004942\FrederikPlesnerLyngse\Omnicron\Output_Revision1\FullModel_2PersonHH.xlsx" ;
proc surveylogistic data =  data.Analysis_final ;
	where house_members =2 ;
	cluster house_number ;
	class 
		pnr
		Age_index_10 (ref="25")
		Age_10 (ref="25")
		house_number 
		Vaccination_status_index (ref="Fully vaccinated")
		Vacc_omicron_group (ref="DEL_FullVacc")
		;

	model 
		ever_test_pos_100 (event = '100') = 
											Vacc_omicron_group
											Vaccination_status_index
											Age_index_10
											Age_10
											
											female
											female_index
											;
run; quit;
ods excel close ;

* More immunity ;
ods excel file="F:\Projekter\FSEID00004942\FrederikPlesnerLyngse\Omnicron\Output_Revision1\FullModel_MoreImmunity.xlsx" ;
proc surveylogistic data =  data.Analysis_final ;
	cluster house_number ;
	class 
		pnr
		Age_index_10 (ref="25")
		Age_10 (ref="25")
		house_number 
		house_members
		Vaccination_status_index_2 (ref="YesVacc_NoPrevInfect")
		Vacc_omicron_group_2 (ref="DEL_YesVacc_NoPrevInfect")
		;

	model 
		ever_test_pos_100 (event = '100') = 
											Vacc_omicron_group_2
											Vaccination_status_index_2
											Age_index_10
											Age_10
											house_members
											female
											female_index
											
											;
run; quit;
ods excel close ;


* More immunity ;
ods excel file="F:\Projekter\FSEID00004942\FrederikPlesnerLyngse\Omnicron\Output_Revision1\FullModel_ExclHHPrevInf.xlsx" ;
proc surveylogistic data =  data.Analysis_final ;
	where Positive_number_HH = 1 ;
	cluster house_number ;
	class 
		pnr
		Age_index_10 (ref="25")
		Age_10 (ref="25")
		house_number 
		house_members
		Vaccination_status_index (ref="Fully vaccinated")
		Vacc_omicron_group (ref="DEL_FullVacc")
		;

	model 
		ever_test_pos_100 (event = '100') = 
											Vacc_omicron_group
											Vaccination_status_index
											Age_index_10
											Age_10
											house_members
											female
											female_index
											
											;
run; quit;
ods excel close ;

* Control for Ct value ;
ods excel file="F:\Projekter\FSEID00004942\FrederikPlesnerLyngse\Omnicron\Output_Revision1\FullModel_WithCT.xlsx" ;
proc surveylogistic data =  data.Analysis_final ;
	cluster house_number ;
	class 
		pnr
		Age_index_10 (ref="25")
		Age_10 (ref="25")
		house_number 
		house_members
		Vaccination_status_index (ref="Fully vaccinated")
		Vacc_omicron_group (ref="DEL_FullVacc")
		CT_value_2_index (ref="29")
		;

	model 
		ever_test_pos_100 (event = '100') = 
											Vacc_omicron_group
											Vaccination_status_index
											Age_index_10
											Age_10
											house_members
											female
											female_index
											CT_value_2_index
											;
run; quit;
ods excel close ;


* Sensitivity to co-primary cases ;
ods excel file="F:\Projekter\FSEID00004942\FrederikPlesnerLyngse\Omnicron\Output_Revision1\FullModel_NoSecCasesDay2to7.xlsx" ;
proc surveylogistic data =  data.Analysis_final ;
	where 2 <= test_pos_day ;
	cluster house_number ;
	class 
		pnr
		Age_index_10 (ref="25")
		Age_10 (ref="25")
		house_number 
		house_members
		Vaccination_status_index (ref="Fully vaccinated")
		Vacc_omicron_group (ref="DEL_FullVacc")
		;

	model 
		ever_test_pos_100 (event = '100') = 
											Vacc_omicron_group
											Vaccination_status_index
											Age_index_10
											Age_10
											house_members
											female
											female_index
											;
run; quit;
ods excel close ;


* Sensitivity to co-primary cases ;
ods excel file="F:\Projekter\FSEID00004942\FrederikPlesnerLyngse\Omnicron\Output_Revision1\FullModel_NoSecCasesDay3to7.xlsx" ;
proc surveylogistic data =  data.Analysis_final ;
	where 3 <= test_pos_day ;
	cluster house_number ;
	class 
		pnr
		Age_index_10 (ref="25")
		Age_10 (ref="25")
		house_number 
		house_members
		Vaccination_status_index (ref="Fully vaccinated")
		Vacc_omicron_group (ref="DEL_FullVacc")
		;

	model 
		ever_test_pos_100 (event = '100') = 
											Vacc_omicron_group
											Vaccination_status_index
											Age_index_10
											Age_10
											house_members
											female
											female_index
											;
run; quit;
ods excel close ;


* Sensitivity 14 day follow-up ;
ods excel file="F:\Projekter\FSEID00004942\FrederikPlesnerLyngse\Omnicron\Output_Revision1\FullModel_14Days.xlsx" ;
proc surveylogistic data =  data.Analysis_final_14Days ;
	cluster house_number ;
	class 
		pnr
		Age_index_10 (ref="25")
		Age_10 (ref="25")
		house_number 
		house_members
		Vaccination_status_index (ref="Fully vaccinated")
		Vacc_omicron_group (ref="DEL_FullVacc")
		;

	model 
		ever_test_pos_100 (event = '100') = 
											Vacc_omicron_group
											Vaccination_status_index
											Age_index_10
											Age_10
											house_members
											female
											female_index
											;
run; quit;
ods excel close ;


* Sensitivity 14 day follow-up ;
ods excel file="F:\Projekter\FSEID00004942\FrederikPlesnerLyngse\Omnicron\Output_Revision1\FullModel_OnlyTested.xlsx" ;
proc surveylogistic data =  data.Analysis_final ;
	where ever_test = 1 ;
	cluster house_number ;
	class 
		pnr
		Age_index_10 (ref="25")
		Age_10 (ref="25")
		house_number 
		house_members
		Vaccination_status_index (ref="Fully vaccinated")
		Vacc_omicron_group (ref="DEL_FullVacc")
		;

	model 
		ever_test_pos_100 (event = '100') = 
											Vacc_omicron_group
											Vaccination_status_index
											Age_index_10
											Age_10
											house_members
											female
											female_index
											;
run; quit;
ods excel close ;


* Sensitivity No partial Vacc ;
ods excel file="F:\Projekter\FSEID00004942\FrederikPlesnerLyngse\Omnicron\Output_Revision1\FullModel_NoPartialVac.xlsx" ;
proc surveylogistic data =  data.Analysis_final ;
	where Partially_vaccinated=0 and Partially_vaccinated_index=0 ;
	cluster house_number ;
	class 
		pnr
		Age_index_10 (ref="25")
		Age_10 (ref="25")
		house_number 
		house_members
		Vaccination_status_index (ref="Fully vaccinated")
		Vacc_omicron_group (ref="DEL_FullVacc")
		;

	model 
		ever_test_pos_100 (event = '100') = 
											Vacc_omicron_group
											Vaccination_status_index
											Age_index_10
											Age_10
											house_members
											female
											female_index
											;
run; quit;
ods excel close ;
