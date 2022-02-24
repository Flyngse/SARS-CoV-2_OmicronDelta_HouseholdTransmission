
*****
* Ct value distribution for primary cases - Histogram¨;

proc means data = data.Primary_cases_stat p10 q1 median q3 p95 mean maxdec=2 ;
	class variant ;
	var ct_value_index ;
run;

ods listing gpath = "F:\Projekter\FSEID00004942\FrederikPlesnerLyngse\Omnicron\Output_Revision1\" ;
ods graphics / reset=index imagename = "CT_value_PrimaryCase_Density" imagefmt=pdf ;
ods graphics on / attrpriority=none border=off ;
proc sgplot data = data.Primary_cases_stat ;
		styleattrs 
				datacontrastcolors = (red blue ) 
				datasymbols=(diamondfilled squarefilled) 
				datalinepatterns=( solid longdash ) 
				datacolors=(red blue ) 
				;
	density	ct_value_index / type=kernel 
						group=variant
						;
	xaxis
		values = (14 to 42 by 2 ) 
		label = "Ct Value" ;
		;
	yaxis label = "Density (%)" ;

	keylegend / Title="Variant"  position=topright location=inside across=1 noborder opaque;

run;

