function create_params

%set up breeding, migration and starvation threshold parameters. These
%are all completely made up!

%PARAM - structure containing values of all parameters governing agent
%behaviour for the current simulation

global PARAM

    PARAM.C_SPD=2;         %speed of movement - units per itn (copepod)
    PARAM.H_SPD=5;         %speed of movement - units per itn (herring)
    PARAM.C_BRDFQ=10;      %breeding frequency - iterations
    PARAM.H_BRDFQ=20;
    PARAM.C_MINFOOD=0;      %minimum food threshold before agent dies 
    PARAM.H_MINFOOD=0;
    PARAM.C_FOODBRD=10;     %minimum food threshold for breeding
    PARAM.H_FOODBRD=10;
    PARAM.C_MAXAGE=50;      %maximum age allowed 
    PARAM.H_MAXAGE=50;
    
    