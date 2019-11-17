/*******************************************************************************
| Name       : git_tools.sas
| Purpose    : Macros to help access code from github.
| SAS Version: 9.4
| Created By : Thomas Drury
| Date       : 15NOV19 
|
*******************************************************************************/;

%macro include_url(url=,
                   savefile=,
                   proxyname=,
                   proxyport=);
                   
  %*** SET UP FILE NAME ***;                 
  %if %length(&savefile.) = 0 %then %do;
    filename code1 temp;
  %end;
  %else %do;
    filename code1 &savefile.;
  %end;

  *** READ AND INCLUDE URL ***;
  proc http url       = "&url." 
            out       = code1
            %if %length(&proxyname.) ne 0 and %length(&proxyport.) ne 0 %then %do;
            proxyhost = "&proxyname."
            proxyport = &proxyport. 
            %end;;
  run;
  %include code1;

%mend;

/**/
/**** EXAMPLE CALL ***;*/
/*%include_url(url=%str(https://raw.githubusercontent.com/squiffy-statto/mvd_tools/master/mvd_tools.sas),*/
/*             savefile=,*/
/*             proxyname=%str(companyproxy.company.com),*/
/*             proxyport=800);*/










