

***
SAR_by_ImmunityContact_and_ImmunityPrimary
** ;

proc sql;
	create table aa

	as select 
				variant,
				Vaccination_status,
				Vaccination_status_index,
				count(distinct PNR_index) as count_index,
				count(*) as count_pot_sec,
				sum(ever_test_pos_100/100) as pos_sec,
				sum(ever_test_pos_100/100)/count(*)*100 as SAR

	from data.Analysis_final 

	group by 
				variant,
				Vaccination_status,
				Vaccination_status_index
;quit;

data aa2 ;
	set aa ;
		

		n_prim = strip(put(count_index,comma20.)) ;
			if count_index < 5 then n_prim = '<5' ;
		n_pot_sec = strip(put(count_pot_sec,comma20.)) ;
			if count_pot_sec < 5 then n_pot_sec = '<5' ;
		n_pos_sec = strip(put(pos_sec,comma20.)) ;
			if pos_sec < 5 then n_pos_sec = '<5' ;
		SAR_2 = strip(put(SAR,comma20.)) ;
			if count_index < 5 or pos_sec < 5 then SAR_2 = '-' ;
		
		length SAR3 $ 32 ;
		SAR3 =	'' ||strip(SAR_2)|| '%' ||' [' ||strip(n_pos_sec) || '/' ||strip(n_pot_sec)|| '/' || strip(n_prim) || ']' ;

		drop 
			count_index
			count_pot_sec
			pos_sec
			SAR
			;
run;

proc export 
	data = aa2
	dbms = xlsx
	outfile = "F:\Projekter\FSEID00004942\FrederikPlesnerLyngse\Omnicron\Output_Revision1\SAR_by_ImmunityContact_and_ImmunityPrimary.xlsx"
	replace;
run;





***
SAR_by_AGE_and_Immunity_primary
** ;

proc sql;
	create table aa

	as select 
				variant,
				age_index_10,
				Vaccination_status_index,
				count(distinct PNR_index) as count_index,
				count(*) as count_pot_sec,
				sum(ever_test_pos_100/100) as pos_sec,
				sum(ever_test_pos_100/100)/count(*)*100 as SAR

	from data.Analysis_final 

	group by 
				variant,
				Vaccination_status_index,
				age_index_10
;quit;

data aa2 ;
	set aa ;
		

		n_prim = strip(put(count_index,comma20.)) ;
			if count_index < 5 then n_prim = '<5' ;
		n_pot_sec = strip(put(count_pot_sec,comma20.)) ;
			if count_pot_sec < 5 then n_pot_sec = '<5' ;
		n_pos_sec = strip(put(pos_sec,comma20.)) ;
			if pos_sec < 5 then n_pos_sec = '<5' ;
		SAR_2 = strip(put(SAR,comma20.)) ;
			if count_index < 5 or pos_sec < 5 then SAR_2 = '-' ;
		
		length SAR3 $ 32 ;
		SAR3 =	'' ||strip(SAR_2)|| '%' ||' [' ||strip(n_pos_sec) || '/' ||strip(n_pot_sec)|| '/' || strip(n_prim) || ']' ;

		drop 
			count_index
			count_pot_sec
			pos_sec
			SAR
			;
run;

proc export 
	data = aa2
	dbms = xlsx
	outfile = "F:\Projekter\FSEID00004942\FrederikPlesnerLyngse\Omnicron\Output_Revision1\SAR_by_AGE_and_Immunity_primary.xlsx"
	replace;
run;




***
SAR_by_AGE_and_Immunity_contact
** ;

proc sql;
	create table aa

	as select 
				variant,
				Vaccination_status,
				age_10,
				count(distinct PNR_index) as count_index,
				count(*) as count_pot_sec,
				sum(ever_test_pos_100/100) as pos_sec,
				sum(ever_test_pos_100/100)/count(*)*100 as SAR

	from data.Analysis_final 

	group by 
				variant,
				Vaccination_status,
				age_10
;quit;

data aa2 ;
	set aa ;
		

		n_prim = strip(put(count_index,comma20.)) ;
			if count_index < 5 then n_prim = '<5' ;
		n_pot_sec = strip(put(count_pot_sec,comma20.)) ;
			if count_pot_sec < 5 then n_pot_sec = '<5' ;
		n_pos_sec = strip(put(pos_sec,comma20.)) ;
			if pos_sec < 5 then n_pos_sec = '<5' ;
		SAR_2 = strip(put(SAR,comma20.)) ;
			if count_index < 5 or pos_sec < 5 then SAR_2 = '-' ;
		
		length SAR3 $ 32 ;
		SAR3 =	'' ||strip(SAR_2)|| '%' ||' [' ||strip(n_pos_sec) || '/' ||strip(n_pot_sec)|| '/' || strip(n_prim) || ']' ;

		drop 
			count_index
			count_pot_sec
			pos_sec
			SAR
			;
run;

proc export 
	data = aa2
	dbms = xlsx
	outfile = "F:\Projekter\FSEID00004942\FrederikPlesnerLyngse\Omnicron\Output_Revision1\SAR_by_AGE_and_Immunity_Contact.xlsx"
	replace;
run;
