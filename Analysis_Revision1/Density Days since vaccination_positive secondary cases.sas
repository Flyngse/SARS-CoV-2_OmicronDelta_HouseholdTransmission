
*****
* Time since vaccination - positive secondary cases;

proc sort data = data.Analysis_final ;
	by  Vaccination_status_index Vaccination_status descending variant ;
run ;

ods listing gpath = "F:\Projekter\FSEID00004942\FrederikPlesnerLyngse\Omnicron\Output_Revision1\" ;
ods graphics / reset=index imagename = "SecondaryCase_TimeSinceVaccination_Density" imagefmt=pdf ;
ods graphics on / attrpriority=none border=off ;
proc sgplot data = data.Analysis_final ;
	where ever_test_pos_100 = 100 ;
		styleattrs 
				datacontrastcolors = (red blue ) 
				datasymbols=(diamondfilled squarefilled) 
				datalinepatterns=( solid longdash ) 
				datacolors=(red blue ) 
				;
	density	Days_since_vaccination / type=kernel 
						group=variant
						;
	xaxis
		values = (0 to 250 by 50) 	
		label = "Days since vaccination" ;
		;
	yaxis label = "Density (%)" ;

	keylegend / Title="Variant"  position=topright location=inside across=1 noborder opaque;

run;



ods listing gpath = "F:\Projekter\FSEID00004942\FrederikPlesnerLyngse\Omnicron\Output_Revision1\" ;
ods graphics / reset=index imagename = "SecondaryCase_TimeSinceVaccination_Density_2" imagefmt=pdf ;
ods graphics on / attrpriority=none border=off ;
proc sgplot data = data.Analysis_final ;
	by Vaccination_status_index Vaccination_status ;
	where ever_test_pos_100 = 100 ;
		styleattrs 
				datacontrastcolors = (red blue ) 
				datasymbols=(diamondfilled squarefilled) 
				datalinepatterns=( solid longdash ) 
				datacolors=(red blue ) 
				;
	density	Days_since_vaccination / type=kernel 
						group=variant
						;
	xaxis
		label = "Days since vaccination" 
		min = 0
		;
	yaxis label = "Density (%)" ;

	keylegend / Title="Variant"  position=topright location=inside across=1 noborder opaque;
run;





proc sgpanel data = data.Analysis_final ;
	where  ever_test_pos_100 = 100 and Vaccination_status ne "Not vaccinated" ;
	panelby Vaccination_status Vaccination_status_index  /  layout=lattice;
	density Days_since_vaccination  / group=variant  transparency=0.5 type=kernel ;
run;




ods listing gpath = "F:\Projekter\FSEID00004942\FrederikPlesnerLyngse\Omnicron\Output_Revision1\" ;
ods graphics / reset=index imagename = "SecondaryCase_TimeSinceVaccination_Density_2" imagefmt=pdf ;
ods graphics on / attrpriority=none border=off ;
proc sgplot data = data.Analysis_final ;
	by Vaccination_status_index Vaccination_status ;
	where ever_test_pos_100 = 100 and Vaccination_status ne "Not vaccinated" ;
		styleattrs 
				datacontrastcolors = (red blue ) 
				datasymbols=(diamondfilled squarefilled) 
				datalinepatterns=( solid longdash ) 
				datacolors=(red blue ) 
				;
	density	Days_since_vaccination / type=kernel 
						group=variant
						;
	xaxis
		label = "Days since vaccination" 
		min = 0
		;
	yaxis label = "Density (%)" ;

	keylegend / Title="Variant"  position=topright location=inside across=1 noborder opaque;
run;


ods listing gpath = "F:\Projekter\FSEID00004942\FrederikPlesnerLyngse\Omnicron\Output_Revision1\" ;
ods graphics / reset=index imagename = "SecondaryCase_TimeSinceVaccination_Density_index_unvac_contact_fullyVacc" imagefmt=pdf ;
ods graphics on / attrpriority=none border=off ;
proc sgplot data = data.Analysis_final ;
	by Vaccination_status_index Vaccination_status ;
	where ever_test_pos_100 = 100 and Vaccination_status ne "Not vaccinated" ;
		styleattrs 
				datacontrastcolors = (red blue ) 
				datasymbols=(diamondfilled squarefilled) 
				datalinepatterns=( solid longdash ) 
				datacolors=(red blue ) 
				;
	density	Days_since_vaccination / type=kernel 
						group=variant
						;
	xaxis
		label = "Days since vaccination" 
		min = 0
		;
	yaxis label = "Density (%)" ;

	keylegend / Title="Variant"  position=topright location=inside across=1 noborder opaque;
run;





ods listing gpath = "F:\Projekter\FSEID00004942\FrederikPlesnerLyngse\Omnicron\Output_Revision1\" ;
ods graphics / reset=index imagename = "SecondaryCase_TimeSinceVaccination_Density_index_Booster_contact_Booster" imagefmt=pdf ;
ods graphics on / attrpriority=none border=off ;
proc sgplot data = data.Analysis_final ;
	*by Vaccination_status_index Vaccination_status ;
	where ever_test_pos_100 = 100 and Vaccination_status ne "Not vaccinated" and Vaccination_status_index = "Booster vaccinated" and Vaccination_status = "Booster vaccinated";
		styleattrs 
				datacontrastcolors = (red blue ) 
				datasymbols=(diamondfilled squarefilled) 
				datalinepatterns=( solid longdash ) 
				datacolors=(red blue ) 
				;
	density	Days_since_vaccination / type=kernel 
						group=variant
						;
	xaxis
		label = "Days since vaccination" 
		min = 0
		;
	yaxis label = "Density (%)" ;

	keylegend / Title="Variant"  position=topright location=inside across=1 noborder opaque;
