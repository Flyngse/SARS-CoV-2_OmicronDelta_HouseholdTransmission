



* intra hh correaltion ;


proc freq data = data.Analysis_daily ;
	where 0<=time_from_index<=7 ;
	table Suspected_omicron_index*Suspected_omicron_secondary ;
run;

proc freq data = data.Analysis_daily ;
	where 0<=time_from_index<=7 ;
	table Suspected_omicron_secondary*Suspected_omicron_index ;
run;

proc sort data = data.Analysis_daily ;
	by Suspected_omicron_index ;
run;

ods output GeeemppEst = parms ;
proc genmod data = data.Analysis_daily plots=none ;
	where same_variant ne . and 0<=time_from_index<=7 ;
	by Suspected_omicron_index ;
	class 
			house_number 
			time_from_index
			/ param=glm;
	model	same_variant = count   / noint ;
	repeated subject=house_number / type=ind ;	
run;quit;

ods output GeeemppEst = parms ;
proc genmod data = data.Analysis_daily plots=none ;
	where same_variant ne . and 0<=time_from_index<=7 ;
	*by Suspected_omicron_index ;
	class 
			house_number 
			time_from_index
			/ param=glm;
	model	same_variant = count   / noint ;
	repeated subject=house_number / type=ind ;	
run;quit;


proc means  data= data.Analysis_daily n mean maxdec=1;
	by Suspected_omicron_index ;
	class time_from_index ;
	var same_variant_100 ;
run;

ods output GeeemppEst = parms ;
proc genmod data = data.Analysis_daily plots=none ;
	where same_variant ne . and 0<=time_from_index<=14 ;
	by Suspected_omicron_index ;
	class 
			house_number 
			time_from_index
			/ param=glm;
	model	same_variant_100 = time_from_index   / noint ;
	repeated subject=house_number / type=ind ;	
run;quit;

data parms ;
	set parms ;
		Days = level1 +0 ;
		format estimate 10.0 ;
run;

ods listing gpath = "F:\Projekter\FSEID00004942\FrederikPlesnerLyngse\Omnicron\Output_Revision1\" ;
ods graphics / reset=index imagename = "IntraHH_correlation_by14Day" imagefmt=pdf ;
ods graphics on / attrpriority=none border=off ;
Title ;
proc sgplot data = parms ;
	styleattrs 
				datacontrastcolors = (red blue) 
				datasymbols=(circlefilled) 
				datalinepatterns=( solid solid dot dot) 
				datacolors=(red blue) 
				;
	series
			y= estimate
			x= Days
			/ markers name="estimates" datalabel=estimate group=Suspected_omicron_index
			;
		band 
			x = Days
			lower=LowerCL
			upper=UpperCL
			/   transparency = 0.9  name="band" group=Suspected_omicron_index;

	yaxis 
			values = (0 to 100 by 10) 
			label = "Proportion (%)" ;
	xaxis 
			values = (0 to 14 by 1) 
			label = "Days since primary case" 
			;

	keylegend "estimates" / Title="" location=inside position=bottomright across=1 exclude=("band" "estimates")  noborder opaque;
run;


ods listing gpath = "F:\Projekter\FSEID00004942\FrederikPlesnerLyngse\Omnicron\Output_Revision1\" ;
ods graphics / reset=index imagename = "IntraHH_correlation_by7Day" imagefmt=pdf ;
ods graphics on / attrpriority=none border=off ;
Title ;
proc sgplot data = parms ;
	styleattrs 
				datacontrastcolors = (green) 
				datasymbols=(circlefilled) 
				datalinepatterns=( solid solid dot dot) 
				datacolors=(green) 
				;
	series
			y= estimate
			x= Days
			/ markers name="estimates" datalabel=estimate markerattrs=(symbol=circlefilled color=green)
			;
		band 
			x = Days
			lower=LowerCL
			upper=UpperCL
			/   transparency = 0.9  name="band" fillattrs=(color=green);

	yaxis 
			values = (0 to 100 by 10) 
			label = "Proportion (%)" ;
	xaxis 
			values = (0 to 7 by 1) 
			label = "Days since primary case" 
			;

	keylegend "estimates" / Title="" location=inside position=bottomright across=1 exclude=("band" "estimates")  noborder opaque;
run;

