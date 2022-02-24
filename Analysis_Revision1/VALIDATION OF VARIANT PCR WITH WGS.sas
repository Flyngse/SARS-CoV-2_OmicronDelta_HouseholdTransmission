
*******
	VALIDATION OF VARIANT PCR WITH WGS 
*******;

data Samples_stats_positives ;
	set data.Positive_PCR_Tests_4 ;
		where '01dec2021'd <= PrDate <= '31dec2021'd ;

		if VariantPCR_selected =1 and WGS_Selection =1 then WGS_variant_select = 1 ;

		if Suspected_omicron ne . and WGS_genome =1 then WGS_variant_result = 1 ;
run;

proc means data = Samples_stats_positives sum mean n maxdec=2;
	var test_pos ;
run;

proc means data = Samples_stats_positives sum mean n maxdec=2;
	var VariantPCR_selected   ;
run;

proc means data = Samples_stats_positives sum mean n maxdec=2;
	var  WGS_Selection  ;
run;

proc means data = Samples_stats_positives sum mean n maxdec=2;
	var  Suspected_omicron  ;
run;

proc means data = Samples_stats_positives sum mean n maxdec=2;
	var  WGS_genome  ;
run;

proc means data = Samples_stats_positives sum mean n maxdec=2;
	var  Suspected_omicron  ;
run;

proc means data = Samples_stats_positives sum mean n maxdec=2;
	var  WGS_genome  ;
run;

proc means data = Samples_stats_positives sum mean n maxdec=2;
	var  WGS_variant_select  ;
run;

proc means data = Samples_stats_positives sum mean n maxdec=2;
	var  WGS_variant_result  ;
run;

proc freq data = Samples_stats_positives ;
	tables WGS_Omicron*Suspected_omicron ;
run;
