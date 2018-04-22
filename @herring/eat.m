function [agt,eaten]=eat(agt,cn)

%eating function for class HERRING
%agt=herring object
%cn - current agent number
%eaten = 1 if herring successfully finds a copepod, =0 otherwise

%SUMMARY OF HERRING EAT RULE
%Herring calculates distance to all copepods
%Herring identifies nearest copepod(s)
%If more than one equidistant within search radius, one is randomly picked
%Probability of herring killing copepod =1 - distance of copepod/speed of
%herring
%If probability > rand, herring moves to copepod location and copepod is
%killed
%If herring does not kill copepods, its food is decremented by one unit

%GLOBAL VARIABLES
%N_IT is current iteration number
%IT_STATS is data structure containing statistics on model at each
%iteration (no. agents etc)
%MESSAGES is a data structure containing information that agents need to
%broadcast to each other
   %    MESSAGES.atype - n x 1 array listing the type of each agent in the model
   %    (1=copepod, 2=herring, 3=dead agent)
   %    MESSAGES.pos - list of every agent position in [x y]
   %    MESSAGE.dead - n x1 array containing ones for agents that have died
   %    in the current iteration
   
     
%Modified by D Walker 3/4/08

global  IT_STATS N_IT MESSAGES
   
pos=agt.pos;                        %extract current position 
cfood=agt.food;                     %get current agent food level
spd=agt.speed;                      %herring migration speed in units per iteration - this is equal to the food search radius
hungry=1;
eaten=0;

typ=MESSAGES.atype;                                         %extract types of all agents
cpds=find(typ==1);                                            %indices of all copepods
cpos=MESSAGES.pos(cpds,:);                                     %extract positions of all copepods
csep=sqrt((cpos(:,1)-pos(:,1)).^2+(cpos(:,2)-pos(:,2)).^2);  %calculate distance to all copepods
[d,ind]=min(csep);                                            %d is distance to closest copepod, ind is index of that copepod
nrst=cpds(ind);                                                %index of nearest copepod(s)

if d<=spd&length(nrst)>0    %if there is at least one copepod within the search radius        
    if length(nrst)>1       %if more than one copepod located at same distance then randomly pick one to head towards
        s=round(rand*(length(nrst)-1))+1;
        nrst=nrst(s);
    end
    pk=1-(d/spd);                       %probability that herring will kill copepod is ratio of speed to distance
    if pk>rand
        nx=MESSAGES.pos(nrst,1);    %extract exact location of this copepod
        ny=MESSAGES.pos(nrst,2);
        npos=[nx ny];    
        agt.food=cfood+1;           %increase agent food by one unit
        agt.pos=npos;               %move agent to position of this copepod
        IT_STATS.eaten(N_IT+1)=IT_STATS.eaten(N_IT+1)+1;                %update model statistics
        eaten=1;
        hungry=0;
        MESSAGES.dead(nrst)=1;       %send message to copepod so it knows it's dead!
    end
end
if hungry==1
    agt.food=cfood-1;     %if no food, then reduce agent food by one unit
end


   
