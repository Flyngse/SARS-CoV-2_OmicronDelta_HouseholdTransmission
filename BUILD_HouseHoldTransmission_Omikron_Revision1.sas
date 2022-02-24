********************************
	BUILD_HouseHoldTransmission - START
********************************;

********************************
	BUILD - START
********************************;

%let in = In04942 ;
libname Data "F:\Projekter\FSEID00004942\FrederikPlesnerLyngse\Omnicron\Data_Revision1\" ;

options compress = yes;
options obs = max ;
dm 'cle log' ;
options compress=yes ;


********;

/*
%let Update = 211214 ; %put &Update. ;
%let Update = 211215 ; %put &Update. ;
%let Update = 211216 ; %put &Update. ;
%let Update = 211217 ; %put &Update. ;
%let Update = 211218 ; %put &Update. ;
%let Update = 211219 ; %put &Update. ;
*/
%let Update = 220207 ; %put &Update. ;


**************;
** BUILD ;
**************;

* DATES ;
*%include "F:\Projekter\FSEID00004942\FrederikPlesnerLyngse\Omnicron\Build_Revision1\DATES, Build.sas" ;

* CPR ;
*%include "F:\Projekter\FSEID00004942\FrederikPlesnerLyngse\Omnicron\Build_Revision1\CPR, Build.sas" ;

* Households from CPR ;
*%include "F:\Projekter\FSEID00004942\FrederikPlesnerLyngse\Omnicron\Build_Revision1\Households, Build.sas" ;

* Vaccinations ;
%include "F:\Projekter\FSEID00004942\FrederikPlesnerLyngse\Omnicron\Build_Revision1\Vaccinations.sas" ;

* Variant-PCR ;
%include "F:\Projekter\FSEID00004942\FrederikPlesnerLyngse\Omnicron\Build_Revision1\VARIANT_PCR, Build.sas" ;

* WGS ;
%include "F:\Projekter\FSEID00004942\FrederikPlesnerLyngse\Omnicron\Build_Revision1\WGS, Build.sas" ;

* MIBA ;
%include "F:\Projekter\FSEID00004942\FrederikPlesnerLyngse\Omnicron\Build_Revision1\MIBA, Build.sas" ;

* Merge ;
%include "F:\Projekter\FSEID00004942\FrederikPlesnerLyngse\Omnicron\Build_Revision1\merge 2.sas" ;


**************;
** ANALYSIS ;
**************;

* Descriptive Statistics ;
%include "F:\Projekter\FSEID00004942\FrederikPlesnerLyngse\Omnicron\Analysis_Revision1\Descriptive Stats.sas" ;
%include "F:\Projekter\FSEID00004942\FrederikPlesnerLyngse\Omnicron\Analysis_Revision1\Descriptive Stats_crossTabs.sas" ;
* Overall descriptives;
%include "F:\Projekter\FSEID00004942\FrederikPlesnerLyngse\Omnicron\Analysis_Revision1\Overall Descriptives.sas" ;

* Sampling prob ;
%include "F:\Projekter\FSEID00004942\FrederikPlesnerLyngse\Omnicron\Analysis_Revision1\VariantPCR_prob of sampling by Ct value.sas" ;
%include "F:\Projekter\FSEID00004942\FrederikPlesnerLyngse\Omnicron\Analysis_Revision1\VariantPCR_prob of sampling by Age_TCDK.sas" ;

* Primary Case Ct Value ;
%include "F:\Projekter\FSEID00004942\FrederikPlesnerLyngse\Omnicron\Analysis_Revision1\Primary Case Ct Value.sas" ;

* Testing plots ;
%include "F:\Projekter\FSEID00004942\FrederikPlesnerLyngse\Omnicron\Analysis_Revision1\Prob Test.sas" ;
%include "F:\Projekter\FSEID00004942\FrederikPlesnerLyngse\Omnicron\Analysis_Revision1\Prob TestPCR.sas" ;
%include "F:\Projekter\FSEID00004942\FrederikPlesnerLyngse\Omnicron\Analysis_Revision1\Prob Test_14Days.sas" ;


* intra-household correlation of lineages ;
%include "F:\Projekter\FSEID00004942\FrederikPlesnerLyngse\Omnicron\Analysis_Revision1\Intra-household correlation of variants.sas" ;

* VALIDATION OF VARIANT PCR WITH WGS ;
%include "F:\Projekter\FSEID00004942\FrederikPlesnerLyngse\Omnicron\Analysis_Revision1\VALIDATION OF VARIANT PCR WITH WGS.sas" ;

* Density Days since vaccination_positive secondary cases ;
%include "F:\Projekter\FSEID00004942\FrederikPlesnerLyngse\Omnicron\Analysis_Revision1\Density Days since vaccination_positive secondary cases.sas" ;


*** Regression Estimates ;
* relative effect ;
%include "F:\Projekter\FSEID00004942\FrederikPlesnerLyngse\Omnicron\Analysis_Revision1\OR Estimates_relative effect.sas" ;

* model test ;
%include "F:\Projekter\FSEID00004942\FrederikPlesnerLyngse\Omnicron\Analysis_Revision1\OR model test.sas" ;

* extra specifications ;
%include "F:\Projekter\FSEID00004942\FrederikPlesnerLyngse\Omnicron\Analysis_Revision1\OR - Extra models.sas" ;


*@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	BUILD - END
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@;
