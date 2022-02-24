
* overall sample stats ;

data Samples_stats ;
	set data.miba_final_1 ;
		where '01dec2021'd <= PrDate <= '31dec2021'd ;
run;

data Samples_stats ;
	set Samples_stats ;
		Time_to_result_sec = UtDateTime - PrDateTime ;
		Time_to_result_min = Time_to_result_sec/60 ;
		Time_to_result_hour = Time_to_result_min/60 ;
run;

ods excel file="F:\Projekter\FSEID00004942\FrederikPlesnerLyngse\Omnicron\Output_Revision1\Test_timetoresult.xlsx" ;
proc means data = Samples_stats p5 q1 median q3 p95 N mean maxdec=0;
	where  casedef = "SARSG";
	class prdate ;
	var Time_to_result_min ;
run;

proc means data = Samples_stats p5 q1 median q3 p95 N mean maxdec=0;
	where  casedef = "SARS2";
	class prdate ;
	var Time_to_result_hour ;
run;
ods excel close ;

ods excel file="F:\Projekter\FSEID00004942\FrederikPlesnerLyngse\Omnicron\Output_Revision1\N_tests.xlsx" ;
proc means data = data.Positive_pcr_tests_4 N mean  maxdec=2;
	where '01dec2021'd <= PrDate <= '31dec2021'd ;
	class prdate ;
	var VariantPCR_selected ;
run;
ods excel close ;

ods excel file="F:\Projekter\FSEID00004942\FrederikPlesnerLyngse\Omnicron\Output_Revision1\N_tests_selected_for_variantPCR.xlsx" ;
proc means data = data.Positive_pcr_tests_4 N mean sum maxdec=2;
	where '01dec2021'd <= PrDate <= '31dec2021'd ;
	class prdate ;
	var Suspected_omicron ;
run;
ods excel close ;

