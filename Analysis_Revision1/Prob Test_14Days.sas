

proc sort data = data.Analysis_daily ;
	by Suspected_omicron_index  ;
run;

ods output GeeemppEst = parms_test_1 ;
proc genmod data = data.Analysis_daily plots=none ;
	by variant ;
	class 
			house_number 
			time_from_index
			/ param=glm;
	model	ever_test_1_100 = time_from_index   / noint ;
	repeated subject=house_number / type=ind ;	
run;quit;

ods output GeeemppEst = parms_test_2 ;
proc genmod data = data.Analysis_daily plots=none ;
	by variant ;
	class 
			house_number 
			time_from_index
			/ param=glm;
	model	ever_test_2_100 = time_from_index   / noint ;
	repeated subject=house_number / type=ind ;	
run;quit;

data parms_test_1x ;
	set parms_test_1 ;
		*length var $ 12 ;
		Var = "Tested once" ; 
		length group $ 30 ;
		group = trim(var) ||" - "|| variant ;
run;

data parms_test_2x ;
	set parms_test_2 ;
		*length var $ 12 ;
		Var = "Tested twice" ; 
		if Level1 = "0" then delete ;
		length group $ 30 ;
		group = trim(var) ||" - "|| variant ;
run;

data parms ;
	set 
		parms_test_1x 
		parms_test_2x 
		;

		Days = Level1+0 ;
		format estimate comma10.0 ;
		format LowerCL comma10.0 ;
		format UpperCL comma10.0 ;	
run;

proc sort data = parms ;
	by  Var descending variant  ;
run;

ods listing gpath = "F:\Projekter\FSEID00004942\FrederikPlesnerLyngse\Omnicron\Output_Revision1\" ;
ods graphics / reset=index imagename = "ProbTest_14Days" imagefmt=pdf ;
ods graphics on / attrpriority=none border=off ;
Title ;
proc sgplot data = parms ;
	styleattrs 
				datacontrastcolors = (red blue red blue) 
				datasymbols=( trianglefilled diamondfilled triangle diamond) 
				datalinepatterns=( solid solid dot dot) 
				datacolors=(red blue red blue) 
				;
	series
			y= estimate
			x= Days
			/ markers group=group name="estimates" datalabel=estimate  datalabelattrs=(size=12)
			;
		band 
			x = Days
			lower=LowerCL
			upper=UpperCL
			/   transparency = 0.9  group=group name="band" ;

	yaxis 
			values = (0 to 100 by 10) 
			label = "Proportion (%)" ;
	xaxis 
			values = (0 to 14 by 1) 
			label = "Days since primary case" 
			;

	keylegend "estimates" / Title="" location=inside position=bottomright across=1 exclude=("band")  noborder opaque;
run;




proc sort data = data.Analysis_daily ;
	by Suspected_omicron_index ;
run;

ods output GeeemppEst = parms ;
proc genmod data = data.Analysis_daily plots=none ;
	by variant ;
	class 
			house_number 
			time_from_index
			/ param=glm;
	model	ever_test_pos_100 = time_from_index   / noint ;
	repeated subject=house_number / type=ind ;	
run;quit;

data parms ;
	set parms ;
		Days = Level1+0 ;
		format estimate comma10.0 ;

		format LowerCL comma10.0 ;
		format UpperCL comma10.0 ;

run;

proc sort data = parms ;
	by descending variant  ;
run;

ods listing gpath = "F:\Projekter\FSEID00004942\FrederikPlesnerLyngse\Omnicron\Output_Revision1\" ;
ods graphics / reset=index imagename = "ProbTestPos_14Days" imagefmt=pdf ;
ods graphics on / attrpriority=none border=off ;
Title ;
proc sgplot data = parms ;
	where Days > 0 ;
	styleattrs 
				datacontrastcolors = (red blue gray) 
				datasymbols=( trianglefilled diamondfilled circlefilled) 
				datalinepatterns=( solid solid dot) 
				datacolors=(red blue gray) 
				;
	series
			y= estimate
			x= Days
			/ markers group=variant name="estimates" datalabel=estimate datalabelattrs=(size=12)
			;
		band 
			x = Days
			lower=LowerCL
			upper=UpperCL
			/   transparency = 0.9  group=variant name="band" ;

	yaxis 
			values = (0 to 40 by 10) 
			label = "Secondary Attack Rate (%)" ;
	xaxis 
			values = (0 to 14 by 1) 
			label = "Days since primary case" 
			;

	keylegend "estimates" / Title="Variant" location=inside position=bottomright across=1 exclude=("band")  noborder opaque;
run;
