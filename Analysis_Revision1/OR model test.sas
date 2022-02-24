
* GEM OUTPUT ;
ods excel file="F:\Projekter\FSEID00004942\FrederikPlesnerLyngse\Omnicron\Output_Revision1\Model1.xlsx" ;
proc surveylogistic data =  data.Analysis_final ;
	cluster house_number ;
	class 
		pnr
		Age_index_10 (ref="25")
		Age_10 (ref="25")
		house_number 
		house_members
		Vaccination_status (ref="Fully vaccinated")
		Vaccination_status_index (ref="Fully vaccinated")
		;

	model 
		ever_test_pos_100 (event = '100') = 
											Suspected_omicron_index
	
											Vaccination_status
											Vaccination_status_index

											Vaccination_status*Suspected_omicron_index

											Vaccination_status_index*Suspected_omicron_index
											 
											Age_index_10
											Age_10
											house_members
											female
											female_index
											;
run; quit;
ods excel close ;

* GEM OUTPUT ;
ods excel file="F:\Projekter\FSEID00004942\FrederikPlesnerLyngse\Omnicron\Output_Revision1\Model2.xlsx" ;
proc surveylogistic data =  data.Analysis_final ;
	cluster house_number ;
	class 
		pnr
		Age_index_10 (ref="25")
		Age_10 (ref="25")
		house_number 
		house_members
		Vaccination_status (ref="Fully vaccinated")
		Vaccination_status_index (ref="Fully vaccinated")
		;

	model 
		ever_test_pos_100 (event = '100') = 
											Suspected_omicron_index
	
											Vaccination_status
											Vaccination_status_index

											Vaccination_status*Suspected_omicron_index

											Age_index_10
											Age_10
											house_members
											female
											female_index
											;
run; quit;
ods excel close ;

* GEM OUTPUT ;
ods excel file="F:\Projekter\FSEID00004942\FrederikPlesnerLyngse\Omnicron\Output_Revision1\Model3.xlsx" ;
proc surveylogistic data =  data.Analysis_final ;
	cluster house_number ;
	class 
		pnr
		Age_index_10 (ref="25")
		Age_10 (ref="25")
		house_number 
		house_members
		Vaccination_status (ref="Fully vaccinated")
		Vaccination_status_index (ref="Fully vaccinated")
		;

	model 
		ever_test_pos_100 (event = '100') = 
											Suspected_omicron_index
	
											Vaccination_status
											Vaccination_status_index
											 
											Age_index_10
											Age_10
											house_members
											female
											female_index
											;
run; quit;
ods excel close ;


* GEM OUTPUT ;
ods excel file="F:\Projekter\FSEID00004942\FrederikPlesnerLyngse\Omnicron\Output_Revision1\Model4.xlsx" ;
proc surveylogistic data =  data.Analysis_final ;
	cluster house_number ;
	class 
		pnr
		Age_index_10 (ref="25")
		Age_10 (ref="25")
		house_number 
		house_members
		Vaccination_status (ref="Fully vaccinated")
		Vaccination_status_index (ref="Fully vaccinated")
		;

	model 
		ever_test_pos_100 (event = '100') = 
											Suspected_omicron_index
	
											Vaccination_status
											Vaccination_status_index

											Vaccination_status_index*Suspected_omicron_index

											Age_index_10
											Age_10
											house_members
											female
											female_index
											;
run; quit;
ods excel close ;
