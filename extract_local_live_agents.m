function [loc_food,xmin,ymin]=extract_local_live_agents(agent,spd)

%Extracts array representing distribution of food available in the local
%area of an agent at position cpos [x,y] and with search radius =spd.
%This function also makes corrections in the case that the agent is close
%to the model edge

global ENV_DATA MESSAGES

typ=MESSAGES.atype;                                         %extract types of all agents
rb=find(typ==1|type==2);                                    %indices of all foxes + rabbits (live + dead)
rpos=MESSAGES.pos(rb,:);                                     %extract positions of all rabbits
csep=sqrt((rpos(:,1)-pos(:,1)).^2+(rpos(:,2)-pos(:,2)).^2);

%ENV_DATA is a data structure containing information about the model
   %environment
   %    ENV_DATA.shape - shape of environment - FIXED AS SQUARE
   %    ENV_DATA.units - FIXED AS KM
   %    ENV_DATA.bm_size - length of environment edge in km
   %    ENV_DATA.food is  a bm_size x bm_size array containing distribution
   %    of food

if cpos(1)>ENV_DATA.bm_size-spd
    xmax=ENV_DATA.bm_size;
else
    xmax=cpos(1)+spd;
end
if cpos(1)<spd+1
    xmin=1;
else
    xmin=cpos(1)-spd;
end
if cpos(2)>ENV_DATA.bm_size-spd
    ymax=ENV_DATA.bm_size;
else
    ymax=cpos(2)+spd;
end
if cpos(2)<spd+1
    ymin=1;
else
    ymin=cpos(2)-spd;
end

loc_food=ENV_DATA.food(xmin:xmax,ymin:ymax);    %extract distribution of food within the local search radius

