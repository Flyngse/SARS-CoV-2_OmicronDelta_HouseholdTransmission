
*********
	Overall Ct and WGS ;
*********;

data data.stats  ;
	set data.Positive_PCR_Tests_4 ;
		where '09dec2021'd <= PrDate <= '15dec2021'd;
			VariantPCR_selected_100 = VariantPCR_selected*100 ;
			Suspected_omicron_100 = Suspected_omicron*100 ;
run;


ods output ParameterEstimates = parms_SELECT ;
proc genmod data = data.stats plots=none;
	where 18 <= ct_value_1 <= 38 
	;
	class 
		CT_value_1
		/ param=glm;
	model
			VariantPCR_selected_100 = CT_value_1  / noint  ;
run;quit;
data parms_SELECT ;
	set parms_SELECT ;
		Group = "Selected for variant PCR" ;
run;
ods output ParameterEstimates = parms_GENOME ;
proc genmod data = data.stats plots=none;
	where 18 <= CT_value_1 <= 38 
	;
	class 
		CT_value_1
		/ param=glm;
	model
			Suspected_omicron_100 = CT_value_1  / noint  ;
run;quit;
data parms_GENOME ;
	set parms_GENOME ;
		Group = "With Omicron" ;
run;
data parms ;
	set 
		parms_SELECT
		parms_GENOME 
		;
		CT = Level1+0 ;
		format estimate comma10.0 ;
run;

ods listing gpath = "F:\Projekter\FSEID00004942\FrederikPlesnerLyngse\Omnicron\Output_Revision1\" ;
ods graphics / reset=index imagename = "Prob_of_PCR_by_CT" imagefmt=pdf ;
ods graphics on / attrpriority=none border=off ;
*title 'prob of wgs_selection' ;
proc sgplot data = parms ;
		styleattrs 
				datacontrastcolors = (purple green ) 
				datasymbols=(circlefilled squarefilled) 
				datalinepatterns=( solid dash ) 
				datacolors=(purple green ) 
				;
	series
			y = Estimate
			x = CT
			/ markers   group=Group name="estimates" datalabel=estimate ;

	band
			x = CT
			lower=LowerWaldCL
			upper=UpperWaldCL
			/   transparency = 0.9  group=Group name="band" ;


	xaxis
		values = (18 to 38 by 2) 
		label = "Ct Value"
		;

	yaxis 
		values = (0 to 100 by 10)
		label = "Proportion (%)"
		grid
		;

		keylegend "estimates" / Title="" location=inside position=bottomright across=1 exclude=("band")  noborder opaque;
run;
