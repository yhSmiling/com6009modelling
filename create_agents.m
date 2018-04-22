function [agent]=create_agents(nc,nh)

 %creates the objects representing each agent
 
%agent - cell array containing list of objects representing agents
%nc - number of copepods
%nh - number of herring

%global parameters
%ENV_DATA - data structure representing the environment (initialised in
%create_environment.m)
%MESSAGES is a data structure containing information that agents need to
%broadcast to each other
%PARAM - structure containing values of all parameters governing agent
%behaviour for the current simulation
 
 global ENV_DATA MESSAGES PARAM 
  
bm_size=ENV_DATA.bm_size;
cloc=((bm_size-1) / 2)*rand(nc,2)+1;     %generate random initial positions for copepods
hloc=((bm_size-1) / 2)*rand(nh,2)+1;      %generate random initial positions for herring

rand(nh,2)

MESSAGES.pos=[cloc;hloc];

%generate all copepod agents and record their positions in ENV_MAT_C
for c=1:nc
    pos=cloc(c,:);
    %create copepod agents with random ages between 0 and 10 days and random
    %food levels 20-40
    age=ceil(rand*10);
    food=ceil(rand*20)+20;
    lbreed=round(rand*PARAM.C_BRDFQ);
    agent{c}=copepod(age,food,pos,PARAM.C_SPD,lbreed);
end

%generate all herring agents and record their positions in ENV_MAT_H
for h=nc+1:nc+nh
    pos=hloc(h-nc,:);
    %create herring agents with random ages between 0 and 10 days and random
    %food levels 20-40
    age=ceil(rand*10);
    food=ceil(rand*20)+20;
    lbreed=round(rand*PARAM.H_BRDFQ);
    agent{h}=herring(age,food,pos,PARAM.H_SPD,lbreed);
end
