********************************
	WGS - START
********************************;

proc import
	datafile 	= "F:\Projekter\FSEID00004942\FrederikPlesnerLyngse\Omnicron\Data_Revision1\wgs_data_20220207_cpr10.csv"
	out 		= WGS
	dbms		= csv
	replace ;
	delimiter 	= ";" ;
	getnames 	= yes ;
	guessingrows = 10000 ;
run; 

data data.WGS ;
	set WGS ;
		
		rename CPR_ENCRYPTED = pnr ;

		WGS_Selection = 0 ;
		if sequence_status ne "not_sequenced" then WGS_Selection = 1 ;

		WGS_genome = 0 ;
		if sequence_status = "genome" then WGS_genome = 1 ;

		if WGS_genome = 1 then WGS_Omicron = 0 ;
		if WHO_variant = "Omicron" then WGS_Omicron = 1 ;
		
		
		keep
			CPR_ENCRYPTED
			sequence_status
			Episodekey
			date_sampling
			date_sequencing
			WHO_variant
			lineages_of_interest
			lineage
			WGS_Selection
			WGS_genome
			WGS_Omicron			
			;
run;

/*
proc sql;	
	create table zz

	as select
				WHO_variant,
				lineage,
				count(*)  as count_N

	from WGS_2

	where '15DEC2021'd  < date_sampling < '10JAN2022'd
	and		WGS_genome = 1

	group by 
				WHO_variant,
				lineage
;quit;

proc sql;	
	select
				Variant,
				count(*) as count_N

	from WGS_2

	where '15DEC2021'd  < date_sampling < '10JAN2022'd
	and		WGS_genome = 1
	and variant <> ""

	group by 
				Variant
;quit;
*/


*@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	WGS - END
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@;