run;

ods listing gpath = "F:\Projekter\FSEID00004942\FrederikPlesnerLyngse\Omnicron\Output_Revision1\" ;
ods graphics / reset=index imagename = "SecondaryCase_TimeSinceVaccination_Density_index_Booster_contact_Fully" imagefmt=pdf ;
ods graphics on / attrpriority=none border=off ;
proc sgplot data = data.Analysis_final ;
	*by Vaccination_status_index Vaccination_status ;
	where ever_test_pos_100 = 100 and Vaccination_status ne "Not vaccinated" and Vaccination_status_index = "Booster vaccinated" and Vaccination_status = "Fully vaccinated";
		styleattrs 
				datacontrastcolors = (red blue ) 
				datasymbols=(diamondfilled squarefilled) 
				datalinepatterns=( solid longdash ) 
				datacolors=(red blue ) 
				;
	density	Days_since_vaccination / type=kernel 
						group=variant
						;
	xaxis
		label = "Days since vaccination" 
		min = 0
		;
	yaxis label = "Density (%)" ;

	keylegend / Title="Variant"  position=topright location=inside across=1 noborder opaque;
run;

ods listing gpath = "F:\Projekter\FSEID00004942\FrederikPlesnerLyngse\Omnicron\Output_Revision1\" ;
ods graphics / reset=index imagename = "SecondaryCase_TimeSinceVaccination_Density_index_Fully_contact_Fully" imagefmt=pdf ;
ods graphics on / attrpriority=none border=off ;
proc sgplot data = data.Analysis_final ;
	*by Vaccination_status_index Vaccination_status ;
	where ever_test_pos_100 = 100 and Vaccination_status ne "Not vaccinated" and Vaccination_status_index = "Fully vaccinated" and Vaccination_status = "Fully vaccinated";
		styleattrs 
				datacontrastcolors = (red blue ) 
				datasymbols=(diamondfilled squarefilled) 
				datalinepatterns=( solid longdash ) 
				datacolors=(red blue ) 
				;
	density	Days_since_vaccination / type=kernel 
						group=variant
						;
	xaxis
		label = "Days since vaccination" 
		min = 0
		max = 250
		;
	yaxis label = "Density (%)" ;

	keylegend / Title="Variant"  position=topright location=inside across=1 noborder opaque;
run;



ods listing gpath = "F:\Projekter\FSEID00004942\FrederikPlesnerLyngse\Omnicron\Output_Revision1\" ;
ods graphics / reset=index imagename = "SecondaryCase_TimeSinceVaccination_Density_index_Fully_contact_Booster" imagefmt=pdf ;
ods graphics on / attrpriority=none border=off ;
proc sgplot data = data.Analysis_final ;
	*by Vaccination_status_index Vaccination_status ;
	where ever_test_pos_100 = 100 and Vaccination_status ne "Not vaccinated" and Vaccination_status_index = "Fully vaccinated" and Vaccination_status = "Booster vaccinated";
		styleattrs 
				datacontrastcolors = (red blue ) 
				datasymbols=(diamondfilled squarefilled) 
				datalinepatterns=( solid longdash ) 
				datacolors=(red blue ) 
				;
	density	Days_since_vaccination / type=kernel 
						group=variant
						;
	xaxis
		label = "Days since vaccination" 
		min = 0
		;
	yaxis label = "Density (%)" ;

	keylegend / Title="Variant"  position=topright location=inside across=1 noborder opaque;
run;





ods listing gpath = "F:\Projekter\FSEID00004942\FrederikPlesnerLyngse\Omnicron\Output_Revision1\" ;
ods graphics / reset=index imagename = "SecondaryCase_TimeSinceVaccination_Density_index_Not_contact_Fully" imagefmt=pdf ;
ods graphics on / attrpriority=none border=off ;
proc sgplot data = data.Analysis_final ;
	*by Vaccination_status_index Vaccination_status ;
	where ever_test_pos_100 = 100 and Vaccination_status ne "Not vaccinated" and Vaccination_status_index = "Not vaccinated" and Vaccination_status = "Fully vaccinated";
		styleattrs 
				datacontrastcolors = (red blue ) 
				datasymbols=(diamondfilled squarefilled) 
				datalinepatterns=( solid longdash ) 
				datacolors=(red blue ) 
				;
	density	Days_since_vaccination / type=kernel 
						group=variant
						;
	xaxis
		label = "Days since vaccination" 
		min = 0
		max = 250
		;
	yaxis label = "Density (%)" ;

	keylegend / Title="Variant"  position=topright location=inside across=1 noborder opaque;
run;



ods listing gpath = "F:\Projekter\FSEID00004942\FrederikPlesnerLyngse\Omnicron\Output_Revision1\" ;
ods graphics / reset=index imagename = "SecondaryCase_TimeSinceVaccination_Density_index_Not_contact_Booster" imagefmt=pdf ;
ods graphics on / attrpriority=none border=off ;
proc sgplot data = data.Analysis_final ;
	*by Vaccination_status_index Vaccination_status ;
	where ever_test_pos_100 = 100 and Vaccination_status ne "Not vaccinated" and Vaccination_status_index = "Not vaccinated" and Vaccination_status = "Booster vaccinated";
		styleattrs 
				datacontrastcolors = (red blue ) 
				datasymbols=(diamondfilled squarefilled) 
				datalinepatterns=( solid longdash ) 
				datacolors=(red blue ) 
				;
	density	Days_since_vaccination / type=kernel 
						group=variant
						;
	xaxis
		label = "Days since vaccination" 
		min = 0
		max=100
		;
	yaxis label = "Density (%)" ;

	keylegend / Title="Variant"  position=topright location=inside across=1 noborder opaque;
run;

