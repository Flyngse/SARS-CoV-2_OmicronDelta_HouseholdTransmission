********************************
	VariantPCR - START
********************************;

proc import
	datafile 	= "F:\Projekter\FSEID00004942\FrederikPlesnerLyngse\Omnicron\Data_Revision1\variant_samples_&Update..csv"
	out 		= data.VariantPCR
	dbms		= csv
	replace ;
	delimiter 	= ";" ;
	getnames 	= yes ;
run; 

data data.VariantPCR ;
	set data.VariantPCR ;
		rename CPR_ENCRYPTED = pnr ;

		VariantPCR_selected = 1 ;
		rename prdate_adjusted = prdate ;
		rename CPRNR10_ENCRYPTED = pnr ;

		if Suspected_omicron = 9 then Suspected_omicron = . ;
run;

/*
proc means data = data.VariantPCR ;
	var Suspected_omicron ;
run;
*/

*@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	VariantPCR - END
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@;

* WORKAROUND DUBLETTER ;

proc sql;
	create table data.VariantPCR_test

	as select 
			*,
			count(*) as count


	from data.variantpcr

	group by pnr, prdate

	order by count desc, pnr, prdate
;quit;


proc sql;
	create table data.aa2

	as select distinct *

	from data.variantpcr
;quit;
proc sql;
	create table data.VariantPCR_test_2

	as select 
			*,
			count(*) as count

	from data.aa2

	group by pnr, prdate

	order by count desc, pnr, prdate
;quit;

data data.VariantPCR_test ;
	set data.VariantPCR_test_2 ;
		where count = 1 ;
run;
