
*********
	Overall Ct and WGS ;
*********;

data data.stats  ;
	set data.Positive_PCR_Tests_4 ;
		where '09dec2021'd <= PrDate <= '15dec2021'd
		and TCD = 1
		;
			VariantPCR_selected_100 = VariantPCR_selected*100 ;
			Suspected_omicron_100 = Suspected_omicron*100 ;

run;

proc sql;
	create table data.stats_2

	as select
				s.*,
				c.age,
				c.Age_5

	from 		data.stats			S
	left join	data.cpr_final		C
		on S.pnr = C.pnr
;quit;

ods output ParameterEstimates = parms_SELECT ;
proc genmod data = data.stats_2 plots=none;
	class 
		Age_5
		/ param=glm;
	model
			VariantPCR_selected_100 = Age_5  / noint  ;
run;quit;
data parms_SELECT ;
	set parms_SELECT ;
		Group = "Selected for variant PCR" ;
run;
ods output ParameterEstimates = parms_GENOME ;
proc genmod data = data.stats_2 plots=none;
	class 
		Age_5
		/ param=glm;
	model
			Suspected_omicron_100 = Age_5  / noint  ;
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
		Age = Level1+0 ;
		format estimate comma10.0 ;
run;

ods listing gpath = "F:\Projekter\FSEID00004942\FrederikPlesnerLyngse\Omnicron\Output_Revision1\" ;
ods graphics / reset=index imagename = "Prob_of_PCR_by_AGE_TCDK" imagefmt=pdf ;
ods graphics on / attrpriority=none border=off ;
*title 'prob of wgs_selection' ;
proc sgplot data = parms ;
	where age <= 90 ;
		styleattrs 
				datacontrastcolors = (purple green ) 
				datasymbols=(circlefilled squarefilled) 
				datalinepatterns=( solid dash ) 
				datacolors=(purple green ) 
				;
	series
			y = Estimate
			x = Age
			/ markers   group=Group name="estimates" datalabel=estimate ;

	band
			x = Age
			lower=LowerWaldCL
			upper=UpperWaldCL
			/   transparency = 0.9  group=Group name="band" ;


	xaxis
		values = (0 to 90 by 10) 
		label = "Age, years"
		;

	yaxis 
		values = (0 to 100 by 10)
		label = "Proportion (%)"
		grid
		;

		keylegend "estimates" / Title="" location=inside position=bottomright across=1 exclude=("band")  noborder opaque;
run;
