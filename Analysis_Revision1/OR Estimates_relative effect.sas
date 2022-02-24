



****** RELATIVE EFFECT OF VACCINATION ****** ;
* DELTA HOUSEHOLDS ;
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
* OMICRON HOUSEHOLDS ;
proc surveylogistic data =  data.Analysis_final ;
	cluster house_number ;
	class 
		pnr
		Age_index_10 (ref="25")
		Age_10 (ref="25")
		house_number 
		house_members
		Vaccination_status_index (ref="Fully vaccinated")
		Vacc_omicron_group (ref="OMI_FullVacc")
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

****** RELATIVE EFFECT OF OMICRON ****** ;
* Unvaccinated ;
ods output 	parameterestimates = parms;
proc surveylogistic data =  data.Analysis_final ;
	cluster house_number ;
	class 
		pnr
		Age_index_10 (ref="25")
		Age_10 (ref="25")
		house_number 
		house_members
		Vaccination_status_index (ref="Fully vaccinated")
		Vacc_omicron_group (ref="DEL_NoVacc")
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
* Fully vaccinated ;
ods output 	parameterestimates = parms;
proc surveylogistic data =  data.Analysis_final ;
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
											house_members
											female
											female_index
											;
run; quit;
* Booster vaccinated ;
ods output 	parameterestimates = parms;
proc surveylogistic data =  data.Analysis_final ;
	cluster house_number ;
	class 
		pnr
		Age_index_10 (ref="25")
		Age_10 (ref="25")
		house_number 
		house_members
		Vaccination_status_index (ref="Fully vaccinated")
		Vacc_omicron_group (ref="DEL_BoostVacc")
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
